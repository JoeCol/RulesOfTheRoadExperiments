%rule number, belief, intentions, returns (actions/intentions)

%Rule Description: Vehicle Condition must be ok
generateActions(r89, B, I, R) :- \+member(vehicleSafe, B), generateActions(r92, B, I, Y), append([must-next_safe_stop],Y,R), !.
generateActions(r89, B, I, R) :- generateActions(r92, B, I, R), !.

%Rule Description: fit to drive
%Rule Description: avoiding tiredness
%Rule Description: Vision
generateActions(r92, B, I, R) :- \+member(canReadNumberPlate, B), generateActions(r93, B, I, Y), append([must-next_safe_stop],Y,R), !.
generateActions(r92, B, I, R) :- generateActions(r93, B, I, R), !.

%Rule Description: Dazzled
generateActions(r93, B, I, R) :- member(dazzled, B), generateActions(r97, B, I, Y), append([should-slowdown],Y,R), !.
generateActions(r93, B, I, R) :- generateActions(r97, B, I, R), !.

%Rule Description: Do not use tinted glasses
%Rule Description: Do not drink and drive
%Rule Description: Do not drug and drive
%Rule Description: Before setting off
generateActions(r97, B, I, R) :- member(settingOff, I), member(routePlanned, B), member(fuel, B), generateActions(r98, B, I, R), !.
generateActions(r97, B, I, R) :- member(settingOff, I), generateActions(r98, B, I, Y), append([should-prepare_route],Y,R), !.
generateActions(r97, B, I, R) :- generateActions(r98, B, I, R), !.

%Rule Description: Towing
generateActions(r98, B, I, R) :- member(towing, I), member(routePlanned, B), member(loadSecure, B), member(loadNotStickingOut, B), member(loadBalanced, B), generateActions(r99, B, I, R), !.
generateActions(r98, B, I, R) :- member(towing, I), member(routePlanned, B), generateActions(r99, B, I, Y), append([must-prepare_load],Y,R), !.
generateActions(r98, B, I, R) :- generateActions(r99, B, I, R), !.

%Rule Description: Seatbelts
generateActions(r99, B, I, R) :- member(allPassengersWearingSeatBeltsAsRequired, B), member(allChildrenUsingChildSeatAsRequired, B), generateActions(r100, B, I, R), !.
generateActions(r99, B, I, R) :- generateActions(r100, B, I, Y), append([must-put_on_seatbelts],Y,R), !.

%Rule Description: Booster Seats
generateActions(r100, B, I, R) :- member(boosterSeatsRequired, B), member(boosterSeatsfittedCorrectly, B), generateActions(r101, B, I, R), !.
generateActions(r100, B, I, R) :- member(boosterSeatsRequired, B), generateActions(r101, B, I, Y), append([must-fit_booster_seat],Y,R), !.
generateActions(r100, B, I, R) :- generateActions(r101, B, I, R), !.

%Rule Description: Rear facing baby seats
generateActions(r101, B, I, R) :- member(rearfacingbabyseatinfrontpassengerseat, B), member(activefrontalairbaginfrontpassengerseat, B), generateActions(r102, B, I, Y), append([turn_off_frontal_airbag_or_move_rear_facing_baby_seat],Y,R), !.
generateActions(r101, B, I, R) :- generateActions(r102, B, I, R), !.

%Rule Description: Children in cars
generateActions(r102, B, I, R) :- member(childPassengers, B), \+member(childlocksEngaged), generateActions(r103, B, I, Y), append([should-engage_child_locks],Y,R), !.
generateActions(r102, B, I, R) :- generateActions(r103, B, I, R), !.

%Rule Description: Signals (turn off if wrong)
generateActions(r103, B, I, R) :- (member(indicatorOn, B), member(finishedManoeuvre, B)) ; (member(indicatorOn, B), member(misleadingSignal, B)), generateActions(r103a, B, I, Y), append([should-cancel_signals],Y,R), !.
generateActions(r103, B, I, R) :- generateActions(r103a, B, I, R), !.

%Rule Description: Signals (turn off if wrong)
generateActions(r103a, B, I, R) :- \+member(indicatorOn, B), member(changeCourseOrDirection, I), \+member(misleadingSignal, B), generateActions(r105, B, I, Y), append([should-use_signals],Y,R), !.
generateActions(r103a, B, I, R) :- generateActions(r105, B, I, R), !.

%Rule Description: Other people won't use signals correctly
%Rule Description: Must obey authorised persons signals
generateActions(r105, B, I, R) :- member(seenSignalByAuthorisedPerson, B), generateActions(r106, B, I, Y), append([must-obey_signal],Y,R), !.
generateActions(r105, B, I, R) :- generateActions(r106, B, I, R), !.

%Rule Description: Police Stopping
generateActions(r106, B, I, R) :- (member(policeflashingBlue, B); member(policeflashingHeadlight, B); member(policehornSounding, B)), member(policeDirectingLeft, B), generateActions(r107, B, I, Y), append([must-safe_pull_over_and_stop],Y,R), !.
generateActions(r106, B, I, R) :- generateActions(r107, B, I, R), !.

%Rule Description: Driver and Vehicle
generateActions(r107, B, I, R) :- (member(dvsaflashingAmber, B), member(dvsafollowRequest, B), generateActions(r108, B, I, Y), append([must-follow_dvsa_until_stopped],Y,R)); (member(dvsaflashingAmber, B), member(dvsapullOverSignal, B), generateActions(r108, B, I, Y), append([must-safe_pull_over_and_stop],Y,R)), !.
generateActions(r107, B, I, R) :- generateActions(r108, B, I, R), !.

%Rule Description: Traffic officers
generateActions(r108, B, I, R) :- member(toflashingAmber, B), member(tpDirectingLeft, B), generateActions(r109, B, I, Y), append([must-safe_pull_over_and_stop],Y,R), !.
generateActions(r108, B, I, R) :- generateActions(r109, B, I, R), !.

%Rule Description: Traffic Signs
generateActions(r109, B, I, R) :- member(seenSign, B), \+member(signConfictsWithAuthorisedPersonDirection, B), generateActions(r110, B, I, Y), append([must-follow_sign],Y,R), !.
generateActions(r109, B, I, R) :- generateActions(r110, B, I, R), !.

%Rule Description: Flashing headlights
generateActions(r110, B, I, R) :- member(flashHeadlight,I), member(informOtherRoadUser,B), generateActions(r112, B, I, Y), append([must-remove_flash_intention],Y,R), !.
generateActions(r110, B, I, R) :- generateActions(r112, B, I, R), !.

%Rule Description: Do not assume flashing headlights
%Rule Description: When to use horn
generateActions(r112, B, I, R) :- member(soundHorn, I), member(nodanger,B), member(stationary,B), member(builtupNightTime), generateActions(r113, B, I, Y), append([must-remove_horn_intention],Y,R), !.
generateActions(r112, B, I, R) :- generateActions(r113, B, I, R), !.

%Rule Description: Lights including sidelights
generateActions(r113, B, I, R) :- member(sidelightsOff,B), member(betweenSunriseSunset, B), generateActions(r113a, B, I, Y), append([must-turn_sidelights_on],Y,R), !.
generateActions(r113, B, I, R) :- generateActions(r113a, B, I, R), !.
generateActions(r113a, B, I, R) :- member(headlightsOff,B), (member(visibilityReduced, B); (member(night, B), \+member(litStreetLightingRoad, B))), generateActions(r114, B, I, Y), append([must-turn_sidelights_on],Y,R), !.
generateActions(r113a, B, I, R) :- generateActions(r114, B, I, R), !.

%Rule Description: Lights continued 
generateActions(r114, B, I, R) :- member(fogLightsOn,B), \+member(visibilityReduced, B), generateActions(r114a, B, I, Y), append([must-turn_foglights_off],Y,R), !.
generateActions(r114, B, I, R) :- generateActions(r114a, B, I, R), !.
generateActions(r114a, B, I, R) :- member(lightsCausingDiscomfortToOthers,B), generateActions(r115, B, I, Y), append([must-reduce_lighting],Y,R), !.
generateActions(r114a, B, I, R) :- generateActions(r115, B, I, R), !.

%Rule Description: Using dipped lights, third point is used in rule 93
generateActions(r115, B, I, R) :- \+member(headlightsDipped,B), (member(night,B), ((member(builtuparea, B), member(betweenSunriseSunset, B)); member(overtaking,B)); member(dullWeather,B)), generateActions(r116, B, I, Y), append([should-set_headlights_to_dipped],Y,R), !.
generateActions(r115, B, I, R) :- generateActions(r116, B, I, R), !.

