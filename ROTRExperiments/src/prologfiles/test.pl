%rule number, belief, intentions, returns (actions/intentions)

%Rule Description: Vehicle Condition must be ok
rule(r89, standard, [vehicleUnsafe], [], [must-next_safe_stop]).


%Rule Description: fit to drive
%Rule Description: avoiding tiredness
%Rule Description: Vision
rule(r92, standard, [canReadNumberPlate], [], [must-next_safe_stop]).%TODO: Hand check


%Rule Description: Dazzled
rule(r93, standard, [dazzled], [], [should-slowdown]).


%Rule Description: Do not use tinted glasses
%Rule Description: Do not drink and drive
%Rule Description: Do not drug and drive
%Rule Description: Before setting off
rule(r97, standard, [settingOff, routePlanned, fuel], [], []).
rule(r97, standard, [settingOff], [], [should-prepare_route]).


%Rule Description: Towing
rule(r98, standard, [towing, routePlanned, loadSecure, loadNotStickingOut, loadBalanced], [], []).
rule(r98, standard, [towing, routePlanned], [], [must-prepare_load]).


%Rule Description: Seatbelts
rule(r99, standard, [allPassengersWearingSeatBeltsAsRequired, allChildrenUsingChildSeatAsRequired], [], []).
rule(r99, standard, [], [], [must-put_on_seatbelts]).

%Rule Description: Booster Seats
rule(r100, standard, [boosterSeatsRequired, boosterSeatsfittedCorrectly], [], []).
rule(r100, standard, [boosterSeatsRequired], [], [must-fit_booster_seat]).


%Rule Description: Rear facing baby seats
rule(r101, standard, [rearfacingbabyseatinfrontpassengerseat, activefrontalairbaginfrontpassengerseat], [], [turn_off_frontal_airbag_or_move_rear_facing_baby_seat]).


%Rule Description: Children in cars
rule(r102, standard, [childPassengers, childlocksEngaged], [], [should-engage_child_locks]).%TODO: Hand check


%Rule Description: Signals (turn off if wrong)
rule(r103, standard, [indicatorOn, finishedManoeuvre, indicatorOn, misleadingSignal], [], [should-cancel_signals]).%TODO: Hand check


%Rule Description: Signals (turn off if wrong)
rule(r103a, standard, [indicatorOn, changeCourseOrDirection, misleadingSignal], [], [should-use_signals]).%TODO: Hand check


%Rule Description: Other people won't use signals correctly
%Rule Description: Must obey authorised persons signals
rule(r105, standard, [seenSignalByAuthorisedPerson], [], [must-obey_signal]).


%Rule Description: Police Stopping
rule(r106, standard, [policeflashingBlue, policeflashingHeadlight, policehornSounding, policeDirectingLeft], [], [must-safe_pull_over_and_stop]).%TODO: Hand check


