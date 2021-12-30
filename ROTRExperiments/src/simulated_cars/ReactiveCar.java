package simulated_cars;

import java.util.ArrayDeque;

import core_car_sim.Direction;
import core_car_sim.Point;
import core_car_sim.WorldSim;

public class ReactiveCar extends AbstractROTRCar implements CarEvents
{
	private boolean isFinished = false;
	ArrayDeque<Direction> movement = new ArrayDeque<Direction>();
	private boolean overtakenOther = false;
	private boolean getIntoLeftLane = false;
	
	public ReactiveCar(Point startPos, int startingSpeed)
	{
		super(startPos, startingSpeed, System.getProperty("user.dir") + "/resources/bluecar.png");
		addCarEventListener(this);
	}

	@Override
	protected ArrayDeque<Direction> getSimulationRoute()
	{
		updateOutcomes();
		if (getIntoLeftLane && overtakenOther)
		{
			movement.add(Direction.west);
			beliefs.put(CarBelief.CB_overtaking, false);
		}
		else if (intentions.get(CarIntention.CI_overtake))
		{
			movement.add(Direction.east);
			intentions.put(CarIntention.CI_overtake, false);
			beliefs.put(CarBelief.CB_overtaking, true);
		}
		while (movement.size() != getSpeed())
		{
			movement.add(Direction.north);
		}
		return movement;
	}

	@Override
	protected boolean isFinished(Point arg0)
	{
		return isFinished;
	}