%Rule Description: Hazard lights
generateActions(r116, B, I, R) :- member(setHazardsOn,I), not((member(tempObstructingTraffic,B), member(stationary,B)); (member(onMotorway,B), member(hazardAhead,B))), generateActions(r117, B, I, Y), append([should-set_hazards_off],Y,R), !.
generateActions(r116, B, I, R) :- generateActions(r117, B, I, R), !.

%Rule Description: Standard Breaking
generateActions(r117, B, I, R) :- member(brake,I), generateActions(r119, B, I, Y), append([should-brake_early_lightly],Y,R), !.
generateActions(r117, B, I, R) :- generateActions(r119, B, I, R), !.

%Rule Description: Skids
generateActions(r119, B, I, R) :- member(skidding,B), generateActions(r122, B, I, Y), append([should-turn_into_skid,should-release_brake,should-ease_off],Y,R), !.
generateActions(r119, B, I, R) :- generateActions(r122, B, I, R), !.

%Rule Description: Dry brakes after water
generateActions(r121, B, I, R) :- member(drivenThroughDeepPuddle,B), generateActions(r122, B, I, Y), append([should-dry_brakes],Y,R), !.
generateActions(r121, B, I, R) :- generateActions(r122, B, I, R), !.

%Rule Description: Coasting
generateActions(r122, B, I, R) :- member(gearNeutral,B), member(driving,B), generateActions(r123, B, I, Y), append([should-avoid_coasting],Y,R), !.
generateActions(r122, B, I, R) :- generateActions(r123, B, I, R), !.

%Rule Description: Must not leave vehicle parked and runing
generateActions(r123, B, I, R) :- member(pulledOver,B), \+member(diagnosingFaults,I), generateActions(r124, B, I, Y), append([should-switch_off_engine, should-engage_parking_break],Y,R), !.
generateActions(r123, B, I, R) :- generateActions(r124, B, I, R), !.

%Rule Description: Speeding
generateActions(r124, B, I, R) :- member(exceedingSpeedLimit,B), generateActions(r125, B, I, Y), append([must-reduce_speed],Y,R), !.
generateActions(r124, B, I, R) :- generateActions(r125, B, I, R), !.

%Rule Description: Speed to conditions
generateActions(r125, B, I, R) :- (member(roadPresentsHazards,B); member(sharingRoadWithOthers,B); member(adverseWeather,B); member(night,B)), generateActions(r125, B, I, Y), append([should-reduce_overall_speed],Y,R), !.
generateActions(r125, B, I, R) :- generateActions(r126, B, I, R), !.

%Rule Description: Stopping distances (time gaps given to help calculate)
generateActions(r126, B, I, R) :- member(canStopBeforeCarInFrontStops,B), generateActions(r127, B, I, Y), append([should-increase_distance_to_car_infront],Y,R), !.
generateActions(r126, B, I, R) :- generateActions(r127, B, I, R), !.

%Rule Description: Broken white line
generateActions(r127, B, I, R) :- member(centerLine,B), (\+member(turnOff,I); (member(overtake,I), member(roadClear,B))), generateActions(r128, B, I, Y), append([should-stopCrossingHazardWarningLine],Y,R), !.
generateActions(r127, B, I, R) :- generateActions(r128, B, I, R), !.

%Rule Description: Double white, closest broken
generateActions(r128, B, I, R) :- member(crossHazardWarningLine,I), (\+member(turnOff,I); (member(overtake,I), member(roadClear,B)); member(completeOvertakeBeforeSolidWhiteLine,B)), generateActions(r128, B, I, Y), append([should-stopCrossingHazardWarningLine],Y,R), !.
generateActions(r128, B, I, R) :- generateActions(r129, B, I, R), !.

%Rule Description: Double white, closest solid
generateActions(r129, B, I, R) :- member(crossDoubleWhiteClosestSolid,I), 
	((member(turnOff,I), member(clearToTurnOff,B));
	 (member(overtake,I), member(roadAheadClear,B);
	 (member(slowMovingVehicleInfront,B); member(stationaryVehicleInFront,B)))
	), generateActions(r130, B, I, Y), append([must-stopCrossDoubleWhiteClosestSolid],Y,R), !.
generateActions(r129, B, I, R) :- generateActions(r130, B, I, R), !.

%Rule Description: Chevrons (two types)
generateActions(r130, B, I, R) :- member(whiteDiagonalStripeWhiteBrokenBorder,B), member(enterWhiteDiagonalStripeWhiteBrokenBorder,I), member(safeToEnter,B), member(enterWhiteDiagonalStripeWhiteBrokenBorderNecessary,B), generateActions(r130a, B, I, R), !.
generateActions(r130, B, I, R) :- member(whiteDiagonalStripeWhiteBrokenBorder,B), generateActions(r130a, B, I, Y), append([should-doNotEnterWhiteDiagonalStripeWhiteBrokenBorder],Y,R), !.
generateActions(r130, B, I, R) :- \+member(whiteDiagonalStripeWhiteBrokenBorder,B), generateActions(r130a, B, I, R), !.

generateActions(r130a, B, I, R) :- member(whiteDiagonalStripeWhiteSolidBorder,B), member(enterWhiteDiagonalStripeWhiteSolidBorder,I), generateActions(r131, B, I, Y), append([must-doNotEnterWhiteDiagonalStripeWhiteSolidBorder],Y,R), !.
generateActions(r130a, B, I, R) :- generateActions(r131, B, I, R), !.

%Rule Description: lane dividers
generateActions(r131, B, I, R) :- member(laneDividers,B), \+member(betweenLanes,B), generateActions(r133, B, I, Y), append([should-goBetweenLaneDividers],Y,R), !.
generateActions(r131, B, I, R) :- generateActions(r133, B, I, R), !.

%Rule Description: Defines what refective road studs are, not really a rule
%Rule Description: Changing lane
generateActions(r133, B, I, R) :- member(changeLane,I), member(nextLaneClear,B), \+member(indicatorOn,B), generateActions(r134, B, I, Y), append([should-indicatorOn],Y,R), !.
generateActions(r133, B, I, R) :- member(changeLane,I), \+member(nextLaneClear,B), \+member(indicatorOn,B), generateActions(r134, B, I, Y), append([should-indicatorOn, should-nextLaneClear],Y,R), !.
generateActions(r133, B, I, R) :- generateActions(r134, B, I, R), !.

%Rule Description: Merging in turn in congested traffic, and avoid lane changes in congested traffic
generateActions(r134, B, I, R) :- member(trafficCongested,B), member(numLanesReducing,B), member(trafficSlow,B), generateActions(r134a, B, I, Y), append([should-mergeInTurn, should-nextLaneClear],Y,R), !.
generateActions(r134, B, I, R) :- generateActions(r135, B, I, R), !.

generateActions(r134a, B, I, R) :- member(trafficCongested,B), member(changeLane,I), generateActions(r134a, B, I, Y), append([should-avoidLaneChanges],Y,R), !.
generateActions(r134a, B, I, R) :- generateActions(r135, B, I, R), !.

%Rule Description: Single Carriageway - 3 lanes
generateActions(r135, B, I, R) :- member(middleLane, B), member(singleCarriageWay,B), member(lanes3, B), not(member(overtake,I); member(turnRight,I)), generateActions(r136, B, I, Y), append([should-avoidLaneChanges, must-avoidRightHandLane],Y,R), !.
generateActions(r135, B, I, R) :- member(singleCarriageWay,B), generateActions(r136, B, I, Y), append([must-avoidRightHandLane],Y,R), !.
generateActions(r135, B, I, R) :- generateActions(r136, B, I, R), !.

%Rule Description: Single Carriageway - 4+ lanes
generateActions(r136, B, I, R) :- member(singleCarriageWay,B), member(lanes4plus, B), generateActions(r137, B, I, Y), append([should-followLaneSigns],Y,R), !.
generateActions(r136, B, I, R) :- generateActions(r137, B, I, R), !.

%Rule Description: Dual Carriageway - 2 lane
generateActions(r137, B, I, R) :- member(rightHandLane, B), member(dualCarriageWay,B), member(lanes2, B), not(member(overtake,I); member(turnRight,I)), generateActions(r138, B, I, Y), append([should-go_to_left_hand_land],Y,R), !.
generateActions(r137, B, I, R) :- generateActions(r138, B, I, R), !.

%Rule Description: Dual Carriageway 3 lane
generateActions(r138, B, I, R) :- \+member(leftMostLane, B), member(dualCarriageWay,B), member(lanes3, B), member(overtake,I), generateActions(r139, B, I, Y), append([should-go_to_left_hand_land],Y,R), !.
generateActions(r138, B, I, R) :- generateActions(r139, B, I, R), !.

