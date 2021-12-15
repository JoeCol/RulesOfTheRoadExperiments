package simulated_cars;

import java.util.ArrayDeque;

import core_car_sim.AbstractCell;
import core_car_sim.AbstractCell.CellType;
import core_car_sim.Direction;
import core_car_sim.Point;
import core_car_sim.TrafficLightCell;
import prologfiles.RulesOfTheRoad.ROTROutcome;
import simulated_cars.AbstractROTRCar.CarBelief;

public class ReactiveCar extends AbstractROTRCar implements CarEvents
{
	private boolean haveMoved = false;
	ArrayDeque<Direction> movement = new ArrayDeque<Direction>();
	
	public ReactiveCar(Point startPos, int startingSpeed)
	{
		super(startPos, startingSpeed, System.getProperty("user.dir") + "/resources/bluecar.png");
		addCarEventListener(this);
	}

	@Override
	protected ArrayDeque<Direction> getSimulationRoute()
	{
		intentions.clear();
		beliefs.clear();
		updateOutcomes();
		movement.add(Direction.north);
		haveMoved = true;
		return movement;
	}

	@Override
	protected boolean isFinished(Point arg0)
	{
		return haveMoved && arg0 == getStartingPosition();
	}

	/*@Override
	protected void visibleWorldUpdate(AbstractCell[][] world, Point location)
	{
		//Update beliefs for the rules of the road section
		//Find traffic lights
		approachingTrafficLight = false;
		atTrafficLight = false; //inline with traffic light
		atWhiteLine = false;		
		lightRed = false;
		lightAmber = false;
		lightGreen = false;
		for (int y = 0; y < world.length; y++)
		{
			for (int x = 0; x < world[y].length; x++)
			{
				if (world[y][x].getCellType() == CellType.ct_information)
				{
					TrafficLightCell t = (TrafficLightCell)world[y][x];
					//Traffic light is in front of car
					approachingTrafficLight = y < location.getY();
					atTrafficLight = y == location.getY(); //inline with traffic light
					atWhiteLine = y == location.getY();		
					lightRed = t.getInformation().redOn;
					lightAmber = t.getInformation().yellowOn;
					lightGreen = t.getInformation().greenOn;
				}
			}
		}
		/*member(approachingTrafficLight,I), (member(lightRed,B); member(lightAmber,B)), \+member(unableToStopByWhiteLine,B);
		member(setOff,I), member(atTrafficLight, B), (\+member(lightGreen,B); \+member(exitClear,B));*/
	//}

	@Override
	public void worldUpdate(AbstractCell[][] world, Point location) 
	{
		updateBeliefs(world, location);		
	}