	@Override
	public void worldUpdate(WorldSim world, Point location) 
	{
		updateBeliefs(world, location);		//needed -2 due to speed
		overtakenOther = world.containsCar(location.getX()-1, location.getY()+1) 
				|| world.containsCar(location.getX()-1, location.getY()+2);
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
			intentions.put(CarIntention.CI_overtake, false);
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
		case CA_move_left: //Move left after overtaking
			//Go to left lane if possible
			getIntoLeftLane = true;
			break;
		case CA_move_quickly_past:
			setSpeed(2);
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
		}
	}
	
	public void updateBeliefs(WorldSim world, Point location)
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
			case CB_behindWantToOvertake: //Only for north
				beliefs.put(cb, world.containsCar(location.getX(), location.getY() - 1));//Not car in front yet
				intentions.put(CarIntention.CI_overtake, beliefs.get(cb));
				break;
			case CB_bendInRoad://Not simulated
				beliefs.put(cb, true);
				break;
			case CB_brokendown://Car cannot break down.
				beliefs.put(cb, false);
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
			case CB_completeOvertakeBeforeSolidWhiteLine://No solid white lines simulated
				beliefs.put(cb, true);
				break;
			case CB_damagedOrInjury:
				beliefs.put(cb, isCrashed());
				break;
			case CB_directionSigns:
				beliefs.put(cb, false);
				break;
			case CB_dottedWhiteLineAcrossRoad:
				break;
			case CB_doubleWhiteLines:
				break;
			case CB_driving:
				beliefs.put(cb, true);
				break;
			case CB_dualCarriageWay:
				beliefs.put(cb, true);
				break;
			case CB_enterWhiteDiagonalStripeWhiteBrokenBorderNecessary:
				break;
			case CB_essentialTravel:
				break;
			case CB_exceedingSpeedLimit:
				beliefs.put(cb, world.speedLimit(location.getX(), location.getY()) < getSpeed());
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
				beliefs.put(cb, true);
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
				beliefs.put(cb, true);
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
			case CB_accessProperty:
				break;
			case CB_activefrontalairbaginfrontpassengerseat:
				beliefs.put(cb, false);
				break;
			case CB_adverseWeather:
				beliefs.put(cb, false);
				break;
			case CB_againstFlowOfTraffic:
				break;
			case CB_amSlowMovingVehicle:
				break;
			case CB_amber:
				break;
			case CB_animalInRoad:
				break;
			case CB_approachingBrow:
				break;
			case CB_approachingFog:
				break;
			case CB_approachingHumpBridge:
				break;
			case CB_approachingJunction:
				break;
			case CB_approachingRoundabout:
				break;
			case CB_approachingSchoolCrossing:
				break;
			case CB_atCrossing:
				break;
			case CB_authorisedParkingPlace:
				break;
			case CB_barriersOpen:
				break;
			case CB_betweenLanes:
				break;
			case CB_betweenSunriseSunset:
				break;
			case CB_boosterSeatsRequired:
				break;
			case CB_boosterSeatsfittedCorrectly:
				break;
			case CB_bridleway:
				break;
			case CB_builtuparea:
				break;
			case CB_busLane:
				break;
			case CB_busLaneInOperation:
				break;
			case CB_canPassAnimal:
				break;
			case CB_carInFrontTurningRight:
				break;
			case CB_childPassengers:
				break;
			case CB_congestedTraffic:
				break;
			case CB_contraflow:
				break;
			case CB_controlledCrossing:
				break;
			case CB_crawlerLaneExists:
				break;
			case CB_crossinglightsOff:
				break;
			case CB_crowdedShoppingStreet:
				break;
			case CB_cycleLaneUnavoidable:
				break;
			case CB_cyclelane:
				break;
			case CB_dangerousToStop:
				break;
			case CB_dazzled:
				break;
			case CB_dedicatedParkingArea:
				break;
			case CB_directedByPoliceOfficer:
				break;
			case CB_doubleYellowLine:
				break;
			case CB_downhill:
				break;
			case CB_drivenThroughDeepPuddle:
				break;
			case CB_driverWantsControl:
				break;
			case CB_dullWeather:
				break;
			case CB_dvsaflashingAmber:
				break;
			case CB_dvsafollowRequest:
				break;
			case CB_dvsapullOverSignal:
				break;
			case CB_emergencyArea:
				break;
			case CB_emergencyVehicle:
				break;
			case CB_emergencyVehicleFlashingLightsAndStopped:
				break;
			case CB_enterRestrictedLane:
				break;
			case CB_equestrianCrossing:
				break;
			case CB_flashingSirens:
				break;
			case CB_fog:
				break;
			case CB_fogLightsOn:
				break;
			case CB_footpath:
				break;
			case CB_forceTrafficToTramlane:
				break;
			case CB_gearNeutral:
				break;
			case CB_giveWaySign:
				break;
			case CB_goingDownhill:
				break;
			case CB_greenFilterLightForExit:
				break;
			case CB_hardshoulder:
				break;
			case CB_hasAdvancedStop:
				break;
			case CB_headlightsDipped:
				break;
			case CB_hill:
				break;
			case CB_homezone:
				break;
			case CB_hovLane:
				break;
			case CB_icyWeather:
				break;
			case CB_inIncident:
				break;
			case CB_kerbLoweredForWheelchair:
				break;
			case CB_lanes3:
				break;
			case CB_lanes4plus:
				break;
			case CB_levelCrossing:
				break;
			case CB_levelCrossingApproach:
				break;
			case CB_lightsCausingDiscomfortToOthers:
				break;
			case CB_litStreetLightingRoad:
				break;
			case CB_loadBalanced:
				break;
			case CB_loadNotStickingOut:
				break;
			case CB_loadSecure:
				break;
			case CB_london:
				break;
			case CB_longQueueBehind:
				break;
			case CB_markedBayForLoading:
				break;
			case CB_meetHeightRequirement:
				break;
			case CB_meetParkingRestrictions:
				break;
			case CB_middleLane:
				break;
			case CB_misleadingSignal:
				break;
			case CB_motorcyclistAhead:
				break;
			case CB_motorcyclistInFront:
				break;
			case CB_motorway:
				break;
			case CB_nearBrowOfHill:
				break;
			case CB_nearHumpbridge:
				break;
			case CB_nearLevelCrossing:
				break;
			case CB_nearPedistrianCrossing:
				break;
			case CB_nearSchool:
				break;
			case CB_nearTaxiRank:
				break;
			case CB_nearTramStop:
				break;
			case CB_nearbusStop:
				break;
			case CB_noOvertakingSign:
				break;
			case CB_noPassingPlaceInFront:
				break;
			case CB_nonMotorTraffic:
				break;
			case CB_numLanesReducing:
				break;
			case CB_obstructCycleFacilities:
				break;
			case CB_onMotorway:
				break;
			case CB_onPavement:
				break;
			case CB_overtaken:
				break;
			case CB_overtakingHighSidedVehicle:
				break;
			case CB_overtakingSchoolBus:
				break;
			case CB_parked:
				break;
			case CB_parkedInRoad:
				break;
			case CB_parkingAllowedBySigns:
				break;
			case CB_parkingRestrictions:
				break;
			case CB_pavement:
				break;
			case CB_pedestrianCrossing:
				break;
			case CB_pedestriansInRoad:
				break;
			case CB_pelicanCrossing:
				break;
			case CB_policeDirectingLeft:
				break;
			case CB_policeflashingBlue:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_policeflashingHeadlight:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_policehornSounding:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_preventingAccessForEmergencyServices:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_prohibitedToStopPark:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_propertyEntrance:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_publicTransport:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_puffinCrossing:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_pulledOver:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_quietlane:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_reachedRoundabout:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_rearfacingbabyseatinfrontpassengerseat:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_redRoute:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_redlines:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_reversing:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_roadMarkingKeepLeftOverride:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_roadNarrows:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_roadPresentsHazards:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_roadSignKeepLeftOverride:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_roadWorks:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_roadWorksAhead:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_ruralRoad:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_schoolEntrance:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_schoolEntranceMarkings:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_seenSign:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_seenSignalByAuthorisedPerson:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_sideroad:
				
				break;
			case CB_signConfictsWithAuthorisedPersonDirection:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_signFlashingAmber:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_signFlashingRedX:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_emergencyStopSign:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_signalledRoundabout:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_signsAdviseRestrictions:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_skidding:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_sliproad:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_slowMovingTraffic:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_slowMovingVehicle:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_slowMovingVehicleInfront:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_speedlimitForHardShoulder:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_stationaryVehicleInFront:
				break;
			case CB_stopForChildrenSign:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_stopSign:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_stopSignCrossing:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_taxibay:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_tempObstructingTraffic:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_toucanCrossing:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_trafficCalming:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_trafficCongested:
				break;
			case CB_trafficQueuing:
				break;
			case CB_trafficSlow:
				break;
			case CB_tram:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_tramPassingLane:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_tramStop:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_tramlines:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_tramlinesCrossingApproach:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_unncessaryObstruction:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_uphill:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_urbanClearway:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_vehicleDoesntFitsInCentralReservation:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_vehicleFitsInCentralReservation:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_vehiclesWishToOvertake:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_visibilityReduced:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_wetWeather:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_whiteDiagonalStripeWhiteBrokenBorder:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_whiteDiagonalStripeWhiteSolidBorder:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_windy:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_withinCyclelaneOpteration:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_withinTimePlateTimes:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_withinUrbanClearwayHours:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_workVehicleSign:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_yellowLine:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_yellowMarkingsOnKerb:
				beliefs.put(cb, false);//Not simulated
				break;
			case CB_zebraCrossing:
				beliefs.put(cb, false);//Not simulated
				break;
			default:
				break;
			}
		}
	}
}
