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
	
	public class CarBeliefsIntentions
	{
		public boolean I_approachingTrafficLight; 
		public boolean B_lightRed;
		public boolean B_lightAmber;
		public boolean B_unableToStopByWhiteLine;
		
		public boolean I_setOff;
		public boolean B_atTrafficLight;
		public boolean B_lightGreen;
		public boolean B_exitClear;
		
		public boolean B_vehicleSafe = true;
		public boolean B_canReadNumberPlate = true;
		public boolean B_routePlanned = true;
		public boolean B_allPassengersWearingSeatBeltsAsRequired = true;
		public boolean B_allChildrenUsingChildSeatAsRequired = true;
	}
	
	public CarBeliefsIntentions cbi = new CarBeliefsIntentions();
	
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