%Rule Description: Driver and Vehicle
rule(r107, standard, [dvsaflashingAmber, dvsafollowRequest, dvsaflashingAmber, dvsapullOverSignal], [], [must-follow_dvsa_until_stopped], Y, R)); (member(dvsaflashingAmber,  B),  member(dvsapullOverSignal,  B),  rule(r108,  B,  I,  Y),  append([must-safe_pull_over_and_stop]).%TODO: Hand check


%Rule Description: Traffic officers
rule(r108, standard, [toflashingAmber, tpDirectingLeft], [], [must-safe_pull_over_and_stop]).


%Rule Description: Traffic Signs
rule(r109, standard, [seenSign, signConfictsWithAuthorisedPersonDirection], [], [must-follow_sign]).%TODO: Hand check


%Rule Description: Flashing headlights
rule(r110, standard, [flashHeadlight, informOtherRoadUser], [], [must-remove_flash_intention]).


%Rule Description: Do not assume flashing headlights
%Rule Description: When to use horn
rule(r112, standard, [soundHorn, nodanger, stationary], [], [must-remove_horn_intention]).


%Rule Description: Lights including sidelights
rule(r113, standard, [sidelightsOff, betweenSunriseSunset], [], [must-turn_sidelights_on]).

rule(r113a, standard, [headlightsOff, visibilityReduced, night, litStreetLightingRoad], [], [must-turn_sidelights_on]).%TODO: Hand check


%Rule Description: Lights continued 
rule(r114, standard, [fogLightsOn, visibilityReduced], [], [must-turn_foglights_off]).%TODO: Hand check

rule(r114a, standard, [lightsCausingDiscomfortToOthers], [], [must-reduce_lighting]).


%Rule Description: Using dipped lights, third point is used in rule 93
rule(r115, standard, [headlightsDipped, night, builtuparea, betweenSunriseSunset, overtaking, dullWeather], [], [should-set_headlights_to_dipped]).%TODO: Hand check


%Rule Description: Hazard lights
rule(r116, standard, [setHazardsOn, tempObstructingTraffic, stationary, onMotorway, hazardAhead], [], [should-set_hazards_off]).%TODO: Hand check


%Rule Description: Standard Breaking
rule(r117, standard, [brake], [], [should-brake_early_lightly]).


%Rule Description: Skids
rule(r119, standard, [skidding], [], [should-turn_into_skid, should-release_brake, should-ease_off]).


%Rule Description: Dry brakes after water
rule(r121, standard, [drivenThroughDeepPuddle], [], [should-dry_brakes]).


%Rule Description: Coasting
rule(r122, standard, [gearNeutral, driving], [], [should-avoid_coasting]).


%Rule Description: Must not leave vehicle parked and running
rule(r123, standard, [pulledOver, diagnosingFaults], [], [should-switch_off_engine,  should-engage_parking_break]).%TODO: Hand check


%Rule Description: Speeding
rule(r124, standard, [exceedingSpeedLimit], [], [must-reduce_speed]).


%Rule Description: Speed to conditions
rule(r125, standard, [roadPresentsHazards, sharingRoadWithOthers, adverseWeather, night], [], [should-reduce_overall_speed]).%TODO: Hand check


%Rule Description: Stopping distances (time gaps given to help calculate)
rule(r126, standard, [canStopBeforeCarInFrontStops], [], [should-increase_distance_to_car_infront]).


%Rule Description: Broken white line
rule(r127, standard, [centerLine, turnOff, overtake, roadClear], [], [should-stopCrossingHazardWarningLine]).%TODO: Hand check


%Rule Description: Double white, closest broken
rule(r128, standard, [crossHazardWarningLine, turnOff, overtake, roadClear, completeOvertakeBeforeSolidWhiteLine], [], [should-stopCrossingHazardWarningLine]).%TODO: Hand check


%Rule Description: Double white, closest solid
rule(r129, standard, [crossDoubleWhiteClosestSolid], [], []).
	((member(turnOff,I), member(clearToTurnOff,B));
	 (member(overtake,I), member(roadAheadClear,B);
	 (member(slowMovingVehicleInfront,B); member(stationaryVehicleInFront,B)))
	), rule(r130, B, I, Y), append([must-stopCrossDoubleWhiteClosestSolid],Y,R), !.


%Rule Description: Chevrons (two types)
rule(r130, standard, [whiteDiagonalStripeWhiteBrokenBorder, enterWhiteDiagonalStripeWhiteBrokenBorder, safeToEnter, enterWhiteDiagonalStripeWhiteBrokenBorderNecessary], [], []).
rule(r130, standard, [whiteDiagonalStripeWhiteBrokenBorder], [], [should-doNotEnterWhiteDiagonalStripeWhiteBrokenBorder]).
rule(r130, standard, [whiteDiagonalStripeWhiteBrokenBorder], [], []).%TODO: Hand check

rule(r130a, standard, [whiteDiagonalStripeWhiteSolidBorder, enterWhiteDiagonalStripeWhiteSolidBorder], [], [must-doNotEnterWhiteDiagonalStripeWhiteSolidBorder]).


%Rule Description: lane dividers
rule(r131, standard, [laneDividers, betweenLanes], [], [should-goBetweenLaneDividers]).%TODO: Hand check


%Rule Description: Defines what refective road studs are, not really a rule
%Rule Description: Changing lane
rule(r133, standard, [changeLane, nextLaneClear, indicatorOn], [], [should-indicatorOn]).%TODO: Hand check
rule(r133, standard, [changeLane, nextLaneClear, indicatorOn], [], [should-indicatorOn,  should-nextLaneClear]).%TODO: Hand check


%Rule Description: Merging in turn in congested traffic, and avoid lane changes in congested traffic
rule(r134, standard, [trafficCongested, numLanesReducing, trafficSlow], [], [should-mergeInTurn,  should-nextLaneClear]).


rule(r134a, standard, [trafficCongested, changeLane], [], [should-avoidLaneChanges]).


%Rule Description: Single Carriageway - 3 lanes
rule(r135, standard, [middleLane, singleCarriageWay, lanes3, overtake, turnRight], [], [should-avoidLaneChanges,  must-avoidRightHandLane]).%TODO: Hand check
rule(r135, standard, [singleCarriageWay], [], [must-avoidRightHandLane]).


%Rule Description: Single Carriageway - 4+ lanes
rule(r136, standard, [singleCarriageWay, lanes4plus], [], [should-followLaneSigns]).


%Rule Description: Dual Carriageway - 2 lane
rule(r137, standard, [rightHandLane, dualCarriageWay, lanes2, overtake, turnRight], [], [should-go_to_left_hand_land]).%TODO: Hand check


%Rule Description: Dual Carriageway 3 lane
rule(r138, standard, [leftMostLane, dualCarriageWay, lanes3, overtake], [], [should-go_to_left_hand_land]).%TODO: Hand check


%Rule Description: Climbing/Crawler Lanes
rule(r139, standard, [crawlerLaneExists, amSlowMovingVehicle, vehiclesWishToOvertake], [], [should-use_crawler_lane]).%TODO: Hand check


%Rule Description: Cycle lanes, do not park/use
rule(r140, standard, [beInCycleLane, cycleLaneUnavoidable], [], [must-use_road,  must-avoid_parking]).%TODO: Hand check


%Rule Description: Bus Lanes
rule(r141, standard, [busLane, busLaneInOperation], [], [should-avoid_bus_lane]).


%Rule Description: Other Lane Types
rule(r142, standard, [hovLane], [], [must-avoid_hov_lane]).


rule(r142a, standard, [laneRestricted], [], [must-avoid_lane_lane]).


%Rule Description: One way street
rule(r143, standard, [carriageway, selectLane], [], [must-travel_sign_direction,  should-going_left_use_left,  should-going_right_use_left]).


%Rule Description: drive without care and attention etc
rule(r144, standard, [], [], [must-not_drive_dangerously,  must-drive_care_attention,  must-consideration_others]).

%Rule Description: Drive on pavement
rule(r145, standard, [pavement, footpath, bridleway, accessProperty], [], [road_surfaces-avoid_non-must]).%TODO: Hand check


%Rule Description: Adapt driving
%Rule Description: Be considerate
%Rule Description: Concentrate
%Rule Description: Must not use phone
%Rule Description: Must give up control to driver (Implied)
rule(r150, standard, [driverWantsControl], [], [must-give_up_control]).


%Rule Description: slow moving traffic
rule(r151, standard, [slowMovingTraffic], [], [should-reduce_distance_between_front_vehicle,  should-leave_space_for_manover,  should-leave_space_to_stop,  should-avoid_undertaking,  should-avoid_blocking_sideroads]).


%Rule Description: pay attention during residential streets
%Rule Description: Traffic calming measures 
rule(r153, standard, [trafficCalming], [], [should-maintained_reduced_speed,  should-avoid_overtaking,  should-allow_cyclists_moto_pass]).


%Rule Description: Country road - pay attention/follow speed signs
%Rule Description: Singletrack roads
rule(r155, standard, [singleTrackRoad, behindWantToOvertake, carTowardsYou], [], [should-pull_into_passing_place]).%TODO: Hand check


rule(r155a, standard, [singleTrackRoad, carTowardsYou, goingDownhill], [], [should-give_way_to_other]).


rule(r155b, standard, [singleTrackRoad, noPassingPlaceInFront], [], [should-reverse_to_passing_place]).


rule(r155c, standard, [singleTrackRoad, nonMotorTraffic], [], [should-reduce_speed]).


%Rule Description: Do not park in passing place
rule(r156, standard, [park], [], [must-do_not_park_in_passing_place]).


%Rule Description: minibikes should not be used
%Rule Description: quadbikes not to be used, must meet legal motor standard, restates not to drive on pavement
%Rule Description: Moving Off, use signal and look
rule(r159, standard, [setOff, indicatorOn, clearToManover], [], []).
rule(r159, standard, [setOff], [], [should-indicator_on,  must-road_clear_to_manover]).


%Rule Description: Once moving
rule(r160, standard, [driving, overtake, turnRight, passVehicles, roadSignKeepLeftOverride, roadMarkingKeepLeftOverride], [], [should-keep_left]).%TODO: Hand check


%Rule Description: Use mirrors
%Rule Description: Before Overtaking
rule(r162, standard, [overtake, roadAheadClear, overtaken], [], [should-cancel_overtaking]).%TODO: Hand check


%Rule Description: Overtaking, undertaking 
rule(r163, standard, [overtake], [], [should-space_for_vehicle,  should-move_quickly_past,  should-move_left]).


rule(r163a, standard, [undertaking, carInFrontTurningRight, stayingInLane, congestedTraffic], [], [should-cancel_undertaking]).%TODO: Hand check


%Rule Description: Overtaking large vehicles
rule(r164, standard, [overtake, largeVehicleInFront], [], [should-drop_back]).


%Rule Description: Must not overtake
rule(r165, standard, [overtake, crossDoubleWhiteClosestSolid, areaWithSolidWhiteBorder, nearPedistrianCrossing, enterRestrictedLane, noOvertakingSign], [], [must-cancel_overtaking]).%TODO: Hand check


%Rule Description: Should not overtake
rule(r166, standard, [overtake, approachingCorner, approachingHumpBridge, approachingBrow], [], [should-cancel_overtaking]).%TODO: Hand check


%Rule Description: Should not overtake (part 2)
rule(r167, standard, [overtake, approachingJunction, roadNarrows, approachingSchoolCrossing, trafficQueuing, levelCrossing], [], [should-cancel_overtaking]).%TODO: Hand check


%Rule Description: Being overtaken
rule(r168, standard, [overtaken], [], [should-prepare_drop_back]).


%Rule Description: Holding up traffic
rule(r169, standard, [longQueueBehind, clearRoadAhead], [], [should-pull_over_safe_place,  should-allow_traffic_to_pass]).


%Rule Description: Extra care at junctions, also give way to pedestrians
rule(r170, standard, [pedestriansInRoad], [], [should-give_way_to_pedestrians]).


%Rule Description: Stop at stop sign
rule(r171, standard, [stopSign, whiteLineAcrossRoad], [], [must-stop_at_white_line,  should-wait_for_gap_before_moving_off]).


%Rule Description: Give way at give way sign
rule(r172, standard, [giveWaySign, dottedWhiteLineAcrossRoad], [], [must-give_way_at_dotted_white_line]).


%Rule Description:Crossing dual carriage way
rule(r173, standard, [crossDualCarriageWay], [], []).
	(
	(member(vehicleFitsInCentralReservation,B), rule(r174, B, I, Y), append([should-use_central_reservation],Y,R));
	(member(vehicleDoesntFitsInCentralReservation,B), rule(r174, B, I, Y), append([must-dont_use_central_reservation],Y,R))
	), !. 


%Rule Description: Box junctions
rule(r174, standard, [enterBoxJunction, exitClear, signalledRoundabout], [], [must-wait_until_clear]).%TODO: Hand check


rule(r174a, standard, [enterBoxJunction, routeClear, signalledRoundabout], [], [must-wait_until_route_clear]).%TODO: Hand check


%Rule Description: Traffic Lights (Stop at red)
rule(r175, standard, [approachingTrafficLight, atTrafficLight, lightGreen], [], [must-stop_at_white_line]).%TODO: Hand check
rule(r175, standard, [approachingTrafficLight, atTrafficLight, lightAmber, unableToStopByWhiteLine], [], [must-stop_at_white_line]).%TODO: Hand check


%Rule Description: Stay stopped at red
rule(r176, standard, [setOff, atTrafficLight, lightGreen, exitClear], [], [must-wait_until_route_clear]).%TODO: Hand check


%Rule Description: Filter Arrow
rule(r177, standard, [atTrafficLight, greenFilterLightForExit], [], [should-allowed_to_proceed]).


%Rule Description: Advanced stop lines: TODO
rule(r178, standard, [atTrafficLight, hasAdvancedStop, lightGreen, safeToCross], [], [must-wait_at_advanced_stop]).%TODO: Hand check
rule(r178, standard, [atTrafficLight, hasAdvancedStop, lightGreen, passedFirstWhiteLine], [], [must-wait_at_advanced_stop]).%TODO: Hand check
rule(r178, standard, [atTrafficLight, hasAdvancedStop, lightGreen, passedFirstWhiteLine], [], [must-wait_at_first_white_line]).%TODO: Hand check


%Rule Description: Turning Right
rule(r179, standard, [turnRight], [], [should-use_right_indicator, should-position_right_turn, should-allow_undertaking]).


%Rule Description: Turning right continued
rule(r180, standard, [turnRight], [], [should-wait_until_safe_gap, should-not_overtaken, must-avoid_cutting_corner]).


%Rule Description: Techniques for turning right (not a rule)
%Rule Description: Turning Left
rule(r182, standard, [turnLeft], [], [should-use_left_indicator, must-avoid_overtaking]).


%Rule Description: While turning
rule(r183, standard, [turning], [], [should-keep_left, should-give_way_other_roads]).


%Rule Description: Approach Roundabout
rule(r184, standard, [approachingRoundabout], [], [should-adjust_speed,  should-get_in_lane,  should-give_signal]).


%Rule Description: reaching roundabout
rule(r185, standard, [reachedRoundabout], [], [should-give_priority_to_right]).


%Rule Description: Roundabout signals and positions
rule(r186, standard, [], [], []).
(member(firstExitRoundabout, I), rule(r188, B, I, Y), append([should-signal_left, should-approach_left_hand_lane],Y,R));
(member(rightExitRoundabout, I), rule(r188, B, I, Y), append([should-signal_right, should-approach_left_hand_lane,should-signal_left_on_exit],Y,R));
(member(otherRoundabout, I), rule(r188, B, I, Y), append([should-select_lane, should-stay_in_lane, should-signal_left_on_exit],Y,R))), !.


