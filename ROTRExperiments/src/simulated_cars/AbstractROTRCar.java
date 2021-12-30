package simulated_cars;

import java.util.ArrayList;
import java.util.HashMap;

import core_car_sim.AbstractCar;
import core_car_sim.Point;
import core_car_sim.WorldSim;
import prologfiles.RulesOfTheRoad;
import prologfiles.RulesOfTheRoad.ROTROutcome;



public abstract class AbstractROTRCar extends AbstractCar
{
	ArrayList<CarEvents> cel = new ArrayList<CarEvents>();
	
	public enum CarBelief {
		CB_accessProperty("accessProperty"),
		CB_activefrontalairbaginfrontpassengerseat("activefrontalairbaginfrontpassengerseat"),
		CB_adverseWeather("adverseWeather"),
		CB_againstFlowOfTraffic("againstFlowOfTraffic"),
		CB_allChildrenUsingChildSeatAsRequired("allChildrenUsingChildSeatAsRequired"),
		CB_allPassengersWearingSeatBeltsAsRequired("allPassengersWearingSeatBeltsAsRequired"),
		CB_amSlowMovingVehicle("amSlowMovingVehicle"),
		CB_amber("amber"),
		CB_animalInRoad("animalInRoad"),
		CB_approachingBrow("approachingBrow"),
		CB_approachingCorner("approachingCorner"),
		CB_approachingFog("approachingFog"),
		CB_approachingHumpBridge("approachingHumpBridge"),
		CB_approachingJunction("approachingJunction"),
		CB_approachingRoundabout("approachingRoundabout"),
		CB_approachingSchoolCrossing("approachingSchoolCrossing"),
		CB_atCrossing("atCrossing"),
		CB_atTrafficLight("atTrafficLight"),
		CB_authorisedParkingPlace("authorisedParkingPlace"),
		CB_barriersOpen("barriersOpen"),
		CB_behindWantToOvertake("behindWantToOvertake"),
		CB_bendInRoad("bendInRoad"),
		CB_betweenLanes("betweenLanes"),
		CB_betweenSunriseSunset("betweenSunriseSunset"),
		CB_boosterSeatsRequired("boosterSeatsRequired"),
		CB_boosterSeatsfittedCorrectly("boosterSeatsfittedCorrectly"),
		CB_bridleway("bridleway"),
		CB_brokendown("brokendown"),
		CB_builtuparea("builtuparea"),
		CB_busLane("busLane"),
		CB_busLaneInOperation("busLaneInOperation"),
		CB_canPassAnimal("canPassAnimal"),
		CB_canReadNumberPlate("canReadNumberPlate"),
		CB_canStopBeforeCarInFrontStops("canStopBeforeCarInFrontStops"),
		CB_carInFrontTurningRight("carInFrontTurningRight"),
		CB_carTowardsYou("carTowardsYou"),
		CB_carriageway("carriageway"),
		CB_centerLine("centerLine"),
		CB_childPassengers("childPassengers"),
		CB_clearRoadAhead("clearRoadAhead"),
		CB_clearToManover("clearToManover"),
		CB_clearToTurnOff("clearToTurnOff"),
		CB_clearway("clearway"),
		CB_completeOvertakeBeforeSolidWhiteLine("completeOvertakeBeforeSolidWhiteLine"),
		CB_congestedTraffic("congestedTraffic"),
		CB_contraflow("contraflow"),
		CB_controlledCrossing("controlledCrossing"),
		CB_crawlerLaneExists("crawlerLaneExists"),
		CB_crossinglightsOff("crossinglightsOff"),
		CB_crowdedShoppingStreet("crowdedShoppingStreet"),
		CB_cycleLaneUnavoidable("cycleLaneUnavoidable"),
		CB_cyclelane("cyclelane"),
		CB_damagedOrInjury("damagedOrInjury"),
		CB_dangerousToStop("dangerousToStop"),
		CB_dazzled("dazzled"),
		CB_dedicatedParkingArea("dedicatedParkingArea"),
		CB_directedByPoliceOfficer("directedByPoliceOfficer"),
		CB_directionSigns("directionSigns"),
		CB_dottedWhiteLineAcrossRoad("dottedWhiteLineAcrossRoad"),
		CB_doubleWhiteLines("doubleWhiteLines"),
		CB_doubleYellowLine("doubleYellowLine"),
		CB_downhill("downhill"),
		CB_drivenThroughDeepPuddle("drivenThroughDeepPuddle"),
		CB_driverWantsControl("driverWantsControl"),
		CB_driving("driving"),
		CB_dualCarriageWay("dualCarriageWay"),
		CB_dullWeather("dullWeather"),
		CB_dvsaflashingAmber("dvsaflashingAmber"),
		CB_dvsafollowRequest("dvsafollowRequest"),
		CB_dvsapullOverSignal("dvsapullOverSignal"),
		CB_emergencyArea("emergencyArea"),
		CB_emergencyVehicle("emergencyVehicle"),
		CB_emergencyVehicleFlashingLightsAndStopped("emergencyVehicleFlashingLightsAndStopped"),
		CB_enterRestrictedLane("enterRestrictedLane"),
		CB_enterWhiteDiagonalStripeWhiteBrokenBorderNecessary("enterWhiteDiagonalStripeWhiteBrokenBorderNecessary"),
		CB_equestrianCrossing("equestrianCrossing"),
		CB_essentialTravel("essentialTravel"),
		CB_exceedingSpeedLimit("exceedingSpeedLimit"),
		CB_exitClear("exitClear"),
		CB_finishedManoeuvre("finishedManoeuvre"),
		CB_flashingAmber("flashingAmber"),
		CB_flashingAmberBeacon("flashingAmberBeacon"),
		CB_flashingRed("flashingRed"),
		CB_flashingSirens("flashingSirens"),
		CB_fog("fog"),
		CB_fogLightsOn("fogLightsOn"),
		CB_footpath("footpath"),
		CB_forceTrafficToTramlane("forceTrafficToTramlane"),
		CB_fuel("fuel"),
		CB_gearNeutral("gearNeutral"),
		CB_giveWaySign("giveWaySign"),
		CB_goingDownhill("goingDownhill"),
		CB_greenFilterLightForExit("greenFilterLightForExit"),
		CB_greenLight("greenLight"),
		CB_hardshoulder("hardshoulder"),
		CB_hasAdvancedStop("hasAdvancedStop"),
		CB_hazardAhead("hazardAhead"),
		CB_headlightsDipped("headlightsDipped"),
		CB_headlightsOff("headlightsOff"),
		CB_hill("hill"),
		CB_homezone("homezone"),
		CB_hovLane("hovLane"),
		CB_icyWeather("icyWeather"),
		CB_inIncident("inIncident"),
		CB_indicatorOn("indicatorOn"),
		CB_informOtherRoadUser("informOtherRoadUser"),
		CB_kerbLoweredForWheelchair("kerbLoweredForWheelchair"),
		CB_laneAvailiable("laneAvailiable"),
		CB_laneCleared("laneCleared"),
		CB_laneDividers("laneDividers"),
		CB_laneRestricted("laneRestricted"),
		CB_lanes2("lanes2"),
		CB_lanes3("lanes3"),
		CB_lanes4plus("lanes4plus"),
		CB_largeVehicle("largeVehicle"),
		CB_largeVehicleInFront("largeVehicleInFront"),
		CB_leftMostLane("leftMostLane"),
		CB_levelCrossing("levelCrossing"),
		CB_levelCrossingApproach("levelCrossingApproach"),
		CB_lightAmber("lightAmber"),
		CB_lightFlashingAmber("lightFlashingAmber"),
		CB_lightGreen("lightGreen"),
		CB_lightRed("lightRed"),
		CB_lightsCausingDiscomfortToOthers("lightsCausingDiscomfortToOthers"),
		CB_litStreetLightingRoad("litStreetLightingRoad"),
		CB_loadBalanced("loadBalanced"),
		CB_loadNotStickingOut("loadNotStickingOut"),
		CB_loadSecure("loadSecure"),
		CB_london("london"),
		CB_longQueueBehind("longQueueBehind"),
		CB_mainRoadNextRoad("mainRoadNextRoad"),
		CB_markedBayForLoading("markedBayForLoading"),
		CB_maxPossibleSpeed25orLess("maxPossibleSpeed25orLess"),
		CB_meetHeightRequirement("meetHeightRequirement"),
		CB_meetParkingRestrictions("meetParkingRestrictions"),
		CB_middleLane("middleLane"),
		CB_misleadingSignal("misleadingSignal"),
		CB_motorcyclistAhead("motorcyclistAhead"),
		CB_motorcyclistInFront("motorcyclistInFront"),
		CB_motorway("motorway"),
		CB_nearBrowOfHill("nearBrowOfHill"),
		CB_nearHumpbridge("nearHumpbridge"),
		CB_nearLevelCrossing("nearLevelCrossing"),
		CB_nearPedistrianCrossing("nearPedistrianCrossing"),
		CB_nearSchool("nearSchool"),
		CB_nearTaxiRank("nearTaxiRank"),
		CB_nearTramStop("nearTramStop"),
		CB_nearbusStop("nearbusStop"),
		CB_nextLaneClear("nextLaneClear"),
		CB_night("night"),
		CB_noCrossingLights("noCrossingLights"),
		CB_noLights("noLights"),
		CB_noOvertakingSign("noOvertakingSign"),
		CB_noPassingPlaceInFront("noPassingPlaceInFront"),
		CB_nodanger("nodanger"),
		CB_nonMotorTraffic("nonMotorTraffic"),
		CB_numLanesReducing("numLanesReducing"),
		CB_obstructCycleFacilities("obstructCycleFacilities"),
		CB_onMotorway("onMotorway"),
		CB_onPavement("onPavement"),
		CB_openCrossing("openCrossing"),
		CB_oppositeParkedVehicle("oppositeParkedVehicle"),
		CB_oppositeTrafficIsland("oppositeTrafficIsland"),
		CB_overtaken("overtaken"),
		CB_overtaking("overtaking"),
		CB_overtakingHighSidedVehicle("overtakingHighSidedVehicle"),
		CB_overtakingSchoolBus("overtakingSchoolBus"),
		CB_parked("parked"),
		CB_parkedInRoad("parkedInRoad"),
		CB_parkingAllowedBySigns("parkingAllowedBySigns"),
		CB_parkingRestrictions("parkingRestrictions"),
		CB_passedFirstWhiteLine("passedFirstWhiteLine"),
		CB_pavement("pavement"),
		CB_pedestrianCrossing("pedestrianCrossing"),
		CB_pedestriansInRoad("pedestriansInRoad"),
		CB_pelicanCrossing("pelicanCrossing"),
		CB_policeDirectingLeft("policeDirectingLeft"),
		CB_policeflashingBlue("policeflashingBlue"),
		CB_policeflashingHeadlight("policeflashingHeadlight"),
		CB_policehornSounding("policehornSounding"),
		CB_preventingAccessForEmergencyServices("preventingAccessForEmergencyServices"),
		CB_prohibitedToStopPark("prohibitedToStopPark"),
		CB_propertyEntrance("propertyEntrance"),
		CB_publicTransport("publicTransport"),
		CB_puffinCrossing("puffinCrossing"),
		CB_pulledOver("pulledOver"),
		CB_quietlane("quietlane"),
		CB_reachedRoundabout("reachedRoundabout"),
		CB_rearfacingbabyseatinfrontpassengerseat("rearfacingbabyseatinfrontpassengerseat"),
		CB_redRoute("redRoute"),
		CB_redlines("redlines"),
		CB_reversing("reversing"),
		CB_rightHandLane("rightHandLane"),
		CB_roadAheadClear("roadAheadClear"),
		CB_roadClear("roadClear"),
		CB_roadMarkingKeepLeftOverride("roadMarkingKeepLeftOverride"),
		CB_roadNarrows("roadNarrows"),
		CB_roadPresentsHazards("roadPresentsHazards"),
		CB_roadSignKeepLeftOverride("roadSignKeepLeftOverride"),
		CB_roadWorks("roadWorks"),
		CB_roadWorksAhead("roadWorksAhead"),
		CB_routeClear("routeClear"),
		CB_routePlanned("routePlanned"),
		CB_ruralRoad("ruralRoad"),
		CB_safeToCross("safeToCross"),
		CB_safeToEnter("safeToEnter"),
		CB_schoolEntrance("schoolEntrance"),
		CB_schoolEntranceMarkings("schoolEntranceMarkings"),
		CB_seenSign("seenSign"),
		CB_seenSignalByAuthorisedPerson("seenSignalByAuthorisedPerson"),
		CB_sharingRoadWithOthers("sharingRoadWithOthers"),
		CB_sidelightsOff("sidelightsOff"),
		CB_sideroad("sideroad"),
		CB_signConfictsWithAuthorisedPersonDirection("signConfictsWithAuthorisedPersonDirection"),
		CB_signFlashingAmber("signFlashingAmber"),
		CB_signFlashingRedX("signFlashingRedX"),
		CB_emergencyStopSign("emergencyStopSign"),
		CB_signalledRoundabout("signalledRoundabout"),
		CB_signsAdviseRestrictions("signsAdviseRestrictions"),
		CB_singleCarriageWay("singleCarriageWay"),
		CB_singleTrackRoad("singleTrackRoad"),
		CB_skidding("skidding"),
		CB_sliproad("sliproad"),
		CB_slowMovingTraffic("slowMovingTraffic"),
		CB_slowMovingVehicle("slowMovingVehicle"),
		CB_slowMovingVehicleInfront("slowMovingVehicleInfront"),
		CB_speedlimitForHardShoulder("speedlimitForHardShoulder"),
		CB_stationary("stationary"),
		CB_stationaryTraffic("stationaryTraffic"),
		CB_stationaryVehicleInFront("stationaryVehicleInFront"),
		CB_stayingInLane("stayingInLane"),
		CB_stopForChildrenSign("stopForChildrenSign"),
		CB_stopSign("stopSign"),
		CB_stopSignCrossing("stopSignCrossing"),
		CB_taxibay("taxibay"),
		CB_tempObstructingTraffic("tempObstructingTraffic"),
		CB_toJunction10meters("toJunction10meters"),
		CB_toflashingAmber("toflashingAmber"),
		CB_toucanCrossing("toucanCrossing"),
		CB_tpDirectingLeft("tpDirectingLeft"),
		CB_trafficCalming("trafficCalming"),
		CB_trafficCongested("trafficCongested"),
		CB_trafficQueuing("trafficQueuing"),
		CB_trafficSlow("trafficSlow"),
		CB_tram("tram"),
		CB_tramPassingLane("tramPassingLane"),
		CB_tramStop("tramStop"),
		CB_tramlines("tramlines"),
		CB_tramlinesCrossingApproach("tramlinesCrossingApproach"),
		CB_turning("turning"),
		CB_unableToStopByWhiteLine("unableToStopByWhiteLine"),
		CB_unncessaryObstruction("unncessaryObstruction"),
		CB_uphill("uphill"),
		CB_urbanClearway("urbanClearway"),
		CB_vehicleDoesntFitsInCentralReservation("vehicleDoesntFitsInCentralReservation"),
		CB_vehicleFitsInCentralReservation("vehicleFitsInCentralReservation"),
		CB_vehicleSafe("vehicleSafe"),
		CB_vehiclesWishToOvertake("vehiclesWishToOvertake"),
		CB_visibilityReduced("visibilityReduced"),
		CB_wetWeather("wetWeather"),
		CB_whiteDiagonalStripeWhiteBrokenBorder("whiteDiagonalStripeWhiteBrokenBorder"),
		CB_whiteDiagonalStripeWhiteSolidBorder("whiteDiagonalStripeWhiteSolidBorder"),
		CB_whiteLineAcrossRoad("whiteLineAcrossRoad"),
		CB_windy("windy"),
		CB_withinCyclelaneOpteration("withinCyclelaneOpteration"),
		CB_withinTimePlateTimes("withinTimePlateTimes"),
		CB_withinUrbanClearwayHours("withinUrbanClearwayHours"),
		CB_workVehicleSign("workVehicleSign"),
		CB_yellowLine("yellowLine"),
		CB_yellowMarkingsOnKerb("yellowMarkingsOnKerb"),
		CB_zebraCrossing("zebraCrossing");
		
