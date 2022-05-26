package prologfiles;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import simulated_cars.AbstractROTRCar.CarBelief;
import simulated_cars.AbstractROTRCar.CarIntention;

public class RulesOfTheRoad
{
	public static final String runFile = ":- include('findactions')." + System.lineSeparator()
			+ ":- initialization(main)." + System.lineSeparator()
			+ System.lineSeparator()
			+ "main :- getRecommendedActions(standard,BELIEFS,INTENTIONS,Actions), write(Actions), halt(0).";
	
	public static class ROTROutcome
	{
		public String action;
		public boolean legalRequirement;
		
		public ROTROutcome(String _action, String _legalRequirement) 
		{
			action = _action;
			legalRequirement = _legalRequirement.equalsIgnoreCase("must");
		}
	}
	
	public static ArrayList<ROTROutcome> getROTRViolations(HashMap<CarBelief, Boolean> beliefs, HashMap<CarIntention, Boolean> intentions)
	{
		ArrayList<ROTROutcome> toreturn = new ArrayList<ROTROutcome>();
		String fileLocation = System.getProperty("user.dir") + "/src/prologfiles/runrotr.pl";
		StringBuilder bai = new StringBuilder();
		bai.append("[");
		boolean start = true;
		for (Entry<CarBelief, Boolean> c : beliefs.entrySet())
		{
			if (c.getValue())
			{
				if (!start)
				{
					bai.append(",");
				}
				bai.append(c.getKey().toString());
				start = false;
			}
		}
		bai.append("]");
		String toWrite = runFile.replace("BELIEFS", bai.toString());
		
		bai.setLength(0);
		bai.append("[");
		start = true;
		for (Entry<CarIntention, Boolean> c : intentions.entrySet())
		{
			if (c.getValue())
			{
				if (!start)
				{
					bai.append(",");
				}
				bai.append(c.getKey().toString());
				start = false;
			}
		}
		bai.append("]");
		toWrite = toWrite.replace("INTENTIONS", bai.toString());
		System.out.println(toWrite);
		//$PATH of pb does not resolve properly on MacOS
		ProcessBuilder pb = new ProcessBuilder("/Applications/SWI-Prolog.app/Contents/MacOS/swipl", fileLocation);
		try {
			PrintWriter out = new PrintWriter(fileLocation);
			out.print(toWrite);
			out.close();
			Process p = pb.start();
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
			
			String line = reader.readLine();
			System.out.println("\n" + line);
			String[] s = line.substring(1, line.length() - 1).split(",");
			String[] item;
			for (int i = 0; i < s.length; i++)
			{
				item = s[i].split("-");
				toreturn.add(new ROTROutcome(item[1],item[0]));
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
		}
		return toreturn;
	}
}
