package prologfiles;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;

public class RulesOfTheRoad
{
	public static final String runFile = ":- include('findactions')." + System.lineSeparator()
			+ ":- initialization(main)." + System.lineSeparator()
			+ System.lineSeparator()
			+ "main :- getActions(standard,BELIEFS,INTENTIONS,Actions), write(Actions), halt(0).";
	
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
		String fileLocation = "src/prologfiles/runrotr.pl";
		String toWrite = runFile.replace("BELIEFS", beliefs.toString()).replace("INTENTIONS", intentions.toString());
		
		ProcessBuilder pb = new ProcessBuilder(new String[] {"swipl", fileLocation});
		try {
			PrintWriter out = new PrintWriter(fileLocation);
			out.print(toWrite);
			out.close();
			Process p = pb.start();
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
			
			String line = reader.readLine();
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