		public final String fileValue;
		private static final HashMap<String, CarBelief> lookup = new HashMap<String, CarBelief>();
		static {
	        for (CarBelief d : CarBelief.values()) {
	            lookup.put(d.fileValue, d);
	        }
	    }
		
		public static CarBelief get(String value) {
	        return lookup.get(value);
	    }
		
		public String toString()
		{
			return fileValue;
		}
		
		private CarBelief(String beliefValue)
		{
			fileValue = beliefValue;
		}
	};
	
	public enum CarIntention {
		CI_approachingTrafficLight("approachingTrafficLight"),
		CI_areaWithSolidWhiteBorder("areaWithSolidWhiteBorder"),
		CI_beInCycleLane("beInCycleLane"),
		CI_brake("brake"),
		CI_changeCourseOrDirection("changeCourseOrDirection"),
		CI_changeLane("changeLane"),
		CI_crossControlledCrossing("crossControlledCrossing"),
		CI_crossDoubleWhiteClosestSolid("crossDoubleWhiteClosestSolid"),
		CI_crossDualCarriageWay("crossDualCarriageWay"),
		CI_crossHazardWarningLine("crossHazardWarningLine"),
		CI_crossLevelCrossing("crossLevelCrossing"),
		CI_diagnosingFaults("diagnosingFaults"),
		CI_dropOffPassengers("dropOffPassengers"),
		CI_enterBoxJunction("enterBoxJunction"),
		CI_enterMotorway("enterMotorway"),
		CI_enterTramReservedRoad("enterTramReservedRoad"),
		CI_enterWhiteDiagonalStripeWhiteBrokenBorder("enterWhiteDiagonalStripeWhiteBrokenBorder"),
		CI_enterWhiteDiagonalStripeWhiteSolidBorder("enterWhiteDiagonalStripeWhiteSolidBorder"),
		CI_firstExitRoundabout("firstExitRoundabout"),
		CI_flashHeadlight("flashHeadlight"),
		CI_goodsLoadingUn("goodsLoadingUn"),
		CI_joinMotorway("joinMotorway"),
		CI_leaveMotorway("leaveMotorway"),
		CI_loadUnloading("loadUnloading"),
		CI_otherRoundabout("otherRoundabout"),
		CI_overtake("overtake"),
		CI_overtakeSnowplow("overtakeSnowplow"),
		CI_park("park"),
		CI_passParkedVehicles("passParkedVehicles"),
		CI_passVehicles("passVehicles"),
		CI_pullIntoDriveway("pullIntoDriveway"),
		CI_reversing("reversing"),
		CI_rightExitRoundabout("rightExitRoundabout"),
		CI_selectLane("selectLane"),
		CI_setHazardsOn("setHazardsOn"),
		CI_setOff("setOff"),
		CI_settingOff("settingOff"),
		CI_soundHorn("soundHorn"),
		CI_stop("stop"),
		CI_towing("towing"),
		CI_turnOff("turnOff"),
		CI_turnRight("turnRight"),
		CI_undertaking("undertaking"),
		CI_uturn("uturn");
		public final String fileValue;
		
