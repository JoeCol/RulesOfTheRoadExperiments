package simulated_cars;

import java.util.ArrayDeque;

import core_car_sim.AbstractCar;
import core_car_sim.AbstractCell;
import core_car_sim.Direction;
import core_car_sim.Point;

public class ReactiveCar extends AbstractCar {

	public ReactiveCar(Point startPos, int startingSpeed, String fileImage) {
		super(startPos, startingSpeed, fileImage);
		// TODO Auto-generated constructor stub
	}

	@Override
	protected ArrayDeque<Direction> getSimulationRoute() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected boolean isFinished(Point arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	protected void visibleWorldUpdate(AbstractCell[][] arg0, Point arg1) {
		// TODO Auto-generated method stub

	}

}
