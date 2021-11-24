package prologfiles;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class RulesOfTheRoad
{
	public class ROTROutcome
	{
		String action;
		boolean legalRequirement;
	}
	
	public static ArrayList<ROTROutcome> getROTRViolations(String[] beliefs, String[] intentions)
	{
		ProcessBuilder pb = new ProcessBuilder(new String[] {"swipl", example});
		try {
			Process p = pb.start();
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
			
			String line = reader.readLine();
			String[] s = line.substring(1, line.length() - 1).split(",");
			for (int i = 0; i < s.length; i++)
			{
				
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
		}
		return null;
	}
}