%Rule Description: Climbing/Crawler Lanes
generateActions(r139, B, I, R) :- member(crawlerLaneExists, B), (member(amSlowMovingVehicle, B) ; member(vehiclesWishToOvertake, B)), generateActions(r140, B, I, Y), append([should-use_crawler_lane],Y,R), !.
generateActions(r139, B, I, R) :- generateActions(r140, B, I, R), !.

%Rule Description: Cycle lanes, do not park/use
generateActions(r140, B, I, R) :- member(beInCycleLane, I), \+member(cycleLaneUnavoidable, B), generateActions(r141, B, I, Y), append([must-use_road, must-avoid_parking],Y,R), !.
generateActions(r140, B, I, R) :- generateActions(r141, B, I, R), !.

%Rule Description: Bus Lanes
generateActions(r141, B, I, R) :- member(busLane, B), member(busLaneInOperation, B), generateActions(r142, B, I, Y), append([should-avoid_bus_lane],Y,R), !.
generateActions(r141, B, I, R) :- generateActions(r142, B, I, R), !.

%Rule Description: Other Lane Types
generateActions(r142, B, I, R) :- member(hovLane,B), \+member(meetsHOVrequirement), generateActions(r142a, B, I, Y), append([must-avoid_hov_lane],Y,R), !.
generateActions(r142, B, I, R) :- generateActions(r142a, B, I, R), !.

generateActions(r142a, B, I, R) :- member(laneRestricted,B), \+member(meetsLanerequirement), generateActions(r143, B, I, Y), append([must-avoid_lane_lane],Y,R), !.
generateActions(r142a, B, I, R) :- generateActions(r143, B, I, R), !.

%Rule Description: One way street
generateActions(r143, B, I, R) :- member(carriageway,B), member(selectLane,I), generateActions(r144, B, I, Y), append([must-travel_sign_direction, should-going_left_use_left, should-going_right_use_left],Y,R), !.
generateActions(r143, B, I, R) :- generateActions(r144, B, I, R), !.

%Rule Description: drive without care and attention etc
generateActions(r144, B, I, R) :- generateActions(r145, B, I, Y), append([must-not_drive_dangerously, must-drive_care_attention, must-consideration_others],Y,R), !.

%Rule Description: Drive on pavement
generateActions(r145, B, I, R) :- (member(pavement,B) ; member(footpath,B) ; member(bridleway,B)), \+member(accessProperty,B), generateActions(r150, B, I, Y), append([road_surfaces-avoid_non-must],Y,R), !.
generateActions(r145, B, I, R) :- generateActions(r150, B, I, R), !.

%Rule Description: Adapt driving
%Rule Description: Be considerate
%Rule Description: Concentrate
%Rule Description: Must not use phone
%Rule Description: Must give up control to driver (Implied)
generateActions(r150, B, I, R) :- member(driverWantsControl,B), generateActions(r151, B, I, Y), append([must-give_up_control],Y,R), !.
generateActions(r150, B, I, R) :- generateActions(r151, B, I, R), !.

%Rule Description: slow moving traffic
generateActions(r151, B, I, R) :- member(slowMovingTraffic,B), generateActions(r153, B, I, Y), append([should-reduce_distance_between_front_vehicle, should-leave_space_for_manover, should-leave_space_to_stop, should-avoid_undertaking, should-avoid_blocking_sideroads],Y,R), !.
generateActions(r151, B, I, R) :- generateActions(r153, B, I, R), !.

%Rule Description: pay attention during residential streets
%Rule Description: Traffic calming measures 
generateActions(r153, B, I, R) :- member(trafficCalming,B), generateActions(r155, B, I, Y), append([should-maintained_reduced_speed, should-avoid_overtaking, should-allow_cyclists_moto_pass],Y,R), !.
generateActions(r153, B, I, R) :- generateActions(r155, B, I, R), !.

%Rule Description: Country road - pay attention/follow speed signs
%Rule Description: Singletrack roads
generateActions(r155, B, I, R) :- member(singleTrackRoad,B), (member(behindWantToOvertake,B); member(carTowardsYou,B)), generateActions(r155a, B, I, Y), append([should-pull_into_passing_place],Y,R), !.
generateActions(r155, B, I, R) :- generateActions(r155a, B, I, R), !.

generateActions(r155a, B, I, R) :- member(singleTrackRoad,B), member(carTowardsYou,B), member(goingDownhill,B), generateActions(r155b, B, I, Y), append([should-give_way_to_other],Y,R), !.
generateActions(r155a, B, I, R) :- generateActions(r155b, B, I, R), !.

generateActions(r155b, B, I, R) :- member(singleTrackRoad,B), member(noPassingPlaceInFront,B), generateActions(r155c, B, I, Y), append([should-reverse_to_passing_place],Y,R), !.
generateActions(r155b, B, I, R) :- generateActions(r155c, B, I, R), !.

generateActions(r155c, B, I, R) :- member(singleTrackRoad,B), member(nonMotorTraffic,B), generateActions(r156, B, I, Y), append([should-reduce_speed],Y,R), !.
generateActions(r155c, B, I, R) :- generateActions(r156, B, I, R), !.

%Rule Description: Do not park in passing place
generateActions(r156, B, I, R) :- member(park,I), generateActions(r159, B, I, Y), append([must-do_not_park_in_passing_place],Y,R), !.
generateActions(r156, B, I, R) :- generateActions(r159, B, I, R), !.

%Rule Description: minibikes should not be used
%Rule Description: quadbikes not to be used, must meet legal motor standard, restates not to drive on pavement
%Rule Description: Moving Off, use signal and look
generateActions(r159, B, I, R) :- member(setOff,I), member(indicatorOn, B), member(clearToManover, B), generateActions(r160, B, I, R), !.
generateActions(r159, B, I, R) :- member(setOff,I), generateActions(r160, B, I, Y), append([should-indicator_on, must-road_clear_to_manover],Y,R), !.
generateActions(r159, B, I, R) :- generateActions(r160, B, I, R), !.

%Rule Description: Once moving
generateActions(r160, B, I, R) :- member(driving, B), not(member(overtake,I); member(turnRight,I); member(passVehicles,I); member(roadSignKeepLeftOverride,B); member(roadMarkingKeepLeftOverride,B)), generateActions(r162, B, I, Y), append([should-keep_left],Y,R), !.
generateActions(r160, B, I, R) :- generateActions(r162, B, I, R), !.

%Rule Description: Use mirrors
%Rule Description: Before Overtaking
generateActions(r162, B, I, R) :- member(overtake,I), (\+member(roadAheadClear,B); member(overtaken,B)), generateActions(r163, B, I, Y), append([should-cancel_overtaking],Y,R), !.
generateActions(r162, B, I, R) :- generateActions(r163, B, I, R), !.

%Rule Description: Overtaking, undertaking 
generateActions(r163, B, I, R) :- member(overtake,I), generateActions(r163a, B, I, Y), append([should-space_for_vehicle, should-move_quickly_past, should-move_left],Y,R), !.
generateActions(r163, B, I, R) :- generateActions(r163a, B, I, R), !.

generateActions(r163a, B, I, R) :- member(undertaking,I), not(member(carInFrontTurningRight,B); (member(stayingInLane,B), member(congestedTraffic,B))), generateActions(r164, B, I, Y), append([should-cancel_undertaking],Y,R), !.
generateActions(r163a, B, I, R) :- generateActions(r164, B, I, R), !.

%Rule Description: Overtaking large vehicles
generateActions(r164, B, I, R) :- member(overtake,I), member(largeVehicleInFront,B), generateActions(r165, B, I, Y), append([should-drop_back],Y,R), !.
generateActions(r164, B, I, R) :- generateActions(r165, B, I, R), !.

%Rule Description: Must not overtake
generateActions(r165, B, I, R) :- member(overtake,I), (member(crossDoubleWhiteClosestSolid,I); member(areaWithSolidWhiteBorder,I); member(nearPedistrianCrossing,B); member(enterRestrictedLane,B); member(noOvertakingSign,B)), generateActions(r166, B, I, Y), append([must-cancel_overtaking],Y,R), !.
generateActions(r165, B, I, R) :- generateActions(r166, B, I, R), !.

%Rule Description: Should not overtake
generateActions(r166, B, I, R) :- member(overtake,I), (member(approachingCorner,B); member(approachingHumpBridge,B); member(approachingBrow,B)), generateActions(r167, B, I, Y), append([should-cancel_overtaking],Y,R), !.
generateActions(r166, B, I, R) :- generateActions(r167, B, I, R), !.

