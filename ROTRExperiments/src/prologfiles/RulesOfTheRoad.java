package prologfiles;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class RulesOfTheRoad
{
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
	
	public static ArrayList<ROTROutcome> getROTRViolations(ArrayList<String> beliefs, ArrayList<String> intentions)
	{
		ArrayList<ROTROutcome> toreturn = new ArrayList<ROTROutcome>();
		String example = "runrotr.pl";
		ProcessBuilder pb = new ProcessBuilder(new String[] {"swipl", example});
		try {
			Process p = pb.start();
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
			
			String line = reader.readLine();
			String[] s = line.substring(1, line.length() - 1).split(",");
			for (int i = 0; i < s.length; i++)
			{
				toreturn.add(new ROTROutcome(s[0],s[1]));
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
		}
		return toreturn;
	}
}
