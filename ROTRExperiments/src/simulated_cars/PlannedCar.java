package simulated_cars;

import java.util.ArrayDeque;
import java.util.Collection;
import java.util.HashSet;

import core_car_sim.AbstractCell;
import core_car_sim.Direction;
import core_car_sim.Point;
import prologfiles.RulesOfTheRoad.ROTROutcome;

public class PlannedCar extends AbstractROTRCar
{

	public PlannedCar(Point startPos, int startingSpeed, String fileImage)
	{
		super(startPos, startingSpeed, fileImage);
		// TODO Auto-generated constructor stub
	}

	@Override
	protected ArrayDeque<Direction> getSimulationRoute()
	{
		updateOutcomes();
		HashSet<ROTROutcome> currentIssues = new HashSet<ROTROutcome>(rulesOfTheRoad);
		//Update beliefs for future
		updateOutcomes(); //get future rules of the road
		HashSet<ROTROutcome> futureIssues = new HashSet<ROTROutcome>(rulesOfTheRoad);
		futureIssues.removeAll(currentIssues);
		
		//Is there any current issue to deal with
		
		//Would that action pose a problem in the future
		
		//if not advance forward.
		return null;
	}

	@Override
	protected boolean isFinished(Point arg0)
	{
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	protected void visibleWorldUpdate(AbstractCell[][] arg0, Point arg1)
	{
		beliefs.clear();
		intentions.clear();
	}

}