	@Override
	public void actionUpdate(CarAction action, CarPriority priority) 
	{
		switch(action)
		{
		case CA_adjust_speed:
			break;
		case CA_allow_cyclists_moto_pass:
			break;
		case CA_allow_emergency_vehicle_to_pass:
			break;
		case CA_allow_extra_space:
			break;
		case CA_allow_extra_space_for_works_vehicles:
			break;
		case CA_allow_traffic_to_pass:
			break;
		case CA_allow_undertaking:
			break;
		case CA_allowed_to_proceed:
			break;
		case CA_approach_left_hand_lane:
			break;
		case CA_approach_with_caution:
			break;
		case CA_avoidLaneChanges:
			break;
		case CA_avoidRightHandLane:
			break;
		case CA_avoid_blocking_sideroads:
			break;
		case CA_avoid_bus_lane:
			break;
		case CA_avoid_closed_lane:
			break;
		case CA_avoid_coasting:
			break;
		case CA_avoid_coned_off_area:
			break;
		case CA_avoid_crossing_central_reservation:
			break;
		case CA_avoid_crossing_crossing:
			break;
		case CA_avoid_crossing_level_crossing:
			break;
		case CA_avoid_cutting_corner:
			break;
		case CA_avoid_drive_against_traffic_flow:
			break;
		case CA_avoid_driving_on_rails:
			break;
		case CA_avoid_emergency_area:
			break;
		case CA_avoid_hard_shoulder:
			break;
		case CA_avoid_harsh_braking:
			break;
		case CA_avoid_horn:
			break;
		case CA_avoid_hov_lane:
			break;
		case CA_avoid_lane_lane:
			break;
		case CA_avoid_lane_switching:
			break;
		case CA_avoid_level_crossing:
			break;
		case CA_avoid_loading_unloading:
			break;
		case CA_avoid_motorway:
			break;
		case CA_avoid_non:
			break;
		case CA_avoid_overtaking:
			break;
		case CA_avoid_overtaking_on_left:
			break;
		case CA_avoid_parking:
			break;
		case CA_avoid_parking_against_flow:
			break;
		case CA_avoid_pick_up_set_down:
			break;
		case CA_avoid_reversing:
			break;
		case CA_avoid_revs:
			break;
		case CA_avoid_stopping:
			break;
		case CA_avoid_tram_reserved_road:
			break;
		case CA_avoid_undertaking:
			break;
		case CA_avoid_uturn:
			break;
		case CA_avoid_waiting:
			break;
		case CA_avoid_weaving:
			break;
		case CA_brake_early_lightly:
			break;
		case CA_brake_hard:
			break;
		case CA_buildup_speed_on_motorway:
			break;
		case CA_cancel_overtaking:
			break;
		case CA_cancel_reverse:
			break;
		case CA_cancel_signals:
			break;
		case CA_cancel_undertaking:
			break;
		case CA_clear_ice_snow_all_windows:
			break;
		case CA_close_to_kerb:
			break;
		case CA_consideration_others:
			break;
		case CA_doNotEnterWhiteDiagonalStripeWhiteBrokenBorder:
			break;
		case CA_doNotEnterWhiteDiagonalStripeWhiteSolidBorder:
			break;
		case CA_do_not_drive:
			break;
		case CA_do_not_hestitate:
			break;
		case CA_do_not_overtake:
			break;
		case CA_do_not_park_in_passing_place:
			break;
		case CA_do_not_reverse:
			break;
		case CA_do_not_stop:
			break;
		case CA_dontExceedTempSpeedLimit:
			break;
		case CA_dont_cross_solid_white:
			break;
		case CA_dont_use_central_reservation:
			break;
		case CA_drive_care_attention:
			break;
		case CA_drive_slowly:
			break;
		case CA_drive_very_slowly:
			break;
		case CA_drive_very_slowly_on_bends:
			break;
		case CA_drop_back:
			break;
		case CA_dry_brakes:
			break;
		case CA_ease_off:
			break;
		case CA_engage_child_locks:
			break;
		case CA_engage_parking_break:
			break;
		case CA_engine_off:
			break;
		case CA_find_other_route:
			break;
		case CA_find_quiet_side_road:
			break;
		case CA_find_safe_place_to_stop:
			break;
		case CA_fit_booster_seat:
			break;
		case CA_flash_amber_beacon:
			break;
		case CA_fog_lights_off:
			break;
		case CA_fog_lights_on:
			break;
		case CA_followLaneSigns:
			break;
		case CA_follow_dvsa_until_stopped:
			break;
		case CA_follow_police_direction:
			break;
		case CA_follow_sign:
			break;
		case CA_follow_signs:
			break;
		case CA_get_in_lane:
			break;
		case CA_get_into_lane:
			break;
		case CA_get_off_road:
			break;
		case CA_give_extensive_extra_seperation_distance:
			break;
		case CA_give_extra_seperation_distance:
			break;
		case CA_give_priority_to_public_transport:
			break;
		case CA_give_priority_to_right:
			break;
		case CA_give_room_when_passing:
			break;
		case CA_give_signal:
			break;
		case CA_give_up_control:
			break;
		case CA_give_way_at_dotted_white_line:
			break;
		case CA_give_way_other_roads:
			break;
		case CA_give_way_to_other:
			break;
		case CA_give_way_to_pedestrians:
			break;
		case CA_give_way_to_tram:
			break;
		case CA_goBetweenLaneDividers:
			break;
		case CA_go_to_left_hand_land:
			break;
		case CA_going_left_use_left:
			break;
		case CA_going_right_use_left:
			break;
		case CA_handbrake_on:
			break;
		case CA_headlights_on:
			break;
		case CA_increase_distance_to_car_infront:
			break;
		case CA_indicatorOn:
			break;
		case CA_indicator_on:
			break;
		case CA_keep_crossing_clear:
			break;
		case CA_keep_left:
			break;
		case CA_keep_left_lane:
			break;
		case CA_keep_safe_distance:
			break;
		case CA_keep_sidelights_on:
			break;
		case CA_keep_under_speed_limit:
			break;
		case CA_keep_well_back:
			break;
		case CA_lane_clear:
			break;
		case CA_leave_space_for_manover:
			break;
		case CA_leave_space_to_stop:
			break;
		case CA_light_and_number_plates_clean:
			break;
		case CA_lock:
			break;
		case CA_maintained_reduced_speed:
			break;
		case CA_match_speed_to_motorway:
			break;
		case CA_mergeInTurn:
			break;
		case CA_merge_in_turn:
			break;
		case CA_mini:
			break;
		case CA_minimise_reversing:
			break;
		case CA_mirrors_clear:
			break;
		case CA_move_adjacent_lane:
			break;
		case CA_move_left:
			break;
		case CA_move_quickly_past:
			break;
		case CA_move_to_left_hand_lane:
			break;
		case CA_must_stop_pedestrian_crossing:
			break;
		case CA_nextLaneClear:
			break;
		case CA_next_safe_stop:
			break;
		case CA_not_drive_dangerously:
			break;
		case CA_not_overtaken:
			break;
		case CA_obey_signal:
			break;
		case CA_obey_work_vehicle_sign:
			break;
		case CA_overtake_on_right:
			break;
		case CA_park_as_close_to_side:
			break;
		case CA_parking_lights_on:
			break;
		case CA_pass_around:
			break;
		case CA_position_right_turn:
			break;
		case CA_prepare_drop_back:
			break;
		case CA_prepare_load:
			break;
		case CA_prepare_route:
			break;
		case CA_prepare_to_change_lane:
			break;
		case CA_prepare_to_stop:
			break;
		case CA_priority_to_motoway_traffic:
			break;
		case CA_pull_into_hard_shoulder:
			break;
		case CA_pull_into_passing_place:
			break;
		case CA_pull_over_safe_place:
			break;
		case CA_pull_up_in_visible_distance:
			break;
		case CA_put_on_seatbelts:
			break;
		case CA_reduce_distance_between_front_vehicle:
			break;
		case CA_reduce_lighting:
			break;
		case CA_reduce_overall_speed:
			break;
		case CA_reduce_speed:
			break;
		case CA_reduce_speed_if_pedestrians:
			break;
		case CA_reduce_speed_on_slip_road:
			break;
		case CA_release_brake:
			break;
		case CA_remove_all_snow:
			break;
		case CA_remove_flash_intention:
			break;
		case CA_remove_horn_intention:
			break;
		case CA_reverse_into_drive:
			break;
		case CA_reverse_to_passing_place:
			break;
		case CA_road_clear_to_manover:
			break;
		case CA_safe_distance:
			break;
		case CA_safe_pull_over_and_stop:
			break;
		case CA_select_lane:
			break;
		case CA_set_hazards_off:
			break;
		case CA_set_headlights_to_dipped:
			break;
		case CA_signal:
			break;
		case CA_signal_left:
			break;
		case CA_signal_left_on_exit:
			break;
		case CA_signal_right:
			break;
		case CA_slow_down:
			break;
		case CA_slow_down_and_stop:
			break;
		case CA_space_for_vehicle:
			break;
		case CA_stay_in_lane:
			break;
		case CA_stay_on_running_lane:
			break;
		case CA_steady_speed:
			break;
		case CA_stop:
			break;
		case CA_stopCrossDoubleWhiteClosestSolid:
			break;
		case CA_stopCrossingHazardWarningLine:
			break;
		case CA_stop_and_turn_engine_off:
			break;
		case CA_stop_at_crossing:
			break;
		case CA_stop_at_crossing_patrol:
			break;
		case CA_stop_at_sign:
			break;
		case CA_stop_at_white_line:
			break;
		case CA_switch_off_engine:
			break;
		case CA_travel_sign_direction:
			break;
		case CA_treat_as_roundabout:
			break;
		case CA_treat_as_traffic_light:
			break;
		case CA_turn_foglights_off:
			break;
		case CA_turn_into_skid:
			break;
		case CA_turn_sidelights_on:
			break;
		case CA_use_central_reservation:
			break;
		case CA_use_crawler_lane:
			break;
		case CA_use_demisters:
			break;
		case CA_use_hazard_lights:
			break;
		case CA_use_left_indicator:
			break;
		case CA_use_right_indicator:
			break;
		case CA_use_road:
			break;
		case CA_use_signals:
			break;
		case CA_use_tram_passing_lane:
			break;
		case CA_use_windscreen_wipers:
			break;
		case CA_wait_at_advanced_stop:
			break;
		case CA_wait_at_first_white_line:
			break;
		case CA_wait_for_gap_before_moving_off:
			break;
		case CA_wait_until_clear:
			break;
		case CA_wait_until_route_clear:
			break;
		case CA_wait_until_safe_gap:
			break;
		case CA_wheel_away_from_kerb:
			break;
		case CA_wheel_toward_from_kerb:
			break;
		default:
			break;
		}
		
	}
	