%Rule Description: Should not overtake (part 2)
generateActions(r167, B, I, R) :- member(overtake,I), (member(approachingJunction,B); member(roadNarrows,B); member(approachingSchoolCrossing,B); member(trafficQueuing,B); member(levelCrossing,B)), generateActions(r168, B, I, Y), append([should-cancel_overtaking],Y,R), !.
generateActions(r167, B, I, R) :- generateActions(r168, B, I, R), !.

%Rule Description: Being overtaken
generateActions(r168, B, I, R) :- member(overtaken,B), generateActions(r169, B, I, Y), append([should-prepare_drop_back],Y,R), !.
generateActions(r168, B, I, R) :- generateActions(r169, B, I, R), !.

%Rule Description: Holding up traffic
generateActions(r169, B, I, R) :- member(longQueueBehind,B), member(clearRoadAhead,B), generateActions(r170, B, I, Y), append([should-pull_over_safe_place, should-allow_traffic_to_pass],Y,R), !.
generateActions(r169, B, I, R) :- generateActions(r170, B, I, R), !.

%Rule Description: Extra care at junctions, also give way to pedestrians
generateActions(r170, B, I, R) :- member(pedestriansInRoad, B), generateActions(r171, B, I, Y), append([should-give_way_to_pedestrians],Y,R), !.
generateActions(r170, B, I, R) :- generateActions(r171, B, I, R), !.

%Rule Description: Stop at stop sign
generateActions(r171, B, I, R) :- member(stopSign, B), member(whiteLineAcrossRoad, B), generateActions(r172, B, I, Y), append([must-stop_at_white_line, should-wait_for_gap_before_moving_off],Y,R), !.
generateActions(r171, B, I, R) :- generateActions(r172, B, I, R), !.

%Rule Description: Give way at give way sign
generateActions(r172, B, I, R) :- member(giveWaySign, B), member(dottedWhiteLineAcrossRoad, B), generateActions(r173, B, I, Y), append([must-give_way_at_dotted_white_line],Y,R), !.
generateActions(r172, B, I, R) :- generateActions(r173, B, I, R), !.

%Rule Description:Crossing dual carriage way
generateActions(r173, B, I, R) :- member(crossDualCarriageWay, I), 
	(
	(member(vehicleFitsInCentralReservation,B), generateActions(r174, B, I, Y), append([should-use_central_reservation],Y,R));
	(member(vehicleDoesntFitsInCentralReservation,B), generateActions(r174, B, I, Y), append([must-dont_use_central_reservation],Y,R))
	), !. 
generateActions(r173, B, I, R) :- generateActions(r174, B, I, R), !.

%Rule Description: Box junctions
generateActions(r174, B, I, R) :- member(enterBoxJunction, I), \+member(exitClear,B), \+member(signalledRoundabout,B), generateActions(r174a, B, I, Y), append([must-wait_until_clear],Y,R), !.
generateActions(r174, B, I, R) :- generateActions(r174a, B, I, R), !.

generateActions(r174a, B, I, R) :- member(enterBoxJunction, I), \+member(routeClear,B), member(signalledRoundabout,B), generateActions(r175, B, I, Y), append([must-wait_until_route_clear],Y,R), !.
generateActions(r174a, B, I, R) :- generateActions(r175, B, I, R), !.

%Rule Description: Traffic Lights (Stop at red)
generateActions(r175, B, I, R) :- (member(approachingTrafficLight,I); member(atTrafficLight, B)), \+member(lightGreen, B), generateActions(r176, B, I, Y), append([must-stop_at_white_line],Y,R), !.
generateActions(r175, B, I, R) :- (member(approachingTrafficLight,I); member(atTrafficLight, B)), member(lightAmber, B), \+member(unableToStopByWhiteLine,B), generateActions(r176, B, I, Y), append([must-stop_at_white_line],Y,R), !.
generateActions(r175, B, I, R) :- generateActions(r176, B, I, R), !.

%Rule Description: Stay stopped at red
generateActions(r176, B, I, R) :- member(setOff,I), member(atTrafficLight, B), (\+member(lightGreen,B); \+member(exitClear,B)), generateActions(r177, B, I, Y), append([must-wait_until_route_clear],Y,R), !.
generateActions(r176, B, I, R) :- generateActions(r177, B, I, R), !.

%Rule Description: Filter Arrow
generateActions(r177, B, I, R) :- member(atTrafficLight, B), member(greenFilterLightForExit,B), generateActions(r178, B, I, Y), append([should-allowed_to_proceed],Y,R), !.
generateActions(r177, B, I, R) :- generateActions(r178, B, I, R), !.

%Rule Description: Advanced stop lines: TODO
generateActions(r178, B, I, R) :- member(atTrafficLight, B), member(hasAdvancedStop, B), member(lightGreen, B), \+member(safeToCross, B), generateActions(r179, B, I, Y), append([must-wait_at_advanced_stop],Y,R), !.
generateActions(r178, B, I, R) :- member(atTrafficLight, B), member(hasAdvancedStop, B), \+member(lightGreen, B), member(passedFirstWhiteLine, B), generateActions(r179, B, I, Y), append([must-wait_at_advanced_stop],Y,R), !.
generateActions(r178, B, I, R) :- member(atTrafficLight, B), member(hasAdvancedStop, B), \+member(lightGreen, B), \+member(passedFirstWhiteLine, B), generateActions(r179, B, I, Y), append([must-wait_at_first_white_line],Y,R), !.
generateActions(r178, B, I, R) :- generateActions(r179, B, I, R), !.

%Rule Description: Turning Right
generateActions(r179, B, I, R) :- member(turnRight,I), generateActions(r180, B, I, Y), append([should-use_right_indicator,should-position_right_turn,should-allow_undertaking],Y,R), !.
generateActions(r179, B, I, R) :- generateActions(r180, B, I, R), !.

%Rule Description: Turning right continued
generateActions(r180, B, I, R) :- member(turnRight,I), generateActions(r182, B, I, Y), append([should-wait_until_safe_gap,should-not_overtaken,must-avoid_cutting_corner],Y,R), !.
generateActions(r180, B, I, R) :- generateActions(r182, B, I, R), !.

%Rule Description: Techniques for turning right (not a rule)
%Rule Description: Turning Left
generateActions(r182, B, I, R) :- member(turnLeft,I), generateActions(r180, B, I, Y), append([should-use_left_indicator,must-avoid_overtaking],Y,R), !.
generateActions(r182, B, I, R) :- generateActions(r183, B, I, R), !.

%Rule Description: While turning
generateActions(r183, B, I, R) :- member(turning,B), generateActions(r184, B, I, Y), append([should-keep_left,should-give_way_other_roads],Y,R), !.
generateActions(r183, B, I, R) :- generateActions(r184, B, I, R), !.

%Rule Description: Approach Roundabout
generateActions(r184, B, I, R) :- member(approachingRoundabout, B), generateActions(r185, B, I, Y), append([should-adjust_speed, should-get_in_lane, should-give_signal],Y,R), !.
generateActions(r184, B, I, R) :- generateActions(r185, B, I, R), !.

%Rule Description: reaching roundabout
generateActions(r185, B, I, R) :- member(reachedRoundabout, B), generateActions(r186, B, I, Y), append([should-give_priority_to_right],Y,R), !.
generateActions(r185, B, I, R) :- generateActions(r186, B, I, R), !.

%Rule Description: Roundabout signals and positions
generateActions(r186, B, I, R) :- (
(member(firstExitRoundabout, I), generateActions(r188, B, I, Y), append([should-signal_left, should-approach_left_hand_lane],Y,R));
(member(rightExitRoundabout, I), generateActions(r188, B, I, Y), append([should-signal_right, should-approach_left_hand_lane,should-signal_left_on_exit],Y,R));
(member(otherRoundabout, I), generateActions(r188, B, I, Y), append([should-select_lane, should-stay_in_lane, should-signal_left_on_exit],Y,R))), !.
generateActions(r186, B, I, R) :- generateActions(r188, B, I, R), !.

%Rule Description: Pay attention at roundabout
%Rule Description: roundabouts-mini should be treated the same.
generateActions(r188, B, I, R) :- member(roundabouts-mini,B), generateActions(r191, B, I, Y), append([must-treat_as_roundabout, must-pass_around, should-avoid_uturn],Y,R), !.
generateActions(r188, B, I, R) :- generateActions(r191, B, I, R), !.

%Rule Description: double roundabouts - treat as normal
%Rule Description: multiple roundabout - treat as normal
%Rule Description: must not overtake or park at crossing
generateActions(r191, B, I, R) :- member(atCrossing, B), generateActions(r192, B, I, Y), append([must-avoid_parking, must-avoid_overtaking],Y,R), !.
generateActions(r191, B, I, R) :- generateActions(r192, B, I, R), !.

