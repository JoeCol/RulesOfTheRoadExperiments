package simulated_cars;

import java.util.ArrayDeque;

import core_car_sim.AbstractCell;
import core_car_sim.AbstractCell.CellType;
import core_car_sim.Direction;
import core_car_sim.Point;
import core_car_sim.TrafficLightCell;
import prologfiles.RulesOfTheRoad.ROTROutcome;

public class ReactiveCar extends AbstractROTRCar
{
	private boolean haveMoved = false;
	ArrayDeque<Direction> movement = new ArrayDeque<Direction>();
	//Intentions
	boolean approachingTrafficLight = false;
	boolean setOff = false;
	
	//Beliefs that are true
	boolean vehicleSafe = true;
	boolean canReadNumberPlate = true;
	boolean routePlanned = true;
	boolean allPassengersWearingSeatBeltsAsRequired = true;
	boolean allChildrenUsingChildSeatAsRequired = true;
	
	//Beliefs that are used for traffic lights
	boolean lightRed = false;
	boolean lightAmber = false;
	boolean lightGreen = false;
	boolean exitClear = true; //always true
	boolean atTrafficLight = false;
	
	//Other beliefs
	boolean atWhiteLine = false;
	
	public ReactiveCar(Point startPos, int startingSpeed)
	{
		super(startPos, startingSpeed, System.getProperty("user.dir") + "/resources/bluecar.png");
		
	}

	@Override
	protected ArrayDeque<Direction> getSimulationRoute()
	{
		intentions.clear();
		beliefs.clear();
		updateIntentions();
		updateBeliefs();
		updateOutcomes();
		movement.add(Direction.north);
		for (ROTROutcome outcome : rulesOfTheRoad)
		{
			switch(outcome.action)
			{
				case "wait_until_route_clear":
					if (exitClear)
					{
						setSpeed(1);
					}
					else
					{
						setSpeed(0);
						movement.pop();
					}
					break;
				case "stop_at_white_line":
					if (!atWhiteLine)
					{
						setSpeed(1);
					}
					else
					{
						setSpeed(0);
						setOff = true;
						movement.pop();
					}
					break;
			}
		}
		haveMoved = true;
		return movement;
	}

	private void updateBeliefs() 
	{
		beliefs.add("vehicleSafe");
		beliefs.add("canReadNumberPlate");
		beliefs.add("routePlanned");
		beliefs.add("allPassengersWearingSeatBeltsAsRequired");
		beliefs.add("allChildrenUsingChildSeatAsRequired");
		if (lightRed)
		{
			beliefs.add("lightRed");
		}
		
		if (lightAmber)
		{
			beliefs.add("lightAmber");
		}
		
		if (lightGreen)
		{
			beliefs.add("lightGreen");
		}
		
		if (atTrafficLight)
		{
			beliefs.add("atTrafficLight");
		}
		
	}

	private void updateIntentions() 
	{
		if (approachingTrafficLight)
		{
			intentions.add("approachingTrafficLight");
		}
		
		if (setOff = false)
		{
			intentions.add("setOff");
		}
	}

	@Override
	protected boolean isFinished(Point arg0)
	{
		return haveMoved && arg0 == getStartingPosition();
	}

	@Override
	protected void visibleWorldUpdate(AbstractCell[][] world, Point location)
	{
		//Update beliefs for the rules of the road section
		//Find traffic lights
		approachingTrafficLight = false;
		atTrafficLight = false; //inline with traffic light
		atWhiteLine = false;		
		lightRed = false;
		lightAmber = false;
		lightGreen = false;
		for (int y = 0; y < world.length; y++)
		{
			for (int x = 0; x < world[y].length; x++)
			{
				if (world[y][x].getCellType() == CellType.ct_information)
				{
					TrafficLightCell t = (TrafficLightCell)world[y][x];
					//Traffic light is in front of car
					approachingTrafficLight = y < location.getY();
					atTrafficLight = y == location.getY(); //inline with traffic light
					atWhiteLine = y == location.getY();		
					lightRed = t.getInformation().redOn;
					lightAmber = t.getInformation().yellowOn;
					lightGreen = t.getInformation().greenOn;
				}
			}
		}
		/*member(approachingTrafficLight,I), (member(lightRed,B); member(lightAmber,B)), \+member(unableToStopByWhiteLine,B);
		member(setOff,I), member(atTrafficLight, B), (\+member(lightGreen,B); \+member(exitClear,B));*/
	}

}