		private static final HashMap<String, CarIntention> lookup = new HashMap<String, CarIntention>();
		static {
	        for (CarIntention d : CarIntention.values()) {
	            lookup.put(d.fileValue, d);
	        }
	    }
		
		public static CarIntention get(String value) {
	        return lookup.get(value);
	    }
		
		private CarIntention(String beliefValue)
		{
			fileValue = beliefValue;
		}
		
		public String toString()
		{
			return fileValue;
		}
	};
	
	public enum CarAction {
		CA_adjust_speed("adjust_speed"),
		CA_allow_cyclists_moto_pass("allow_cyclists_moto_pass"),
		CA_allow_emergency_vehicle_to_pass("allow_emergency_vehicle_to_pass"),
		CA_allow_extra_space("allow_extra_space"),
		CA_allow_extra_space_for_works_vehicles("allow_extra_space_for_works_vehicles"),
		CA_allow_traffic_to_pass("allow_traffic_to_pass"),
		CA_allow_undertaking("allow_undertaking"),
		CA_allowed_to_proceed("allowed_to_proceed"),
		CA_approach_left_hand_lane("approach_left_hand_lane"),
		CA_approach_with_caution("approach_with_caution"),
		CA_avoidLaneChanges("avoidLaneChanges"),
		CA_avoidRightHandLane("avoidRightHandLane"),
		CA_avoid_blocking_sideroads("avoid_blocking_sideroads"),
		CA_avoid_bus_lane("avoid_bus_lane"),
		CA_avoid_closed_lane("avoid_closed_lane"),
		CA_avoid_coasting("avoid_coasting"),
		CA_avoid_coned_off_area("avoid_coned_off_area"),
		CA_avoid_crossing_central_reservation("avoid_crossing_central_reservation"),
		CA_avoid_crossing_crossing("avoid_crossing_crossing"),
		CA_avoid_crossing_level_crossing("avoid_crossing_level_crossing"),
		CA_avoid_cutting_corner("avoid_cutting_corner"),
		CA_avoid_drive_against_traffic_flow("avoid_drive_against_traffic_flow"),
		CA_avoid_driving_on_rails("avoid_driving_on_rails"),
		CA_avoid_emergency_area("avoid_emergency_area"),
		CA_avoid_hard_shoulder("avoid_hard_shoulder"),
		CA_avoid_harsh_braking("avoid_harsh_braking"),
		CA_avoid_horn("avoid_horn"),
		CA_avoid_hov_lane("avoid_hov_lane"),
		CA_avoid_lane_lane("avoid_lane_lane"),
		CA_avoid_lane_switching("avoid_lane_switching"),
		CA_avoid_level_crossing("avoid_level_crossing"),
		CA_avoid_loading_unloading("avoid_loading_unloading"),
		CA_avoid_motorway("avoid_motorway"),
		CA_avoid_non("avoid_non"),
		CA_avoid_overtaking("avoid_overtaking"),
		CA_avoid_overtaking_on_left("avoid_overtaking_on_left"),
		CA_avoid_parking("avoid_parking"),
		CA_avoid_parking_against_flow("avoid_parking_against_flow"),
		CA_avoid_pick_up_set_down("avoid_pick_up_set_down"),
		CA_avoid_reversing("avoid_reversing"),
		CA_avoid_revs("avoid_revs"),
		CA_avoid_stopping("avoid_stopping"),
		CA_avoid_tram_reserved_road("avoid_tram_reserved_road"),
		CA_avoid_undertaking("avoid_undertaking"),
		CA_avoid_uturn("avoid_uturn"),
		CA_avoid_waiting("avoid_waiting"),
		CA_avoid_weaving("avoid_weaving"),
		CA_brake_early_lightly("brake_early_lightly"),
		CA_brake_hard("brake_hard"),
		CA_buildup_speed_on_motorway("buildup_speed_on_motorway"),
		CA_cancel_overtaking("cancel_overtaking"),
		CA_cancel_reverse("cancel_reverse"),
		CA_cancel_signals("cancel_signals"),
		CA_cancel_undertaking("cancel_undertaking"),
		CA_clear_ice_snow_all_windows("clear_ice_snow_all_windows"),
		CA_close_to_kerb("close_to_kerb"),
		CA_consideration_others("consideration_others"),
		CA_doNotEnterWhiteDiagonalStripeWhiteBrokenBorder("doNotEnterWhiteDiagonalStripeWhiteBrokenBorder"),
		CA_doNotEnterWhiteDiagonalStripeWhiteSolidBorder("doNotEnterWhiteDiagonalStripeWhiteSolidBorder"),
		CA_do_not_drive("do_not_drive"),
		CA_do_not_hestitate("do_not_hestitate"),
		CA_do_not_overtake("do_not_overtake"),
		CA_do_not_park_in_passing_place("do_not_park_in_passing_place"),
		CA_do_not_reverse("do_not_reverse"),
		CA_do_not_stop("do_not_stop"),
		CA_dontExceedTempSpeedLimit("dontExceedTempSpeedLimit"),
		CA_dont_cross_solid_white("dont_cross_solid_white"),
		CA_dont_use_central_reservation("dont_use_central_reservation"),
		CA_drive_care_attention("drive_care_attention"),
		CA_drive_slowly("drive_slowly"),
		CA_drive_very_slowly("drive_very_slowly"),
		CA_drive_very_slowly_on_bends("drive_very_slowly_on_bends"),
		CA_drop_back("drop_back"),
		CA_dry_brakes("dry_brakes"),
		CA_ease_off("ease_off"),
		CA_engage_child_locks("engage_child_locks"),
		CA_engage_parking_break("engage_parking_break"),
		CA_engine_off("engine_off"),
		CA_find_other_route("find_other_route"),
		CA_find_quiet_side_road("find_quiet_side_road"),
		CA_find_safe_place_to_stop("find_safe_place_to_stop"),
		CA_fit_booster_seat("fit_booster_seat"),
		CA_flash_amber_beacon("flash_amber_beacon"),
		CA_fog_lights_off("fog_lights_off"),
		CA_fog_lights_on("fog_lights_on"),
		CA_followLaneSigns("followLaneSigns"),
		CA_follow_dvsa_until_stopped("follow_dvsa_until_stopped"),
		CA_follow_police_direction("follow_police_direction"),
		CA_follow_sign("follow_sign"),
		CA_follow_signs("follow_signs"),
		CA_get_in_lane("get_in_lane"),
		CA_get_into_lane("get_into_lane"),
		CA_get_off_road("get_off_road"),
		CA_give_extensive_extra_seperation_distance("give_extensive_extra_seperation_distance"),
		CA_give_extra_seperation_distance("give_extra_seperation_distance"),
		CA_give_priority_to_public_transport("give_priority_to_public_transport"),
		CA_give_priority_to_right("give_priority_to_right"),
		CA_give_room_when_passing("give_room_when_passing"),
		CA_give_signal("give_signal"),
		CA_give_up_control("give_up_control"),
		CA_give_way_at_dotted_white_line("give_way_at_dotted_white_line"),
		CA_give_way_other_roads("give_way_other_roads"),
		CA_give_way_to_other("give_way_to_other"),
		CA_give_way_to_pedestrians("give_way_to_pedestrians"),
		CA_give_way_to_tram("give_way_to_tram"),
		CA_goBetweenLaneDividers("goBetweenLaneDividers"),
		CA_go_to_left_hand_land("go_to_left_hand_land"),
		CA_going_left_use_left("going_left_use_left"),
		CA_going_right_use_left("going_right_use_left"),
		CA_handbrake_on("handbrake_on"),
		CA_headlights_on("headlights_on"),
		CA_increase_distance_to_car_infront("increase_distance_to_car_infront"),
		CA_indicatorOn("indicatorOn"),
		CA_indicator_on("indicator_on"),
		CA_keep_crossing_clear("keep_crossing_clear"),
		CA_keep_left("keep_left"),
		CA_keep_left_lane("keep_left_lane"),
		CA_keep_safe_distance("keep_safe_distance"),
		CA_keep_sidelights_on("keep_sidelights_on"),
		CA_keep_under_speed_limit("keep_under_speed_limit"),
		CA_keep_well_back("keep_well_back"),
		CA_lane_clear("lane_clear"),
		CA_leave_space_for_manover("leave_space_for_manover"),
		CA_leave_space_to_stop("leave_space_to_stop"),
		CA_light_and_number_plates_clean("light_and_number_plates_clean"),
		CA_lock("lock"),
		CA_maintained_reduced_speed("maintained_reduced_speed"),
		CA_match_speed_to_motorway("match_speed_to_motorway"),
		CA_mergeInTurn("mergeInTurn"),
		CA_merge_in_turn("merge_in_turn"),
		CA_mini("mini"),
		CA_minimise_reversing("minimise_reversing"),
		CA_mirrors_clear("mirrors_clear"),
		CA_move_adjacent_lane("move_adjacent_lane"),
		CA_move_left("move_left"),
		CA_move_quickly_past("move_quickly_past"),
		CA_move_to_left_hand_lane("move_to_left_hand_lane"),
		CA_must_stop_pedestrian_crossing("must_stop_pedestrian_crossing"),
		CA_nextLaneClear("nextLaneClear"),
		CA_next_safe_stop("next_safe_stop"),
		CA_not_drive_dangerously("not_drive_dangerously"),
		CA_not_overtaken("not_overtaken"),
		CA_obey_signal("obey_signal"),
		CA_obey_work_vehicle_sign("obey_work_vehicle_sign"),
		CA_overtake_on_right("overtake_on_right"),
		CA_park_as_close_to_side("park_as_close_to_side"),
		CA_parking_lights_on("parking_lights_on"),
		CA_pass_around("pass_around"),
		CA_position_right_turn("position_right_turn"),
		CA_prepare_drop_back("prepare_drop_back"),
		CA_prepare_load("prepare_load"),
		CA_prepare_route("prepare_route"),
		CA_prepare_to_change_lane("prepare_to_change_lane"),
		CA_prepare_to_stop("prepare_to_stop"),
		CA_priority_to_motoway_traffic("priority_to_motoway_traffic"),
		CA_pull_into_hard_shoulder("pull_into_hard_shoulder"),
		CA_pull_into_passing_place("pull_into_passing_place"),
		CA_pull_over_safe_place("pull_over_safe_place"),
		CA_pull_up_in_visible_distance("pull_up_in_visible_distance"),
		CA_put_on_seatbelts("put_on_seatbelts"),
		CA_reduce_distance_between_front_vehicle("reduce_distance_between_front_vehicle"),
		CA_reduce_lighting("reduce_lighting"),
		CA_reduce_overall_speed("reduce_overall_speed"),
		CA_reduce_speed("reduce_speed"),
		CA_reduce_speed_if_pedestrians("reduce_speed_if_pedestrians"),
		CA_reduce_speed_on_slip_road("reduce_speed_on_slip_road"),
		CA_release_brake("release_brake"),
		CA_remove_all_snow("remove_all_snow"),
		CA_remove_flash_intention("remove_flash_intention"),
		CA_remove_horn_intention("remove_horn_intention"),
		CA_reverse_into_drive("reverse_into_drive"),
		CA_reverse_to_passing_place("reverse_to_passing_place"),
		CA_road_clear_to_manover("road_clear_to_manover"),
		CA_safe_distance("safe_distance"),
		CA_safe_pull_over_and_stop("safe_pull_over_and_stop"),
		CA_select_lane("select_lane"),
		CA_set_hazards_off("set_hazards_off"),
		CA_set_headlights_to_dipped("set_headlights_to_dipped"),
		CA_signal("signal"),
		CA_signal_left("signal_left"),
		CA_signal_left_on_exit("signal_left_on_exit"),
		CA_signal_right("signal_right"),
		CA_slow_down("slow_down"),
		CA_slow_down_and_stop("slow_down_and_stop"),
		CA_space_for_vehicle("space_for_vehicle"),
		CA_stay_in_lane("stay_in_lane"),
		CA_stay_on_running_lane("stay_on_running_lane"),
		CA_steady_speed("steady_speed"),
		CA_stop("stop"),
		CA_stopCrossDoubleWhiteClosestSolid("stopCrossDoubleWhiteClosestSolid"),
		CA_stopCrossingHazardWarningLine("stopCrossingHazardWarningLine"),
		CA_stop_and_turn_engine_off("stop_and_turn_engine_off"),
		CA_stop_at_crossing("stop_at_crossing"),
		CA_stop_at_crossing_patrol("stop_at_crossing_patrol"),
		CA_stop_at_sign("stop_at_sign"),
		CA_stop_at_white_line("stop_at_white_line"),
		CA_switch_off_engine("switch_off_engine"),
		CA_travel_sign_direction("travel_sign_direction"),
		CA_treat_as_roundabout("treat_as_roundabout"),
		CA_treat_as_traffic_light("treat_as_traffic_light"),
		CA_turn_foglights_off("turn_foglights_off"),
		CA_turn_into_skid("turn_into_skid"),
		CA_turn_sidelights_on("turn_sidelights_on"),
		CA_use_central_reservation("use_central_reservation"),
		CA_use_crawler_lane("use_crawler_lane"),
		CA_use_demisters("use_demisters"),
		CA_use_hazard_lights("use_hazard_lights"),
		CA_use_left_indicator("use_left_indicator"),
		CA_use_right_indicator("use_right_indicator"),
		CA_use_road("use_road"),
		CA_use_signals("use_signals"),
		CA_use_tram_passing_lane("use_tram_passing_lane"),
		CA_use_windscreen_wipers("use_windscreen_wipers"),
		CA_wait_at_advanced_stop("wait_at_advanced_stop"),
		CA_wait_at_first_white_line("wait_at_first_white_line"),
		CA_wait_for_gap_before_moving_off("wait_for_gap_before_moving_off"),
		CA_wait_until_clear("wait_until_clear"),
		CA_wait_until_route_clear("wait_until_route_clear"),
		CA_wait_until_safe_gap("wait_until_safe_gap"),
		CA_wheel_away_from_kerb("wheel_away_from_kerb"),
		CA_wheel_toward_from_kerb("wheel_toward_from_kerb");
		