%Rule Description: keep crossing clear in queueing traffic
generateActions(r192, B, I, R) :- member(atCrossing, B), generateActions(r195, B, I, Y), append([should-keep_crossing_clear],Y,R), !.
generateActions(r192, B, I, R) :- generateActions(r195, B, I, R), !.

%Rule Description: Pay attention at crossing
%Rule Description: Don't rev at pedestrians crossing
%Rule Description: Zebra crossings
generateActions(r195, B, I, R) :- member(zebraCrossing, B), generateActions(r196, B, I, Y), append([must-must_stop_pedestrian_crossing, should-reduce_speed_if_pedestrians],Y,R), !.
generateActions(r195, B, I, R) :- generateActions(r196, B, I, R), !.

%Rule Description: PelicanCrossing
generateActions(r196, B, I, R) :- member(pelicanCrossing, B), (member(lightRed, B); (member(lightFlashingAmber, B), member(pedestriansInRoad,B))), generateActions(r198, B, I, Y), append([must-stop_at_crossing],Y,R), !.
generateActions(r196, B, I, R) :- generateActions(r198, B, I, R), !.

%Rule Description: Defines pelican crossing, how to recognise
%Rule Description: People crossing as light goes green
generateActions(r198, B, I, R) :- member(atCrossing, B), member(lightGreen,B), member(pedestriansInRoad, B), generateActions(r199, B, I, Y), append([should-give_way_to_pedestrians],Y,R), !.
generateActions(r198, B, I, R) :- generateActions(r199, B, I, R), !.

%Rule Description: Toucan, puffin, equestrian should be treated as traffic lights
generateActions(r199, B, I, R) :- (member(toucanCrossing, B); member(puffinCrossing, B); member(equestrianCrossing, B)), generateActions(r200, B, I, Y), append([should-treat_as_traffic_light],Y,R), !.
generateActions(r199, B, I, R) :- generateActions(r200, B, I, R), !.

%Rule Description: uTurn
generateActions(r200, B, I, R) :- member(uturn,I), generateActions(r201, B, I, Y), append([should-find_quiet_side_road],Y,R), !.
generateActions(r200, B, I, R) :- generateActions(r201, B, I, R), !.

%Rule Description: Do not reverse into main road, and reverse onto drive
generateActions(r201, B, I, R) :- member(sideroad,B), member(reversing,I), member(mainRoadNextRoad,B), generateActions(r201a, B, I, Y), append([must-cancel_reverse],Y,R), !.
generateActions(r201, B, I, R) :- generateActions(r201a, B, I, R), !.

generateActions(r201a, B, I, R) :- member(pullIntoDriveway,I), generateActions(r203, B, I, Y), append([should-reverse_into_drive],Y,R), !.
generateActions(r201a, B, I, R) :- generateActions(r203, B, I, R), !.

%Rule Description: pay attention while reversing
%Rule Description: Must not reverse more than necessary
generateActions(r203, B, I, R) :- member(reversing,I), generateActions(r206, B, I, Y), append([must-minimise_reversing],Y,R), !.
generateActions(r203, B, I, R) :- generateActions(r206, B, I, R), !.

%Rule Description: defines vulnerable road users
%Rule Description: pay attention to pedestrians, and how to treat rural roads with walkers
%Rule Description: when drive slowly
generateActions(r206, B, I, R) :- (member(crowdedShoppingStreet,B); member(homezone,B); member(quietlane,B); member(passParkedVehicles,I); member(reversing,B); member(roadWorks,B)), generateActions(r206a, B, I, Y), append([should-drive_slowly],Y,R), !.
generateActions(r206, B, I, R) :- generateActions(r206a, B, I, R), !.

generateActions(r206a, B, I, R) :- member(ruralRoad,B), member(pedestriansInRoad,B), generateActions(r208, B, I, Y), append([should-drive_slowly, should-prepare_to_stop],Y,R), !.
generateActions(r206a, B, I, R) :- generateActions(r208, B, I, R), !.

%Rule Description: extension of 204, more definitions of vulnerable people

%Rule Description: Near schools
generateActions(r208, B, I, R) :- member(nearSchool,B), \+member(flashingAmber,B), generateActions(r209, B, I, Y), append([should-drive_slowly],Y,R), !.
generateActions(r208, B, I, R) :- member(nearSchool,B), member(flashingAmber,B), generateActions(r209, B, I, Y), append([should-drive_very_slowly],Y,R), !.
generateActions(r208, B, I, R) :- generateActions(r209, B, I, R), !.

%Rule Description:Passing school bus
generateActions(r209, B, I, R) :- member(overtake,I), member(overtakingSchoolBus,B), generateActions(r210, B, I, Y), append([should-drive_slowly],Y,R), !.
generateActions(r209, B, I, R) :- generateActions(r210, B, I, R), !.

%Rule Description: Stop at stop sign held by school crossing patrol
generateActions(r210, B, I, R) :- member(stopForChildrenSign,B), generateActions(r212, B, I, Y), append([must-stop_at_crossing_patrol],Y,R), !.
generateActions(r210, B, I, R) :- generateActions(r212, B, I, R), !.

%Rule Description: Look out for motorcyclists
%Rule Description: Give room to motorcyclists.
generateActions(r212, B, I, R) :- member(overtaking,I), member(motorcyclistAhead,B), generateActions(r214, B, I, Y), append([should-give_room_when_passing],Y,R), !.
generateActions(r212, B, I, R) :- generateActions(r214, B, I, R), !.

%Rule Description: Pay attention to motor/cyclists
%Rule Description: Animals
generateActions(r214, B, I, R) :- member(animalInRoad,B), member(canPassAnimal,B), generateActions(r214a, B, I, Y), append([should-drive_slowly, should-avoid_horn, should-avoid_revs],Y,R), !.
generateActions(r214, B, I, R) :- generateActions(r214a, B, I, R), !.

generateActions(r214a, B, I, R) :- member(animalInRoad,B), \+member(canPassAnimal,B), generateActions(r218, B, I, Y), append([should-stop_and_turn_engine_off],Y,R), !.
generateActions(r214a, B, I, R) :- generateActions(r218, B, I, R), !.

%Rule Description: Horses/ horse drawn captured by 214
%Rule Description: Older drivers exist
%Rule Description: Be patient with learners
%Rule Description: Home zone/Quiet lanes
generateActions(r218, B, I, R) :- (member(homezone,B); member(quietlane,B)), generateActions(r219, B, I, Y), append([should-drive_slowly, should-prepare_to_stop],Y,R), !.
generateActions(r218, B, I, R) :- generateActions(r219, B, I, R), !.

%Rule Description: Emergency vehicles
generateActions(r219, B, I, R) :- member(emergencyVehicle, B), member(flashingSirens, B), generateActions(r221, B, I, Y), append([should-allow_emergency_vehicle_to_pass, should-avoid_harsh_braking],Y,R), !.
generateActions(r219, B, I, R) :- generateActions(r221, B, I, R), !.

%Rule Description: Power vehicles for disabled (8mph max) must have a flashing amber beacon on roads with a 50mph+ limit
%Rule Description: Large Vehicles
generateActions(r221, B, I, R) :- member(largeVehicle, B), generateActions(r222, B, I, Y), append([should-allow_extra_space, should-prepare_to_stop],Y,R), !.
generateActions(r221, B, I, R) :- generateActions(r222, B, I, R), !.

%Rule Description: Large Vehicles - can block view
generateActions(r222, B, I, R) :- member(largeVehicleInFront, B), generateActions(r222, B, I, Y), append([should-give_extra_seperation_distance],Y,R), !.
generateActions(r222, B, I, R) :- generateActions(r223, B, I, R), !.

%Rule Description: Buses, coaches, trams
generateActions(r223, B, I, R) :- member(publicTransport, B), generateActions(r225, B, I, Y), append([should-give_priority_to_public_transport],Y,R), !.
generateActions(r223, B, I, R) :- generateActions(r225, B, I, R), !.

%Rule Description: Be careful around electric vehicles (trams/milk floats)
%Rule Description: flashing amber (unless vehicle used before 1947, unlikely for a autonomous vehicle)
generateActions(r225, B, I, R) :- member(flashingAmberBeacon, B), generateActions(r225a, B, I, Y), append([should-approach_with_caution],Y,R), !.
generateActions(r225, B, I, R) :- generateActions(r225a, B, I, R), !.

generateActions(r225a, B, I, R) :- member(maxPossibleSpeed25orLess, B), member(onUnrestictedDualCarriageway, B), generateActions(r226, B, I, Y), append([must-flash_amber_beacon],Y,R), !.
generateActions(r225a, B, I, R) :- generateActions(r226, B, I, R), !.