	public void updateBeliefs(AbstractCell[][] world, Point location)
	{
		for (CarBelief cb : CarBelief.values())
		{
			switch(cb)
			{
			case CB_allChildrenUsingChildSeatAsRequired:
				beliefs.put(cb, true);
				break;
			case CB_allPassengersWearingSeatBeltsAsRequired:
				beliefs.put(cb, true);
				break;
			case CB_approachingCorner:
				break;
			case CB_atTrafficLight:
				break;
			case CB_behindWantToOvertake:
				break;
			case CB_bendInRoad:
				break;
			case CB_brokendown:
				break;
			case CB_canReadNumberPlate:
				beliefs.put(cb, true);
				break;
			case CB_canStopBeforeCarInFrontStops:
				break;
			case CB_carTowardsYou:
				break;
			case CB_carriageway:
				break;
			case CB_centerLine:
				break;
			case CB_clearRoadAhead:
				break;
			case CB_clearToManover:
				break;
			case CB_clearToTurnOff:
				break;
			case CB_clearway:
				break;
			case CB_completeOvertakeBeforeSolidWhiteLine:
				break;
			case CB_damagedOrInjury:
				break;
			case CB_directionSigns:
				break;
			case CB_dottedWhiteLineAcrossRoad:
				break;
			case CB_doubleWhiteLines:
				break;
			case CB_driving:
				beliefs.put(cb, true);
				break;
			case CB_dualCarriageWay:
				break;
			case CB_enterWhiteDiagonalStripeWhiteBrokenBorderNecessary:
				break;
			case CB_essentialTravel:
				break;
			case CB_exceedingSpeedLimit:
				break;
			case CB_exitClear:
				break;
			case CB_finishedManoeuvre:
				break;
			case CB_flashingAmber:
				break;
			case CB_flashingAmberBeacon:
				break;
			case CB_flashingRed:
				break;
			case CB_fuel:
				break;
			case CB_greenLight:
				break;
			case CB_hazardAhead:
				break;
			case CB_headlightsOff:
				beliefs.put(cb, true);
				break;
			case CB_indicatorOn:
				break;
			case CB_informOtherRoadUser:
				break;
			case CB_laneAvailiable:
				break;
			case CB_laneCleared:
				break;
			case CB_laneDividers:
				break;
			case CB_laneRestricted:
				break;
			case CB_lanes2:
				break;
			case CB_largeVehicle:
				break;
			case CB_largeVehicleInFront:
				break;
			case CB_leftMostLane:
				break;
			case CB_lightAmber:
				break;
			case CB_lightFlashingAmber:
				break;
			case CB_lightGreen:
				break;
			case CB_lightRed:
				break;
			case CB_mainRoadNextRoad:
				break;
			case CB_maxPossibleSpeed25orLess:
				break;
			case CB_nextLaneClear:
				break;
			case CB_night:
				break;
			case CB_noCrossingLights:
				break;
			case CB_noLights:
				break;
			case CB_nodanger:
				break;
			case CB_openCrossing:
				break;
			case CB_oppositeParkedVehicle:
				break;
			case CB_oppositeTrafficIsland:
				break;
			case CB_overtaking:
				break;
			case CB_passedFirstWhiteLine:
				break;
			case CB_rightHandLane:
				break;
			case CB_roadAheadClear:
				break;
			case CB_roadClear:
				break;
			case CB_routeClear:
				break;
			case CB_routePlanned:
				beliefs.put(cb, true);
				break;
			case CB_safeToCross:
				break;
			case CB_safeToEnter:
				break;
			case CB_sharingRoadWithOthers:
				break;
			case CB_sidelightsOff:
				beliefs.put(cb, true);
				break;
			case CB_singleCarriageWay:
				break;
			case CB_singleTrackRoad:
				break;
			case CB_stationary:
				break;
			case CB_stationaryTraffic:
				break;
			case CB_stayingInLane:
				break;
			case CB_toJunction10meters:
				break;
			case CB_toflashingAmber:
				break;
			case CB_tpDirectingLeft:
				break;
			case CB_turning:
				break;
			case CB_unableToStopByWhiteLine:
				break;
			case CB_vehicleSafe:
				beliefs.put(cb, true);
				break;
			case CB_whiteLineAcrossRoad:
				break;
			default:
				beliefs.put(cb, false);
				break;
			}
		}
	}
}