		public final String fileValue;
		
		private static final HashMap<String, CarAction> lookup = new HashMap<String, CarAction>();
		static {
	        for (CarAction d : CarAction.values()) {
	            lookup.put(d.fileValue, d);
	        }
	    }
		
		public static CarAction get(String value) {
	        return lookup.get(value);
	    }
		
		private CarAction(String beliefValue)
		{
			fileValue = beliefValue;
		}
		
		public String toString()
		{
			return fileValue;
		}
	}
	
	public enum CarPriority {CP_MUST, CP_SHOULD};
	
	ArrayList<ROTROutcome> rulesOfTheRoad = new ArrayList<ROTROutcome>();
	HashMap<CarBelief, Boolean> beliefs = new HashMap<CarBelief, Boolean>();
	HashMap<CarIntention, Boolean> intentions = new HashMap<CarIntention, Boolean>();
	
	public AbstractROTRCar(Point startPos, int startingSpeed, String fileImage)
	{
		super(startPos, startingSpeed, fileImage);
		clearBeliefs();
		clearIntentions();
	}
	
	public void addCarEventListener(CarEvents ce)
	{
		cel.add(ce);
	}
	
	private void clearBeliefs()
	{
		for (CarBelief cb : CarBelief.values())
		{
			beliefs.put(cb, false);
		}
	}
	
	private void clearIntentions()
	{
		for (CarIntention cb : CarIntention.values())
		{
			intentions.put(cb, false);
		}
	}
	
	@Override
	public void visibleWorldUpdate(WorldSim world, Point location)
	{
		triggerCarEvents(world, location);
	}

	private void triggerCarEvents(WorldSim world, Point location) 
	{
		for (CarEvents ce : cel)
		{
			ce.worldUpdate(world, location);
		}		
	}

	public void updateOutcomes()
	{
		rulesOfTheRoad = RulesOfTheRoad.getROTRViolations(beliefs, intentions);
		for (ROTROutcome rotr : rulesOfTheRoad)
		{
			for (CarEvents ce : cel)
			{
				if (rotr.legalRequirement)
				{
					ce.actionUpdate(CarAction.get(rotr.action), CarPriority.CP_MUST);
				}
				else
				{
					ce.actionUpdate(CarAction.get(rotr.action), CarPriority.CP_SHOULD);
				}
			}	
		}
	}
}
