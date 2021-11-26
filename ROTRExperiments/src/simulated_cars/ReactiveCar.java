package simulated_cars;

import java.util.ArrayDeque;

import core_car_sim.AbstractCell;
import core_car_sim.Direction;
import core_car_sim.Point;
import prologfiles.RulesOfTheRoad.ROTROutcome;

public class ReactiveCar extends AbstractROTRCar
{
	private boolean haveMoved = false;
	ArrayDeque<Direction> movement = new ArrayDeque<Direction>();
	
	public ReactiveCar(Point startPos, int startingSpeed)
	{
		super(startPos, startingSpeed, System.getProperty("user.dir") + "/resources/bluecar.png");
		this.beliefs.add("vehicleSafe");
		this.beliefs.add("canReadNumberPlate");
		this.beliefs.add("routePlanned");
		this.beliefs.add("allPassengersWearingSeatBeltsAsRequired");
		this.beliefs.add("allChildrenUsingChildSeatAsRequired");
	}

	@Override
	protected ArrayDeque<Direction> getSimulationRoute()
	{
		updateOutcomes();
		for (ROTROutcome outcome : rulesOfTheRoad)
		{
			switch(outcome.action)
			{
				case "wait_until_route_clear":
					break;
				case "stop_at_white_line":
					break;
			}
		}
		haveMoved = true;
		return null;
	}

	@Override
	protected boolean isFinished(Point arg0)
	{
		return haveMoved && arg0 == getStartingPosition();
	}

	@Override
	protected void visibleWorldUpdate(AbstractCell[][] arg0, Point arg1)
	{
		//Update beliefs for the rules of the road section
		member(approachingTrafficLight,I), (member(lightRed,B); member(lightAmber,B)), \+member(unableToStopByWhiteLine,B);
		member(setOff,I), member(atTrafficLight, B), (\+member(lightGreen,B); \+member(exitClear,B));
		beliefs.clear();
		intentions.clear();
	}

}