%Rule Description: Headlights
generateActions(r226, B, I, R) :- member(visibilityReduced, B), generateActions(r227, B, I, Y), append([must-headlights_on, should-fog_lights_on],Y,R), !.
generateActions(r226, B, I, R) :- generateActions(r227, B, I, Y), append([must-fog_lights_off],Y,R), !.

%Rule Description: Wet weather
generateActions(r227, B, I, R) :- member(wetWeather, B), generateActions(r228, B, I, Y), append([should-increase_distance_to_car_infront],Y,R), !.
generateActions(r227, B, I, R) :- generateActions(r228, B, I, R), !.

%Rule Description: Icy/Snowy
generateActions(r228, B, I, R) :- member(icyWeather, B), \+member(essentialTravel, B), generateActions(r228, B, I, Y), append([must-do_not_drive],Y,R), !.
generateActions(r228, B, I, R) :- generateActions(r229, B, I, R), !.

%Rule Description: Icy/Snowy, setting off
generateActions(r229, B, I, R) :- member(icyWeather, B), member(settingOff, I), generateActions(r230, B, I, Y), append([must-clear_ice_snow_all_windows, must-light_and_number_plates_clean, should-mirrors_clear, should-remove_all_snow],Y,R), !.
generateActions(r229, B, I, R) :- generateActions(r230, B, I, R), !.

%Rule Description: Driving icy/snowy
generateActions(r230, B, I, R) :- member(icyWeather, B), member(driving, B), generateActions(r230a, B, I, Y), append([should-give_extensive_extra_seperation_distance],Y,R), !.
generateActions(r230, B, I, R) :- generateActions(r230a, B, I, R), !.

generateActions(r230a, B, I, R) :- member(icyWeather, B), member(overtakeSnowplow, I), \+member(laneCleared, B), generateActions(r231, B, I, Y), append([must-do_not_overtake],Y,R), !.
generateActions(r230a, B, I, R) :- generateActions(r231, B, I, R), !.

%Rule Description: Drive icy/snowy
generateActions(r231, B, I, R) :- member(icyWeather, B), generateActions(r233, B, I, Y), append([should-drive_very_slowly, should-drive_very_slowly_on_bends],Y,R), !.
generateActions(r231, B, I, R) :- generateActions(r233, B, I, R), !.

%Rule Description: Windy Weather - can blow off course
%Rule Description: Windy Weather - Keep well back from motocylists overtaking highsided vehicle
generateActions(r233, B, I, R) :- member(windy, B), member(motorcyclistInFront, B), member(overtakingHighSidedVehicle, B), generateActions(r234, B, I, Y), append([should-keep_well_back],Y,R), !.
generateActions(r233, B, I, R) :- generateActions(r234, B, I, R), !.

%Rule Description: Entering fog
generateActions(r234, B, I, R) :- member(approachingFog, B), generateActions(r235, B, I, Y), append([should-slow_down],Y,R), !.
generateActions(r234, B, I, R) :- generateActions(r235, B, I, R), !.

%Rule Description: In Fog
generateActions(r235, B, I, R) :- member(fog, B), generateActions(r236, B, I, Y), append([should-pull_up_in_visible_distance, must-headlights_on, should-use_windscreen_wipers, should-use_demisters, should-do_not_hestitate],Y,R), !.
generateActions(r235, B, I, R) :- generateActions(r236, B, I, R), !.

%Rule Description: Fog lights
generateActions(r236, B, I, R) :- \+member(visibilityReduced, B), generateActions(r237, B, I, Y), append([must-fog_lights_off],Y,R), !.
generateActions(r236, B, I, R) :- generateActions(r237, B, I, R), !.

%Rule Description: Hot weather
generateActions(r237, B, I, R) :- member(dazzled, B), generateActions(r238, B, I, Y), append([should-slow_down_and_stop],Y,R), !.
generateActions(r237, B, I, R) :- generateActions(r238, B, I, R), !.

%Rule Description: General waiting and parking
generateActions(r238, B, I, R) :- ((member(yellowLine,B), member(withinTimePlateTimes, B));(member(doubleYellowLine, B));(member(schoolEntranceMarkings,B))), generateActions(r239, B, I, Y), append([must-avoid_waiting, must-avoid_parking],Y,R), !.
generateActions(r238, B, I, R) :- generateActions(r239, B, I, R), !.

%Rule Description: Parking
generateActions(r239, B, I, R) :- member(park, I), \+member(dedicatedParkingArea,B), generateActions(r240, B, I, Y), append([must-avoid_parking_against_flow, should-park_as_close_to_side, must-engine_off, must-handbrake_on, should-lock],Y,R), !.
generateActions(r239, B, I, R) :- generateActions(r240, B, I, R), !.

%Rule Description: Parking continued
generateActions(r240, B, I, R) :- (member(park, I); member(stop, I)), 
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
	),generateActions(r241, B, I, Y), append([must-avoid_parking, must-avoid_stopping],Y,R), !.
generateActions(r240, B, I, R) :- generateActions(r241, B, I, R), !.

%Rule Description: Parking continued
generateActions(r241, B, I, R) :- member(park, I), member(parkingRestrictions, B), \+member(meetParkingRestrictions, B), generateActions(r242, B, I, Y), append([must-avoid_parking],Y,R), !.
generateActions(r241, B, I, R) :- generateActions(r242, B, I, R), !.

%Rule Description: Parking still continued
generateActions(r242, B, I, R) :- member(park, I), (member(dangerousToStop, B);member(unncessaryObstruction, B)), generateActions(r243, B, I, Y), append([must-avoid_parking],Y,R), !.
generateActions(r242, B, I, R) :- generateActions(r243, B, I, R), !.

%Rule Description: More parking
generateActions(r243, B, I, R) :- (member(stop, I); member(park, I)), \+member(stationaryTraffic, B), 
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
), generateActions(r244, B, I, Y), append([must-avoid_parking, must-avoid_stopping],Y,R), !.
generateActions(r243, B, I, R) :- generateActions(r244, B, I, R), !.

%Rule Description: Pavement parking
generateActions(r244, B, I, R) :- member(park, I), member(onPavement, B), member(london, B), generateActions(r247, B, I, Y), append([must-avoid_parking],Y,R), !.
generateActions(r244, B, I, R) :- member(park, I), member(onPavement, B), \+member(london, B), generateActions(r247, B, I, Y), append([should-avoid_parking],Y,R), !.
generateActions(r244, B, I, R) :- generateActions(r247, B, I, R), !.

%Rule Description: Parking zones, discribed
%Rule Description: Goods vehicle parking
%Rule Description: Loading and unloading
generateActions(r247, B, I, R) :- member(loadUn, I), 
(
	(member(yellowMarkingsOnKerb, B), member(signsAdviseRestrictions, B));
	(member(redRoute, B), \+member(markedBayForLoading, B))
), generateActions(r248, B, I, Y), append([must-avoid_loading_unloading],Y,R), !.
generateActions(r247, B, I, R) :- generateActions(r248, B, I, R), !.

%Rule Description: Parking at night
generateActions(r248, B, I, R) :- member(park, I), member(night, B), \+(parkingSpace, B), member(againstFlowOfTraffic, B), generateActions(r249, B, I, Y), append([must-avoid_parking],Y,R), !.
generateActions(r248, B, I, R) :- generateActions(r249, B, I, R), !.

%Rule Description: ParkingLights
generateActions(r249, B, I, R) :- member(parked, B), member(limitabove30mph, B), generateActions(r250, B, I, Y), append([must-parking_lights_on],Y,R), !.
generateActions(r249, B, I, R) :- generateActions(r250, B, I, R), !.

%Rule Description: ParkingLights regular vehicles
generateActions(r250, B, I, R) :- member(parked, B), \+member(limitabove30mph, B), \+member(parkingSpace), \+member(toJunction10meters, B), generateActions(r251, B, I, Y), append([must-parking_lights_on],Y,R), !.
generateActions(r250, B, I, R) :- generateActions(r251, B, I, R), !.

%Rule Description: Parking in fog
generateActions(r251, B, I, R) :- member(fog, B), member(parkedInRoad, B), generateActions(r252, B, I, Y), append([should-parking_lights_on],Y,R), !.
generateActions(r251, B, I, R) :- generateActions(r252, B, I, R), !.

