package simulated_cars;

import core_car_sim.Point;
import core_car_sim.WorldSim;
import simulated_cars.AbstractROTRCar.CarAction;
import simulated_cars.AbstractROTRCar.CarPriority;

public interface CarEvents 
{
	void worldUpdate(WorldSim world, Point location);
	void actionUpdate(CarAction action, CarPriority priority);
}