%Rule Description: Pay attention at roundabout
%Rule Description: roundabouts-mini should be treated the same.
rule(r188, standard, [roundabouts-mini], [], [must-treat_as_roundabout,  must-pass_around,  should-avoid_uturn]).


%Rule Description: double roundabouts - treat as normal
%Rule Description: multiple roundabout - treat as normal
%Rule Description: must not overtake or park at crossing
rule(r191, standard, [atCrossing], [], [must-avoid_parking,  must-avoid_overtaking]).


%Rule Description: keep crossing clear in queueing traffic
rule(r192, standard, [atCrossing], [], [should-keep_crossing_clear]).


%Rule Description: Pay attention at crossing
%Rule Description: Don't rev at pedestrians crossing
%Rule Description: Zebra crossings
rule(r195, standard, [zebraCrossing], [], [must-must_stop_pedestrian_crossing,  should-reduce_speed_if_pedestrians]).


%Rule Description: PelicanCrossing
rule(r196, standard, [pelicanCrossing, lightRed, lightFlashingAmber, pedestriansInRoad], [], [must-stop_at_crossing]).%TODO: Hand check


%Rule Description: Defines pelican crossing, how to recognise
%Rule Description: People crossing as light goes green
rule(r198, standard, [atCrossing, lightGreen, pedestriansInRoad], [], [should-give_way_to_pedestrians]).