%Rule Description: Parking on hills
generateActions(r252, B, I, R) :- member(park, I), member(hill, B), member(uphill, B), generateActions(r253, B, I, Y), append([should-close_to_kerb, should-wheel_away_from_kerb, should-handbrake_on],Y,R), !.
generateActions(r252, B, I, R) :- member(park, I), member(hill, B), member(downhill, B), generateActions(r253, B, I, Y), append([should-close_to_kerb, should-wheel_toward_from_kerb, should-handbrake_on],Y,R), !.
generateActions(r252, B, I, R) :- generateActions(r253, B, I, R), !.

%Rule Description: Prohibited Vehicles
generateActions(r253, B, I, R) :- member(enterMotorway, I), member(slowMovingVehicle,B), generateActions(r257, B, I, Y), append([must-avoid_motorway],Y,R), !.
generateActions(r253, B, I, R) :- generateActions(r257, B, I, R), !.

%Rule Description: Traffic faster so pay attention
%Rule Description: Read signs
%Rule Description: Signs exist
%Rule Description: Amber lights on sign
generateActions(r257, B, I, R) :- member(motorway, B), member(signFlashingAmber, B), generateActions(r258, B, I, Y), append([should-reduce_speed],Y,R), !.
generateActions(r257, B, I, R) :- generateActions(r258, B, I, R), !.

%Rule Description: Red flashing light%Rule Description: Red flashing light across all lanes
generateActions(r258, B, I, R) :- member(motorway, B), member(signFlashingRedX, B), member(laneAvailiable, B), generateActions(r259, B, I, Y), append([must-follow_sign, must-avoid_closed_lane],Y,R), !.
generateActions(r258, B, I, R) :- member(motorway, B), member(signFlashingRedX, B), \+member(laneAvailiable, B), generateActions(r259, B, I, Y), append([must-stop_at_sign, must-follow_police_direction],Y,R), !.
generateActions(r258, B, I, R) :- generateActions(r259, B, I, R), !.

%Rule Description: Joining the motorway
generateActions(r259, B, I, R) :- member(enterMotorway, I), generateActions(r260, B, I, Y), append([should-priority_to_motoway_traffic, should-match_speed_to_motorway, should-avoid_hard_shoulder, should-dont_cross_solid_white, should-stay_on_running_lane, should-keep_left_lane],Y,R), !.
generateActions(r259, B, I, R) :- generateActions(r260, B, I, R), !.

%Rule Description: On motorway
generateActions(r260, B, I, R) :- member(motorway, B), \+member(visibilityReduced, B), generateActions(r261, B, I, Y), append([should-steady_speed, should-safe_distance],Y,R), !.
generateActions(r260, B, I, R) :- generateActions(r261, B, I, R), !.

%Rule Description: keep to speed limit motorway
generateActions(r261, B, I, R) :- member(motorway, B), generateActions(r263, B, I, Y), append([must-keep_under_speed_limit],Y,R), !.
generateActions(r261, B, I, R) :- generateActions(r263, B, I, R), !.

%Rule Description: take breaks
%Rule Description: don't reverse etc
generateActions(r263, B, I, R) :- member(motorway, B), \+member(directedByPoliceOfficer, B), generateActions(r264, B, I, Y), append([must-avoid_drive_against_traffic_flow, must-avoid_crossing_central_reservation, must-avoid_reversing],Y,R), !.
generateActions(r263, B, I, R) :- generateActions(r264, B, I, R), !.

%Rule Description: Stay in leftMostLane
generateActions(r264, B, I, R) :- member(motorway, B), \+member(overtaking, I), \+member(hardshoulderUsed, B), generateActions(r266, B, I, Y), append([should-keep_left_lane],Y,R), !.
generateActions(r264, B, I, R) :- member(motorway, B), \+member(overtaking, I), member(hardshoulderUsed), generateActions(r266, B, I, Y), append([should-move_adjacent_lane],Y,R), !.
generateActions(r264, B, I, R) :- generateActions(r266, B, I, R), !.

%Rule Description: Vehicles banned from right hand lane (3+)
%Rule Description: Get into lane quickly
generateActions(r266, B, I, R) :- member(motorway, B), (member(approachingJunction,B); member(directionSigns,B)), generateActions(r267, B, I, Y), append([should-get_into_lane],Y,R), !.
generateActions(r266, B, I, R) :- generateActions(r267, B, I, R), !.

%Rule Description: Overtaking on the motorway
generateActions(r267, B, I, R) :- member(motorway, B), member(overtake, I), generateActions(r268, B, I, Y), append([should-overtake_on_right, should-lane_clear, should-signal],Y,R), !.
generateActions(r267, B, I, R) :- generateActions(r268, B, I, R), !.

%Rule Description: continued
generateActions(r268, B, I, R) :- member(motorway, B), member(overtake, I), generateActions(r269, B, I, Y), append([must-avoid_overtaking_on_left, must-avoid_weaving],Y,R), !.
generateActions(r268, B, I, R) :- generateActions(r269, B, I, R), !.

%Rule Description: Avoid hard shoulder
generateActions(r269, B, I, R) :- member(motorway, B), \+member(directedByPoliceOfficer, B), \+member(speedlimitForHardShoulder, B), generateActions(r270, B, I, Y), append([must-avoid_hard_shoulder],Y,R), !.
generateActions(r269, B, I, R) :- generateActions(r270, B, I, R), !.

%Rule Description: Avoid emergency area
generateActions(r270, B, I, R) :- member(motorway, B), generateActions(r271, B, I, Y), append([must-avoid_emergency_area],Y,R), !.
generateActions(r270, B, I, R) :- generateActions(r271, B, I, R), !.

%Rule Description: Must not stop 
generateActions(r271, B, I, R) :- member(motorway, B), \+member(directedByPoliceOfficer, B), \+member(signSayingStop, B), generateActions(r272, B, I, Y), append([must-avoid_stopping],Y,R), !.
generateActions(r271, B, I, R) :- generateActions(r272, B, I, R), !.

%Rule Description: Must not pick up people/ set down people
generateActions(r272, B, I, R) :- member(motorway, B), generateActions(r272, B, I, Y), append([must-avoid_pick_up_set_down],Y,R), !.
generateActions(r272, B, I, R) :- generateActions(r273, B, I, R), !.

%Rule Description: Leaving motorway
generateActions(r273, B, I, R) :- member(leaveMotorway, I), generateActions(r274, B, I, Y), append([should-move_to_left_hand_lane, should-signal_left_on_exit, should-reduce_speed_on_slip_road],Y,R), !.
generateActions(r273, B, I, R) :- generateActions(r274, B, I, R), !.

%Rule Description: Reduce speed on slipway
generateActions(r274, B, I, R) :- member(sliproad, B), generateActions(r276, B, I, Y), append([should-reduce_speed_on_slip_road],Y,R), !.
generateActions(r274, B, I, R) :- generateActions(r276, B, I, R), !.

%Rule Description: Breakdown
generateActions(r276, B, I, R) :- member(brokendown, B), \+member(motorway, B), generateActions(r277, B, I, Y), append([should-get_off_road, should-use_hazard_lights, should-keep_sidelights_on],Y,R), !.
generateActions(r276, B, I, R) :- generateActions(r277, B, I, R), !.

%Rule Description: Breakdown (motorway)
generateActions(r277, B, I, R) :- member(brokendown, B), member(motorway, B), generateActions(r278, B, I, Y), append([should-go_to_left_hand_land, should-use_hazard_lights, should-keep_sidelights_on, should-pull_into_hard_shoulder, pull_into_emergency_area],Y,R), !.
generateActions(r277, B, I, R) :- generateActions(r278, B, I, R), !.

%Rule Description: Rejoin
generateActions(r278, B, I, R) :- member(joinMotorway, I), member(hardshoulder,B), generateActions(r281, B, I, Y), append([should-buildup_speed_on_motorway],Y,R), !.
generateActions(r278, B, I, R) :- generateActions(r281, B, I, R), !.

%Rule Description: Disabled drivers
%Rule Description: Dont remove obstructions
%Rule Description: Emergency servies in road
generateActions(r281, B, I, R) :- member(emergencyVehicleFlashingLightsAndStopped, B), generateActions(r283, B, I, Y), append([should-reduce_speed, should-prepare_to_change_lane, must-follow_police_direction],Y,R), !.
generateActions(r281, B, I, R) :- generateActions(r283, B, I, R), !.

%Rule Description: Don't gawk at accidents
%Rule Description: In accident
generateActions(r283, B, I, R) :- member(inIncident,B), generateActions(r286, B, I, Y), append([should-safe_pull_over_and_stop, should-use_hazard_lights, should-switch_off_engine],Y,R), !.
generateActions(r283, B, I, R) :- generateActions(r286, B, I, R), !.

