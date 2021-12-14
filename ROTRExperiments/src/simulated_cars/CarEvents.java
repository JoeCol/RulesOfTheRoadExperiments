package simulated_cars;

import core_car_sim.AbstractCell;
import core_car_sim.Point;
import simulated_cars.AbstractROTRCar.CarAction;
import simulated_cars.AbstractROTRCar.CarPriority;

public interface CarEvents 
{
	void worldUpdate(AbstractCell[][] world, Point location);
	void actionUpdate(CarAction action, CarPriority priority);
}
