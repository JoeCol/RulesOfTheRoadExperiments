package experiment_files;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JSpinner;
import javax.swing.SpinnerNumberModel;

import core_car_sim.AbstractCar;
import core_car_sim.CarAddedListener;
import core_car_sim.Direction;
import core_car_sim.LoadWorld;
import core_car_sim.Point;
import core_car_sim.WorldSim;
import simulated_cars.BasicAICar;
import simulated_cars.ReactiveCar;
import simulated_cars.RudeCar;

import javax.swing.JComboBox;
import javax.swing.DefaultComboBoxModel;


public class RunExperiment
{
	public class Simulate implements Runnable
	{
		int delay = 0;
		int until = 0;
		int stepsSimulated = 0;
		public boolean finished = false;
		
		public Simulate(int delayTime, int noOfSteps)
		{
			delay = delayTime;
			until = noOfSteps;
		}
		
		@Override
		public void run()
		{
			int i = 0;
			
			while (!finished)
			{
				simworld.simulate(1);
				try
				{
					Thread.sleep(delay);
				} catch (InterruptedException e)
				{
					e.printStackTrace();
				}
				updateGUIWorld();
				lblNewLabel.setText("Steps simulated: " + ++stepsSimulated);
				if (!finished)
				{
					finished = until == 0 ? simworld.allFinished() : until == ++i;
				}
			}
		}
		
	};
	
	private JFrame frame;
	private JLabel lblNewLabel;
	private WorldSim simworld;
	private JPanel pnlWorld = new JPanel();
	private JComboBox<String> cbAI = new JComboBox<String>();
	private Executor simulationThread = Executors.newSingleThreadExecutor();
	private CarAddedListener cal;
	private Simulate currentlyRunning = null;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					RunExperiment window = new RunExperiment();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public RunExperiment() {
		initialize();
		cal = new CarAddedListener() {
			@Override
			public AbstractCar createCar(String name, Point startingLoca)
			{
				if (name.equalsIgnoreCase("slow"))
				{
					return new BasicAICar(startingLoca, 1, Direction.north);
				}
				else
				{
					if (cbAI.getSelectedItem() == "Reactive")
					{
						return new ReactiveCar(startingLoca, 1);
					}
					else
					{
						return new RudeCar(startingLoca, 1);
					}
				}
			}
	
			@Override
			public AbstractCar createCar(String name, Point startingLoca, String[] information)
			{
				if (name.equalsIgnoreCase("slow"))
				{
					return new BasicAICar(startingLoca, 1, Direction.valueOf(information[0]));
				}
				else
				{
					if (cbAI.getSelectedItem() == "Reactive")
					{
						return new ReactiveCar(startingLoca, 1);
					}
					else
					{
						return new RudeCar(startingLoca, 1);
					}
				}
			}
		};
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 966, 615);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JPanel panel = new JPanel();
		FlowLayout flowLayout = (FlowLayout) panel.getLayout();
		flowLayout.setAlignment(FlowLayout.LEFT);
		frame.getContentPane().add(panel, BorderLayout.NORTH);
		
		JButton btnNewButton = new JButton("Load Overtaking");
		panel.add(btnNewButton);
		
		JButton btnNewButton_2 = new JButton("Load Traffic Light");
		btnNewButton_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					BufferedReader br = new BufferedReader(new FileReader(System.getProperty("user.dir") + "/src/simulated_cars/TrafficLightExperiment.txt"));
					simworld = LoadWorld.loadWorldFromFile(br, cal);
					pnlWorld.setLayout(new GridLayout(simworld.getHeight(), simworld.getWidth(), 1, 1));
					updateGUIWorld();
					
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		panel.add(btnNewButton_2);
		
		JButton btnNewButton_3 = new JButton("Load Turn Right");
		btnNewButton_3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					BufferedReader br = new BufferedReader(new FileReader(System.getProperty("user.dir") + "/src/simulated_cars/TurnRightExperiment.txt"));
					simworld = LoadWorld.loadWorldFromFile(br, cal);
					pnlWorld.setLayout(new GridLayout(simworld.getHeight(), simworld.getWidth(), 1, 1));
					updateGUIWorld();
					
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		panel.add(btnNewButton_3);
		
		cbAI.setModel(new DefaultComboBoxModel<String>(new String[] {"Reactive", "Must Only"}));
		cbAI.setSelectedIndex(0);
		panel.add(cbAI);
		
		JButton btnNewButton_1 = new JButton("Run Simulation");
		panel.add(btnNewButton_1);
		
		ButtonGroup bg = new ButtonGroup();
		
		JRadioButton rdbtnNewRadioButton = new JRadioButton("until finished");
		rdbtnNewRadioButton.setSelected(true);
		panel.add(rdbtnNewRadioButton);
		bg.add(rdbtnNewRadioButton);
		
		JRadioButton rdbtnNewRadioButton_1 = new JRadioButton("set number");
		panel.add(rdbtnNewRadioButton_1);
		bg.add(rdbtnNewRadioButton_1);
		
		JSpinner spinner = new JSpinner(new SpinnerNumberModel(1, 1, 10000, 1));
		panel.add(spinner);
		
		lblNewLabel = new JLabel("New label");
		panel.add(lblNewLabel);
	
		frame.getContentPane().add(pnlWorld, BorderLayout.CENTER);
		pnlWorld.setLayout(new GridLayout(3, 3, 0, 0));
		
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					BufferedReader br = new BufferedReader(new FileReader(System.getProperty("user.dir") + "/src/simulated_cars/OvertakingExperiment.txt"));
					simworld = LoadWorld.loadWorldFromFile(br, cal);
					pnlWorld.setLayout(new GridLayout(simworld.getHeight(), simworld.getWidth(), 1, 1));
					updateGUIWorld();
					
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		
		btnNewButton_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
				if (currentlyRunning == null)
				{
					if (rdbtnNewRadioButton.isSelected())
					{
						currentlyRunning = new Simulate(250, 0);
						
					}
					else
					{
						currentlyRunning = new Simulate(250, (Integer)spinner.getValue());
					}
					simulationThread.execute(currentlyRunning);
				}
				else
				{
					currentlyRunning.finished = true;
					currentlyRunning = null;
				}
			}
		});
	}
	
	private void updateGUIWorld()
	{
		pnlWorld.removeAll();
		for (int y = 0; y < simworld.getHeight(); y++)
		{
			for (int x = 0; x < simworld.getWidth(); x++)
			{
				simworld.getCell(x, y).removeAll();
				pnlWorld.add(simworld.getCell(x, y));
			}
		}
		for (AbstractCar car : simworld.getCars())
		{
			Point p = simworld.getCarPosition(car);
			JLabel icon = new JLabel(car.getCarIcon());
			icon.setSize(simworld.getCell(p.getX(), p.getY()).getWidth(), simworld.getCell(p.getX(), p.getY()).getHeight());
			simworld.getCell(p.getX(), p.getY()).add(icon);
		}
		pnlWorld.revalidate();
		pnlWorld.repaint();
	}
}
