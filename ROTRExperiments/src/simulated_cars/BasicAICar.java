package simulated_cars;

import java.util.ArrayDeque;

import core_car_sim.AbstractCar;
import core_car_sim.Direction;
import core_car_sim.Point;
import core_car_sim.WorldSim;

public class BasicAICar extends AbstractCar {

	Direction toDrive;
	ArrayDeque<Direction> movement = new ArrayDeque<Direction>();
	public BasicAICar(Point startPos, int startingSpeed, Direction directionToDrive) 
	{
		super(startPos, startingSpeed, System.getProperty("user.dir") + "/resources/redcar.png");
		toDrive = directionToDrive;
	}

	@Override
	protected ArrayDeque<Direction> getSimulationRoute() 
	{
		for (int i = 0; i < getSpeed(); i++)
		{
			movement.add(toDrive);
		}
		return movement;
	}

	@Override
	protected boolean isFinished(Point arg0) 
	{
		return false;
	}

	@Override
	protected void visibleWorldUpdate(WorldSim arg0, Point arg1) 
	{
		
	}

}