%Rule Description: Defines signs on vehicle (dangerous vehicles)
%Rule Description: Accident with dangerous vehicles (nothing specific to vehicles)
%Rule Description: In accident (causing damage)
generateActions(r286, B, I, R) :- member(inIncident,B), member(damagedOrInjury,B), generateActions(r288, B, I, Y), append([must-stop],Y,R), !.
generateActions(r286, B, I, R) :- generateActions(r288, B, I, R), !.

%Rule Description: Must produce insurance
%Rule Description: Road Works Ahead
generateActions(r288, B, I, R) :- member(roadWorksAhead,B), generateActions(r289, B, I, Y), append([must-dontExceedTempSpeedLimit, should-keep_safe_distance, should-get_into_lane, should-avoid_lane_switching, should-merge_in_turn, must-avoid_coned_off_area, should-allow_extra_space_for_works_vehicles],Y,R), !.
generateActions(r288, B, I, R) :- generateActions(r289, B, I, R), !.

%Rule Description: Take special care on motorways
generateActions(r289, B, I, R) :- (member(motorway, B);member(dualCarriageWay, B)), member(workVehicleSign, B), generateActions(r290, B, I, Y), append([must-obey_work_vehicle_sign],Y,R), !.
generateActions(r289, B, I, R) :- generateActions(r290, B, I, R), !.

%Rule Description: Contraflow in roadWorks
generateActions(r290, B, I, R) :- member(roadWorks, B), member(contraflow, B), generateActions(r291, B, I, Y), append([should-increase_distance_to_car_infront, should-reduce_speed],Y,R), !.
generateActions(r290, B, I, R) :- generateActions(r291, B, I, R), !.

%Rule Description: Level crossing
generateActions(r291, B, I, R) :- member(nearLevelCrossing, B), \+member(exitClear, B), generateActions(r291a, B, I, Y), append([must-avoid_crossing_level_crossing, must-avoid_stopping, must-avoid_parking],Y,R), !.
generateActions(r291, B, I, R) :- member(nearLevelCrossing, B), member(exitClear, B), generateActions(r291a, B, I, Y), append([must-avoid_stopping, must-avoid_parking],Y,R), !.
generateActions(r291, B, I, R) :- generateActions(r291a, B, I, R), !.

generateActions(r291a, B, I, R) :- member(levelCrossing, B), generateActions(r292, B, I, Y), append([must-avoid_stopping, must-avoid_parking],Y,R), !.
generateActions(r291a, B, I, R) :- generateActions(r292, B, I, R), !.

%Rule Description: Level crossing overhead electric lines
generateActions(r292, B, I, R) :- member(crossLevelCrossing, I), \+member(meetHeightRequirement, B), generateActions(r293, B, I, Y), append([must-avoid_level_crossing],Y,R), !.
generateActions(r292, B, I, R) :- generateActions(r293, B, I, R), !.

%Rule Description: Controlled Crossing
generateActions(r293, B, I, R) :- member(controlledCrossing, B), member(flashingRed, B), generateActions(r293a, B, I, Y), append([must-stop_at_white_line],Y,R), !.
generateActions(r293, B, I, R) :- member(controlledCrossing, B), member(amber, B), generateActions(r293a, B, I, Y), append([must-do_not_stop],Y,R), !.
generateActions(r293, B, I, R) :- generateActions(r293a, B, I, R), !.

generateActions(r293a, B, I, R) :- member(controlledCrossing, B), generateActions(r293b, B, I, Y), append([must-do_not_reverse],Y,R), !.
generateActions(r293a, B, I, R) :- generateActions(r293b, B, I, R), !.

generateActions(r293b, B, I, R) :- member(crossControlledCrossing, I), \+member(crossinglightsOff, B), \+member(barriersOpen, B), generateActions(r295, B, I, Y), append([must-avoid_crossing_level_crossing],Y,R), !.
generateActions(r293b, B, I, R) :- generateActions(r295, B, I, R), !.

%Rule Description: Railway telephones
%Rule Description: Crossings without lights
generateActions(r295, B, I, R) :- member(crossControlledCrossing, I), \+member(noCrossingLights, B), \+member(barriersOpen, B), generateActions(r296, B, I, Y), append([must-avoid_crossing_level_crossing],Y,R), !.
generateActions(r295, B, I, R) :- generateActions(r296, B, I, R), !.

%Rule Description: User gates/barriers
generateActions(r296, B, I, R) :- member(stopSignCrossing, B), (\+member(greenLight, B); member(redLight, B)), generateActions(r297, B, I, Y), append([must-avoid_crossing_crossing],Y,R), !.
generateActions(r296, B, I, R) :- generateActions(r297, B, I, R), !.

%Rule Description: As before but no lights
generateActions(r297, B, I, R) :- member(stopSignCrossing, B), member(noLights, B), \+member(crossingClear), generateActions(r298, B, I, Y), append([must-avoid_crossing_crossing],Y,R), !.
generateActions(r297, B, I, R) :- generateActions(r298, B, I, R), !.

%Rule Description: Open crossing
generateActions(r298, B, I, R) :- member(openCrossing, B), member(noLights, B), \+member(crossingClear), generateActions(r300, B, I, Y), append([must-avoid_crossing_crossing],Y,R), !.
generateActions(r298, B, I, R) :- generateActions(r300, B, I, R), !.

%Rule Description: If breakdown on crossing, escape.
%Rule Description: tramlines
generateActions(r300, B, I, R) :- member(enterTramReservedRoad, I), generateActions(r300a, B, I, Y), append([must-avoid_tram_reserved_road],Y,R), !.
generateActions(r300, B, I, R) :- generateActions(r300a, B, I, R), !.

generateActions(r300a, B, I, R) :- member(tramlines, B), generateActions(r301, B, I, Y), append([should-avoid_driving_on_rails],Y,R), !.
generateActions(r300a, B, I, R) :- generateActions(r301, B, I, R), !.

%Rule Description: Faced with tram
generateActions(r301, B, I, R) :- member(tram, B), \+member(tramPassingLane, B), generateActions(r302, B, I, Y), append([should-give_way_to_tram, should-avoid_overtaking, must-avoid_overtaking_on_left],Y,R), !.
generateActions(r301, B, I, R) :- member(tram, B), member(tramPassingLane, B), generateActions(r302, B, I, Y), append([should-give_way_to_tram, should-use_tram_passing_lane, must-avoid_overtaking_on_left],Y,R), !.
generateActions(r301, B, I, R) :- generateActions(r302, B, I, R), !.

%Rule Description: Park on tramlines
generateActions(r302, B, I, R) :- member(stop, I), member(tramlines, B), generateActions(r303, B, I, Y), append([must-avoid_parking],Y,R), !.
generateActions(r302, B, I, R) :- generateActions(r303, B, I, R), !.

%Rule Description: at tram stop
generateActions(r303, B, I, R) :- member(tramStop, B), generateActions(r305, B, I, Y), append([must-follow_signs, must-avoid_overtaking, must-avoid_overtaking_on_left],Y,R), !.
generateActions(r303, B, I, R) :- generateActions(r305, B, I, R), !.

%Rule Description: Look for pedestrians
%Rule Description: Give way to trams
generateActions(r305, B, I, R) :- member(tram, B), generateActions(r307, B, I, Y), append([should-give_way_to_tram],Y,R), !.
generateActions(r305, B, I, R) :- generateActions(r307, B, I, R), !.

%Rule Description: driving on tram tracks
%Rule Description: overhead electric lines
generateActions(r307, B, I, R) :- member(tramlines, B), \+member(meetHeightRequirement, B), generateActions(end, B, I, Y), append([should-find_other_route],Y,R), !.
generateActions(r307, B, I, R) :- generateActions(end, B, I, R), !.

%Emergency
%Rule Description: Emergency Breaking
generateActions(r118, B, I, R) :- member(brake, I), generateActions(r120, B, I, Y), append([should-brake_hard],Y,R), !.
generateActions(r118, B, I, R) :- generateActions(r120, B, I, R), !.

%Rule Description: ABS - rule is same
generateActions(r120, B, I, R) :- member(brake, I), generateActions(r275, B, I, Y), append([should-brake_hard],Y,R), !.
generateActions(r120, B, I, R) :- generateActions(r275, B, I, R), !.

%Rule Description: Stop in emergency
generateActions(r275, B, I, R) :- generateActions(end, B, I, Y), append([should-find_safe_place_to_stop],Y,R), !.

generateActions(end, _, _, []).

%Get suggested actions for any violations
getActions(standard, Beliefs, Intentions, Results) :- generateActions(r89, Beliefs, Intentions, Actions), sort(Actions, Results).
getActions(emergency, Beliefs, Intentions, Results) :- generateActions(r118, Beliefs, Intentions, Actions), sort(Actions, Results).