%Rule Description: Toucan, puffin, equestrian should be treated as traffic lights
rule(r199, standard, [toucanCrossing, puffinCrossing, equestrianCrossing], [], [should-treat_as_traffic_light]).%TODO: Hand check


%Rule Description: uTurn
rule(r200, standard, [uturn], [], [should-find_quiet_side_road]).


%Rule Description: Do not reverse into main road, and reverse onto drive
rule(r201, standard, [sideroad, reversing, mainRoadNextRoad], [], [must-cancel_reverse]).


rule(r201a, standard, [pullIntoDriveway], [], [should-reverse_into_drive]).


%Rule Description: pay attention while reversing
%Rule Description: Must not reverse more than necessary
rule(r203, standard, [reversing], [], [must-minimise_reversing]).


%Rule Description: defines vulnerable road users
%Rule Description: pay attention to pedestrians, and how to treat rural roads with walkers
%Rule Description: when drive slowly
rule(r206, standard, [crowdedShoppingStreet, homezone, quietlane, passParkedVehicles, reversing, roadWorks], [], [should-drive_slowly]).%TODO: Hand check


rule(r206a, standard, [ruralRoad, pedestriansInRoad], [], [should-drive_slowly,  should-prepare_to_stop]).


%Rule Description: extension of 204, more definitions of vulnerable people

