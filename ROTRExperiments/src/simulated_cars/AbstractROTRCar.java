package simulated_cars;

import java.util.ArrayList;

import core_car_sim.AbstractCar;
import core_car_sim.Point;
import prologfiles.RulesOfTheRoad;
import prologfiles.RulesOfTheRoad.ROTROutcome;

public abstract class AbstractROTRCar extends AbstractCar
{
	ArrayList<ROTROutcome> rulesOfTheRoad = new ArrayList<ROTROutcome>();
	ArrayList<String> beliefs = new ArrayList<String>();
	ArrayList<String> intentions = new ArrayList<String>();
	
	public AbstractROTRCar(Point startPos, int startingSpeed, String fileImage)
	{
		super(startPos, startingSpeed, fileImage);
		// TODO Auto-generated constructor stub
	}

	public void updateOutcomes()
	{
		rulesOfTheRoad = RulesOfTheRoad.getROTRViolations(beliefs, intentions);
		for (ROTROutcome rotr : rulesOfTheRoad)
		{
			switch(rotr.action)
			{
				case "":
					break;
			}
		}
	}
}