%Rule Description: Near schools
rule(r208, standard, [nearSchool, flashingAmber], [], [should-drive_slowly]).%TODO: Hand check
rule(r208, standard, [nearSchool, flashingAmber], [], [should-drive_very_slowly]).


%Rule Description:Passing school bus
rule(r209, standard, [overtake, overtakingSchoolBus], [], [should-drive_slowly]).


%Rule Description: Stop at stop sign held by school crossing patrol
rule(r210, standard, [stopForChildrenSign], [], [must-stop_at_crossing_patrol]).


%Rule Description: Look out for motorcyclists
%Rule Description: Give room to motorcyclists.
rule(r212, standard, [overtaking, motorcyclistAhead], [], [should-give_room_when_passing]).


%Rule Description: Pay attention to motor/cyclists
%Rule Description: Animals
rule(r214, standard, [animalInRoad, canPassAnimal], [], [should-drive_slowly,  should-avoid_horn,  should-avoid_revs]).


rule(r214a, standard, [animalInRoad, canPassAnimal], [], [should-stop_and_turn_engine_off]).%TODO: Hand check


%Rule Description: Horses/ horse drawn captured by 214
%Rule Description: Older drivers exist
%Rule Description: Be patient with learners
%Rule Description: Home zone/Quiet lanes
rule(r218, standard, [homezone, quietlane], [], [should-drive_slowly,  should-prepare_to_stop]).%TODO: Hand check


%Rule Description: Emergency vehicles
rule(r219, standard, [emergencyVehicle, flashingSirens], [], [should-allow_emergency_vehicle_to_pass,  should-avoid_harsh_braking]).


%Rule Description: Power vehicles for disabled (8mph max) must have a flashing amber beacon on roads with a 50mph+ limit
%Rule Description: Large Vehicles
rule(r221, standard, [largeVehicle], [], [should-allow_extra_space,  should-prepare_to_stop]).


%Rule Description: Large Vehicles - can block view
rule(r222, standard, [largeVehicleInFront], [], [should-give_extra_seperation_distance]).


%Rule Description: Buses, coaches, trams
rule(r223, standard, [publicTransport], [], [should-give_priority_to_public_transport]).


%Rule Description: Be careful around electric vehicles (trams/milk floats)
%Rule Description: flashing amber (unless vehicle used before 1947, unlikely for a autonomous vehicle)
rule(r225, standard, [flashingAmberBeacon], [], [should-approach_with_caution]).


rule(r225a, standard, [maxPossibleSpeed25orLess], [], [must-flash_amber_beacon]).


%Rule Description: Headlights
rule(r226, standard, [visibilityReduced], [], [must-headlights_on,  should-fog_lights_on]).
rule(r226, standard, [], [], [must-fog_lights_off]).

%Rule Description: Wet weather
rule(r227, standard, [wetWeather], [], [should-increase_distance_to_car_infront]).


%Rule Description: Icy/Snowy
rule(r228, standard, [icyWeather, essentialTravel], [], [must-do_not_drive]).%TODO: Hand check


%Rule Description: Icy/Snowy, setting off
rule(r229, standard, [icyWeather, settingOff], [], [must-clear_ice_snow_all_windows,  must-light_and_number_plates_clean,  should-mirrors_clear,  should-remove_all_snow]).


%Rule Description: Driving icy/snowy
rule(r230, standard, [icyWeather, driving], [], [should-give_extensive_extra_seperation_distance]).


rule(r230a, standard, [icyWeather, overtakeSnowplow, laneCleared], [], [must-do_not_overtake]).%TODO: Hand check


%Rule Description: Drive icy/snowy
rule(r231, standard, [icyWeather], [], [should-drive_very_slowly,  should-drive_very_slowly_on_bends]).


%Rule Description: Windy Weather - can blow off course
%Rule Description: Windy Weather - Keep well back from motocylists overtaking highsided vehicle
rule(r233, standard, [windy, motorcyclistInFront, overtakingHighSidedVehicle], [], [should-keep_well_back]).


%Rule Description: Entering fog
rule(r234, standard, [approachingFog], [], [should-slow_down]).


%Rule Description: In Fog
rule(r235, standard, [fog], [], [should-pull_up_in_visible_distance,  must-headlights_on,  should-use_windscreen_wipers,  should-use_demisters,  should-do_not_hestitate]).


%Rule Description: Fog lights
rule(r236, standard, [visibilityReduced], [], [must-fog_lights_off]).%TODO: Hand check


%Rule Description: Hot weather
rule(r237, standard, [dazzled], [], [should-slow_down_and_stop]).


%Rule Description: General waiting and parking
rule(r238, standard, [yellowLine, withinTimePlateTimes, doubleYellowLine, schoolEntranceMarkings], [], [must-avoid_waiting,  must-avoid_parking]).%TODO: Hand check


%Rule Description: Parking
rule(r239, standard, [park, dedicatedParkingArea], [], [must-avoid_parking_against_flow,  should-park_as_close_to_side,  must-engine_off,  must-handbrake_on,  should-lock]).%TODO: Hand check


%Rule Description: Parking continued
rule(r240, standard, [park, stop], [], []).%TODO: Hand check
	(
		(member(emergencyArea, B));
		(member(pedestrianCrossing, B));
		(member(clearway, B));
		(member(taxibay, B));
		(member(urbanClearway, B), member(withinUrbanClearwayHours, B), \+member(setOffPassengers,I));
		(member(doubleWhiteLines, B), \+member(setOffPassengers, I), \+member(goodsLoadingUn, I));
		(member(tramlines, B));
		(member(cyclelane, B), member(withinCyclelaneOpteration, B));
		(member(redlines, B), \+member(parkingAllowedBySigns, B));
		(member(prohibitedToStopPark, B))
	),rule(r241, B, I, Y), append([must-avoid_parking, must-avoid_stopping],Y,R), !.


%Rule Description: Parking continued
rule(r241, standard, [park, parkingRestrictions, meetParkingRestrictions], [], [must-avoid_parking]).%TODO: Hand check


%Rule Description: Parking still continued
rule(r242, standard, [park, dangerousToStop, unncessaryObstruction], [], [must-avoid_parking]).%TODO: Hand check


%Rule Description: More parking
rule(r243, standard, [stop, park, stationaryTraffic], [], []).%TODO: Hand check
(
	(member(schoolEntrance, B));
	(member(preventingAccessForEmergencyServices, B));
	(member(nearbusStop, B));
	(member(nearTramStop, B));
	(member(nearTaxiRank, B));
	(member(levelCrossingApproach, B));
	(member(tramlinesCrossingApproach, B));
	(member(toJunction10meters, B); (\+member(authorisedParkingPlace,B)));
	(member(nearBrowOfHill, B));
	(member(nearHumpbridge, B));
	(member(oppositeTrafficIsland, B));
	(member(oppositeParkedVehicle, B), member(obstructingTraffic));
	(member(forceTrafficToTramlane, B));
	(member(kerbLoweredForWheelchair, B));
	(member(propertyEntrance, B));
	(member(bendInRoad, B));
	(member(obstructCycleFacilities, B))
), rule(r244, B, I, Y), append([must-avoid_parking, must-avoid_stopping],Y,R), !.


%Rule Description: Pavement parking
rule(r244, standard, [park, onPavement, london], [], [must-avoid_parking]).
rule(r244, standard, [park, onPavement, london], [], [should-avoid_parking]).%TODO: Hand check


%Rule Description: Parking zones, discribed
%Rule Description: Goods vehicle parking
%Rule Description: Loading and unloading
rule(r247, standard, [loadUn], [], []).
(
	(member(yellowMarkingsOnKerb, B), member(signsAdviseRestrictions, B));
	(member(redRoute, B), \+member(markedBayForLoading, B))
), rule(r248, B, I, Y), append([must-avoid_loading_unloading],Y,R), !.


%Rule Description: Parking at night
rule(r248, standard, [park, night, againstFlowOfTraffic], [], [must-avoid_parking]).


%Rule Description: ParkingLights
rule(r249, standard, [parked], [], [must-parking_lights_on]).


%Rule Description: ParkingLights regular vehicles
rule(r250, standard, [parked, toJunction10meters], [], [must-parking_lights_on]).%TODO: Hand check


%Rule Description: Parking in fog
rule(r251, standard, [fog, parkedInRoad], [], [should-parking_lights_on]).


%Rule Description: Parking on hills
rule(r252, standard, [park, hill, uphill], [], [should-close_to_kerb,  should-wheel_away_from_kerb,  should-handbrake_on]).
rule(r252, standard, [park, hill, downhill], [], [should-close_to_kerb,  should-wheel_toward_from_kerb,  should-handbrake_on]).


%Rule Description: Prohibited Vehicles
rule(r253, standard, [enterMotorway, slowMovingVehicle], [], [must-avoid_motorway]).


%Rule Description: Traffic faster so pay attention
%Rule Description: Read signs
%Rule Description: Signs exist
%Rule Description: Amber lights on sign
rule(r257, standard, [motorway, signFlashingAmber], [], [should-reduce_speed]).


%Rule Description: Red flashing light%Rule Description: Red flashing light across all lanes
rule(r258, standard, [motorway, signFlashingRedX, laneAvailiable], [], [must-follow_sign,  must-avoid_closed_lane]).
rule(r258, standard, [motorway, signFlashingRedX, laneAvailiable], [], [must-stop_at_sign,  must-follow_police_direction]).%TODO: Hand check


%Rule Description: Joining the motorway
rule(r259, standard, [enterMotorway], [], [should-priority_to_motoway_traffic,  should-match_speed_to_motorway,  should-avoid_hard_shoulder,  should-dont_cross_solid_white,  should-stay_on_running_lane,  should-keep_left_lane]).


%Rule Description: On motorway
rule(r260, standard, [motorway], [], [should-steady_speed,  should-safe_distance]).


%Rule Description: keep to speed limit motorway
rule(r261, standard, [motorway], [], [must-keep_under_speed_limit]).


%Rule Description: take breaks
%Rule Description: don't reverse etc
rule(r263, standard, [motorway], [], [must-avoid_drive_against_traffic_flow,  must-avoid_crossing_central_reservation,  must-avoid_reversing]).


%Rule Description: Stay in leftMostLane
rule(r264, standard, [motorway, overtaking], [], [should-keep_left_lane]).%TODO: Hand check
rule(r264, standard, [motorway, overtaking], [], [should-move_adjacent_lane]).%TODO: Hand check


%Rule Description: Vehicles banned from right hand lane (3+)
%Rule Description: Get into lane quickly
rule(r266, standard, [motorway, approachingJunction, directionSigns], [], [should-get_into_lane]).%TODO: Hand check


%Rule Description: Overtaking on the motorway
rule(r267, standard, [motorway, overtake], [], [should-overtake_on_right,  should-lane_clear,  should-signal]).


%Rule Description: continued
rule(r268, standard, [motorway, overtake], [], [must-avoid_overtaking_on_left,  must-avoid_weaving]).


%Rule Description: Avoid hard shoulder
rule(r269, standard, [motorway, directedByPoliceOfficer, speedlimitForHardShoulder], [], [must-avoid_hard_shoulder]).%TODO: Hand check


%Rule Description: Avoid emergency area
rule(r270, standard, [motorway], [], [must-avoid_emergency_area]).


%Rule Description: Must not stop 
rule(r271, standard, [motorway, directedByPoliceOfficer, signSayingStop], [], [must-avoid_stopping]).%TODO: Hand check


%Rule Description: Must not pick up people/ set down people
rule(r272, standard, [motorway], [], [must-avoid_pick_up_set_down]).


%Rule Description: Leaving motorway
rule(r273, standard, [leaveMotorway], [], [should-move_to_left_hand_lane,  should-signal_left_on_exit,  should-reduce_speed_on_slip_road]).


%Rule Description: Reduce speed on slipway
rule(r274, standard, [sliproad], [], [should-reduce_speed_on_slip_road]).


%Rule Description: Breakdown
rule(r276, standard, [brokendown, motorway], [], [should-get_off_road,  should-use_hazard_lights,  should-keep_sidelights_on]).%TODO: Hand check


%Rule Description: Breakdown (motorway)
rule(r277, standard, [brokendown, motorway], [], [should-go_to_left_hand_land,  should-use_hazard_lights,  should-keep_sidelights_on,  should-pull_into_hard_shoulder,  pull_into_emergency_area]).


%Rule Description: Rejoin
rule(r278, standard, [joinMotorway, hardshoulder], [], [should-buildup_speed_on_motorway]).


%Rule Description: Disabled drivers
%Rule Description: Dont remove obstructions
%Rule Description: Emergency servies in road
rule(r281, standard, [emergencyVehicleFlashingLightsAndStopped], [], [should-reduce_speed,  should-prepare_to_change_lane,  must-follow_police_direction]).


%Rule Description: Don't gawk at accidents
%Rule Description: In accident
rule(r283, standard, [inIncident], [], [should-safe_pull_over_and_stop,  should-use_hazard_lights,  should-switch_off_engine]).


%Rule Description: Defines signs on vehicle (dangerous vehicles)
%Rule Description: Accident with dangerous vehicles (nothing specific to vehicles)
%Rule Description: In accident (causing damage)
rule(r286, standard, [inIncident, damagedOrInjury], [], [must-stop]).


%Rule Description: Must produce insurance
%Rule Description: Road Works Ahead
rule(r288, standard, [roadWorksAhead], [], [must-dontExceedTempSpeedLimit,  should-keep_safe_distance,  should-get_into_lane,  should-avoid_lane_switching,  should-merge_in_turn,  must-avoid_coned_off_area,  should-allow_extra_space_for_works_vehicles]).


%Rule Description: Take special care on motorways
rule(r289, standard, [motorway, dualCarriageWay, workVehicleSign], [], [must-obey_work_vehicle_sign]).%TODO: Hand check


%Rule Description: Contraflow in roadWorks
rule(r290, standard, [roadWorks, contraflow], [], [should-increase_distance_to_car_infront,  should-reduce_speed]).


%Rule Description: Level crossing
rule(r291, standard, [nearLevelCrossing, exitClear], [], [must-avoid_crossing_level_crossing,  must-avoid_stopping,  must-avoid_parking]).%TODO: Hand check
rule(r291, standard, [nearLevelCrossing, exitClear], [], [must-avoid_stopping,  must-avoid_parking]).


rule(r291a, standard, [levelCrossing], [], [must-avoid_stopping,  must-avoid_parking]).


%Rule Description: Level crossing overhead electric lines
rule(r292, standard, [crossLevelCrossing, meetHeightRequirement], [], [must-avoid_level_crossing]).%TODO: Hand check


%Rule Description: Controlled Crossing
rule(r293, standard, [controlledCrossing, flashingRed], [], [must-stop_at_white_line]).
rule(r293, standard, [controlledCrossing, amber], [], [must-do_not_stop]).


rule(r293a, standard, [controlledCrossing], [], [must-do_not_reverse]).


rule(r293b, standard, [crossControlledCrossing, crossinglightsOff, barriersOpen], [], [must-avoid_crossing_level_crossing]).%TODO: Hand check


%Rule Description: Railway telephones
%Rule Description: Crossings without lights
rule(r295, standard, [crossControlledCrossing, noCrossingLights, barriersOpen], [], [must-avoid_crossing_level_crossing]).%TODO: Hand check


%Rule Description: User gates/barriers
rule(r296, standard, [stopSignCrossing, greenLight], [], [must-avoid_crossing_crossing]).%TODO: Hand check


%Rule Description: As before but no lights
rule(r297, standard, [stopSignCrossing, noLights], [], [must-avoid_crossing_crossing]).


%Rule Description: Open crossing
rule(r298, standard, [openCrossing, noLights], [], [must-avoid_crossing_crossing]).


%Rule Description: If breakdown on crossing, escape.
%Rule Description: tramlines
rule(r300, standard, [enterTramReservedRoad], [], [must-avoid_tram_reserved_road]).


rule(r300a, standard, [tramlines], [], [should-avoid_driving_on_rails]).


%Rule Description: Faced with tram
rule(r301, standard, [tram, tramPassingLane], [], [should-give_way_to_tram,  should-avoid_overtaking,  must-avoid_overtaking_on_left]).%TODO: Hand check
rule(r301, standard, [tram, tramPassingLane], [], [should-give_way_to_tram,  should-use_tram_passing_lane,  must-avoid_overtaking_on_left]).


%Rule Description: Park on tramlines
rule(r302, standard, [stop], [], [must-avoid_parking]).


%Rule Description: at tram stop
rule(r303, standard, [tramStop], [], [must-follow_signs,  must-avoid_overtaking,  must-avoid_overtaking_on_left]).


%Rule Description: Look for pedestrians
%Rule Description: Give way to trams
rule(r305, standard, [tram], [], [should-give_way_to_tram]).


%Rule Description: driving on tram tracks
%Rule Description: overhead electric lines
rule(r307, standard, [tramlines, meetHeightRequirement], [], [should-find_other_route]).%TODO: Hand check


%Emergency
%Rule Description: Emergency Breaking
rule(r118, standard, [brake], [], [should-brake_hard]).


%Rule Description: ABS - rule is same
rule(r120, standard, [brake], [], [should-brake_hard]).


%Rule Description: Stop in emergency
rule(r275, standard, [], [], [should-find_safe_place_to_stop]).

rule(end, _, _, []).

%Get suggested actions for any violations
getActions(standard, Beliefs, Intentions, Results) :- rule(r89, Beliefs, Intentions, Actions), sort(Actions, Results).
getActions(emergency, Beliefs, Intentions, Results) :- rule(r118, Beliefs, Intentions, Actions), sort(Actions, Results).
