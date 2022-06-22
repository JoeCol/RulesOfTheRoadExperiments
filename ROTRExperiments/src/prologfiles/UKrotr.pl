%rule number, belief, intentions, returns (actions/intentions)

%Rule Description: Vehicle Condition must be ok
rule(r89, standard, [vehicleUnsafe], [], [must-next_safe_stop]).

%Rule Description: fit to drive
%Rule Description: avoiding tiredness
%Rule Description: Vision
rule(r92, standard, [cantReadNumberPlate], [], [must-next_safe_stop]).

%Rule Description: Dazzled
rule(r93, standard, [dazzled], [], [should-slowdown]).


%Rule Description: Do not use tinted glasses
%Rule Description: Do not drink and drive
%Rule Description: Do not drug and drive
%Rule Description: Before setting off
rule(r97, standard, [routeNotPlanned, fuelForJourney], [settingOff], [should-prepare_route]).

%Rule Description: Towing
rule(r98a, standard, [loadNotSecured], [towing], [must-prepare_load]).
rule(r98b, standard, [loadStickingOut], [towing], [must-prepare_load]).
rule(r98c, standard, [loadNotBalanced], [towing], [must-prepare_load]).

%Rule Description: Seatbelts
rule(r99a, standard, [passengerWithoutSeatBelt], [], [must-put_on_seatbelts]).
rule(r99b, standard, [childWithoutChildSeat], [], [must-put_on_seatbelts]).

%Rule Description: Booster Seats
rule(r100, standard, [boosterSeatsRequired, boosterSeatsNotfittedCorrectly], [], [must-fit_booster_seat]).

%Rule Description: Rear facing baby seats
rule(r101, standard, [rearfacingbabyseatinfrontpassengerseat, activefrontalairbaginfrontpassengerseat], [], [must-turn_off_frontal_airbag_or_move_rear_facing_baby_seat]).

%Rule Description: Children in cars
rule(r102, standard, [childPassengers, childlocksNotEngaged], [], [should-engage_child_locks]).

%Rule Description: Signals (turn off if wrong)
rule(r103a, standard, [indicatorOn, finishedManoeuvre], [], [should-cancel_signals]).
rule(r103b, standard, [indicatorOn, misleadingSignal], [], [should-cancel_signals]).
rule(r103c, standard, [indicatorOff, changeCourseOrDirection, signalWouldNotMislead], [], [should-use_signals]).

%Rule Description: Other people won't use signals correctly
%Rule Description: Must obey authorised persons signals
rule(r105, standard, [seenSignalByAuthorisedPerson], [], [must-obey_signal]).

%Rule Description: Police Stopping - attention active, blues, flashing, horn etc
rule(r106, standard, [policeAttentionActive, policeDirectingLeft], [], [must-safe_pull_over_and_stop]).


%Rule Description: Driver and Vehicle
rule(r107a, standard, [dvsaAttentionActive, dvsafollowRequest], [], [must-follow_dvsa_until_stopped]).
rule(r107b, standard, [dvsaAttentionActive, dvsapullOverSignal], [], [must-safe_pull_over_and_stop]).

%Rule Description: Traffic officers
rule(r108, standard, [toAttentionActive, toDirectingLeft], [], [must-safe_pull_over_and_stop]).

%Rule Description: Traffic Signs
rule(r109, standard, [seenSign, signNoConflictsWithAuthorisedPersons], [], [must-follow_sign]).

%Rule Description: Flashing headlights
rule(r110, standard, [informOtherRoadUser], [flashHeadlight], [must-remove_flash_intention]).

%Rule Description: Do not assume flashing headlights
%Rule Description: When to use horn
rule(r112, standard, [nodanger, stationary], [soundHorn], [must-remove_horn_intention]).

%Rule Description: Lights including sidelights
rule(r113a, standard, [sidelightsOff, betweenSunriseSunset], [], [must-turn_sidelights_on]).
rule(r113b, standard, [headlightsOff, visibilityReduced], [], [must-turn_sidelights_on]).
rule(r113c, standard, [headlightsOff, night, litStreetLightingRoad], [], [must-turn_sidelights_on]).

%Rule Description: Lights continued 
rule(r114a, standard, [fogLightsOn, visibilityFine], [], [must-turn_foglights_off]).
rule(r114b, standard, [lightsCausingDiscomfortToOthers], [], [must-reduce_lighting]).

%Rule Description: Using dipped lights, third point is used in rule 93
rule(r115a, standard, [headlightsFullBeamOn, night, builtuparea], [], [should-set_headlights_to_dipped]).
rule(r115b, standard, [headlightsFullBeamOn, night, betweenSunriseSunset], [], [should-set_headlights_to_dipped]).
rule(r115c, standard, [headlightsFullBeamOn, night, overtaking], [], [should-set_headlights_to_dipped]).
rule(r115d, standard, [headlightsFullBeamOn, dullWeather], [], [should-set_headlights_to_dipped]).

%Rule Description: Hazard lights
rule(r116a, standard, [notTempObstructingTraffic], [setHazardsOn], [should-set_hazards_off]).
rule(r116b, standard, [moving], [setHazardsOn], [should-set_hazards_off]).
rule(r116c, standard, [onMotorway, noHazardAhead], [setHazardsOn], [should-set_hazards_off]).

%Rule Description: Standard Breaking
rule(r117, standard, [], [brake], [should-brake_early_lightly]).

%Rule Description: Skids
rule(r119, standard, [skidding], [], [should-turn_into_skid, should-release_brake, should-ease_off]).

%Rule Description: Dry brakes after water
rule(r121, standard, [drivenThroughDeepPuddle], [], [should-dry_brakes]).

%Rule Description: Coasting
rule(r122, standard, [gearNeutral, driving], [], [should-avoid_coasting]).

%Rule Description: Must not leave vehicle parked and running
rule(r123, standard, [pulledOver, notDiagnosingFaults], [], [should-switch_off_engine,  should-engage_parking_break]).%TODO: Hand check

%Rule Description: Speeding
rule(r124, standard, [exceedingSpeedLimit], [], [must-reduce_speed]).

%Rule Description: Speed to conditions
rule(r125a, standard, [roadPresentsHazards], [], [should-reduce_overall_speed]).
rule(r125b, standard, [sharingRoadWithOthers], [], [should-reduce_overall_speed]).
rule(r125c, standard, [adverseWeather], [], [should-reduce_overall_speed]).
rule(r125d, standard, [night], [], [should-reduce_overall_speed]).

%Rule Description: Stopping distances (time gaps given to help calculate)
rule(r126, standard, [cantStopBeforeCarInFrontStops], [], [should-increase_distance_to_car_infront]).

%Rule Description: Broken white line
rule(r127a, standard, [centerLine], [], [should-stopCrossingHazardWarningLine]).
rule(r127b, standard, [centerLine, roadNotClear], [turningOff], [should-stopCrossingHazardWarningLine]).
rule(r127c, standard, [centerLine, roadNotClear], [overtake], [should-stopCrossingHazardWarningLine]).

%Rule Description: Double white, closest broken
rule(r128a, standard, [doubleWhiteClosestBroken, cantOvertakeBeforeBrokenSolidifies], [overtake], [should-cancelOvertake]).
rule(r128b, standard, [overtaking, whiteOvertakeArrows], [], [should-returnToLane]).

%Rule Description: Double white, closest solid
rule(r129a, standard, [crossDoubleWhiteClosestSolid, roadNotClear], [turnOff], [must-not_cross_white_line]).
rule(r129b, standard, [crossDoubleWhiteClosestSolid, roadNotClear], [overtake], [must-not_cross_white_line]).
rule(r129c, standard, [crossDoubleWhiteClosestSolid, noObstruction], [], [must-not_cross_white_line]).
rule(r129d, standard, [crossDoubleWhiteClosestSolid, notBehindSlowMovingVehicle], [turnOff], [must-not_cross_white_line]).

%Rule Description: Chevrons (two types)
rule(r130a, standard, [whiteChevonsSolidBorder], [], [must-not_enter_whitechevonssolid_border]).
rule(r130b, standard, [whiteChevonsBrokenBorder, routeCanAvoidChevons], [], [should-avoid_entering_chevons]).

%Rule Description: lane dividers
rule(r131, standard, [laneDividers, straddingLanes], [], [should-goBetweenLaneDividers]).

%Rule Description: Defines what refective road studs are, not really a rule
%Rule Description: Changing lane
rule(r133a, standard, [indicatorOff], [changeLane], [should-indicatorOn]).
rule(r133b, standard, [nextLaneOccupided], [changeLane], [should-nextLaneClear]).

%Rule Description: Merging in turn in congested traffic, and avoid lane changes in congested traffic
rule(r134a, standard, [trafficCongested, numLanesReducing, trafficSlow], [], [should-mergeInTurn]).
rule(r134b, standard, [trafficCongested], [changeLane], [should-avoidLaneChanges]).

%Rule Description: Single Carriageway - 3 lanes
rule(r135, standard, [middleLane, singleCarriageWay, lanes3, notOvertaking, notTurningRight], [], [should-use_middle_only_overtaking_turning_right]).
rule(r135, standard, [singleCarriageWay], [], [must-avoidRightHandLane]).

%Rule Description: Single Carriageway - 4+ lanes
rule(r136, standard, [singleCarriageWay, lanes4plus], [], [should-followLaneSigns]).

%Rule Description: Dual Carriageway - 2 lane
rule(r137, standard, [rightHandLane, dualCarriageWay, lanes2, notOvertaking, notTurningRight], [], [should-go_to_left_hand_land]).

%Rule Description: Dual Carriageway 3 lane
rule(r138, standard, [notInLeftMostLane, dualCarriageWay, lanes3, overtake], [], [should-go_to_left_hand_land]).

%Rule Description: Climbing/Crawler Lanes
rule(r139a, standard, [crawlerLaneExists, amSlowMovingVehicle], [], [should-use_crawler_lane]).
rule(r139b, standard, [crawlerLaneExists, vehiclesWishToOvertake], [], [should-use_crawler_lane]).

%Rule Description: Cycle lanes, do not park/use
rule(r140, standard, [cycleLaneAvoidable], [beInCycleLane], [must-use_road,  must-avoid_parking]).

%Rule Description: Bus Lanes
rule(r141, standard, [busLane, busLaneInOperation], [], [should-avoid_bus_lane]).

%Rule Description: Other Lane Types
rule(r142a, standard, [hovLane, doNotMeetHOVRequirement], [], [must-avoid_hov_lane]).
rule(r142b, standard, [laneRestricted], [], [must-avoid_lane_lane]).

%Rule Description: One way street
rule(r143, standard, [carriageway], [selectLane], [must-travel_sign_direction,  should-use_left]).

%Rule Description: drive without care and attention etc
rule(r144, standard, [], [], [must-not_drive_dangerously,  must-drive_care_attention,  must-consideration_others]).

%Rule Description: Drive on pavement
rule(r145a, standard, [pavement, notAccessProperty], [], [must-road_surfaces-avoid_non]).
rule(r145b, standard, [footpath, notAccessProperty], [], [must-road_surfaces-avoid_non]).
rule(r145c, standard, [bridleway, notAccessProperty], [], [must-road_surfaces-avoid_non]).

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
rule(r155a, standard, [singleTrackRoad, behindWantToOvertake], [], [should-pull_into_passing_place]).
rule(r155b, standard, [singleTrackRoad, carTowardsYou], [], [should-pull_into_passing_place]).
rule(r155c, standard, [singleTrackRoad, carTowardsYou, goingDownhill], [], [should-give_way_to_other]).
rule(r155d, standard, [singleTrackRoad, noPassingPlaceInFront], [], [should-reverse_to_passing_place]).
rule(r155e, standard, [singleTrackRoad, nonMotorTraffic], [], [should-reduce_speed]).

%Rule Description: Do not park in passing place
rule(r156, standard, [], [park], [must-do_not_park_in_passing_place]).

%Rule Description: minibikes should not be used
%Rule Description: quadbikes not to be used, must meet legal motor standard, restates not to drive on pavement
%Rule Description: Moving Off, use signal and look
rule(r159a, standard, [notClearToManover], [setOff], [must-road_clear_to_manover]).
rule(r159b, standard, [indicatorOff], [setOff], [should-indicator_on]).

%Rule Description: Once moving
rule(r160a, standard, [driving, notOvertaking], [], [should-keep_left]).
rule(r160b, standard, [driving, notTurningRight], [], [should-keep_left]).
rule(r160c, standard, [driving, notPassingVehicles], [], [should-keep_left]).
rule(r160d, standard, [driving, roadSignKeepLeftOverride], [], [should-keep_left]).
rule(r160e, standard, [driving, roadMarkingKeepLeftOverride], [], [should-keep_left]).

%Rule Description: Use mirrors
%Rule Description: Before Overtaking
rule(r162a, standard, [roadAheadNotClear], [overtake], [should-cancel_overtaking]).
rule(r162b, standard, [overtaken], [overtake], [should-cancel_overtaking]).

%Rule Description: Overtaking, undertaking 
rule(r163a, standard, [], [overtake], [should-space_for_vehicle,  should-move_quickly_past,  should-move_left]).
rule(r163b, standard, [carInFrontNotTurningRight, stayingInLane, congestedTraffic], [undertaking], [should-cancel_undertaking]).
rule(r163c, standard, [notStayingInLane], [undertaking], [should-cancel_undertaking]).
rule(r163d, standard, [clearTraffic], [undertaking], [should-cancel_undertaking]).

%Rule Description: Overtaking large vehicles
rule(r164, standard, [largeVehicleInFront], [overtake], [should-drop_back]).

%Rule Description: Must not overtake
rule(r165a, standard, [noOvertakingSign], [overtake], [must-cancel_overtaking]).
rule(r165b, standard, [enterRestrictedLane], [overtake], [must-cancel_overtaking]).
rule(r165c, standard, [nearPedistrianCrossing], [overtake], [must-cancel_overtaking]).
rule(r165d, standard, [], [overtake, crossDoubleWhiteClosestSolid], [must-cancel_overtaking]).
rule(r165e, standard, [], [overtake, enterAreaWithSolidWhiteBorder], [must-cancel_overtaking]).

%Rule Description: Should not overtake
rule(r166a, standard, [approachingCorner], [overtake], [should-cancel_overtaking]).
rule(r166b, standard, [approachingHumpBridge], [overtake], [should-cancel_overtaking]).
rule(r166c, standard, [approachingCorner, approachingHumpBridge, approachingBrow], [overtake], [should-cancel_overtaking]).

%Rule Description: Should not overtake (part 2)
rule(r167a, standard, [approachingJunction], [overtake], [should-cancel_overtaking]).
rule(r167b, standard, [roadNarrows], [overtake], [should-cancel_overtaking]).
rule(r167c, standard, [approachingSchoolCrossing], [overtake], [should-cancel_overtaking]).
rule(r167d, standard, [trafficQueuing], [overtake], [should-cancel_overtaking]).
rule(r167e, standard, [levelCrossing], [overtake], [should-cancel_overtaking]).

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
rule(r173a, standard, [vehicleFitsInCentralReservation], [crossDualCarriageWay], [should-use_central_reservation]).
rule(r173b, standard, [vehicleDoesntFitsInCentralReservation], [crossDualCarriageWay], [must-dont_use_central_reservation]).

%Rule Description: Box junctions
rule(r174a, standard, [exitNotClear, notSignalledRoundabout], [enterBoxJunction], [must-wait_until_clear]).
rule(r174b, standard, [routeNotClear, signalledRoundabout], [enterBoxJunction], [must-wait_until_route_clear]).

%Rule Description: Traffic Lights (Stop at red)
rule(r175a, standard, [lightRed], [approachingTrafficLight], [must-stop_at_white_line]).
rule(r175b, standard, [lightAmber, ableToStopByWhiteLine], [approachingTrafficLight], [must-stop_at_white_line]).

%Rule Description: Stay stopped at red
rule(r176, standard, [atTrafficLight, lightNotGreen], [setOff], [must-wait_at_white_line]).
rule(r176, standard, [atTrafficLight, exitNotClear], [setOff], [must-wait_at_white_line]).

%Rule Description: Filter Arrow
rule(r177, standard, [atTrafficLight, greenFilterLightForExit], [], [should-allowed_to_proceed]).

%Rule Description: Advanced stop lines: TODO
rule(r178a, standard, [atTrafficLight, hasAdvancedStop, lightGreen, notSafeToCross], [], [must-wait_at_advanced_stop]).
rule(r178b, standard, [atTrafficLight, hasAdvancedStop, lightNotGreen, passedFirstWhiteLine], [], [must-wait_at_advanced_stop]).
rule(r178c, standard, [atTrafficLight, hasAdvancedStop, lightNotGreen, notPassedFirstWhiteLine], [], [must-wait_at_first_white_line]).

%Rule Description: Turning Right
rule(r179, standard, [], [turnRight], [should-use_right_indicator, should-position_right_turn, should-allow_undertaking]).

%Rule Description: Turning right continued
rule(r180, standard, [], [turnRight], [should-wait_until_safe_gap, should-not_overtaken, must-avoid_cutting_corner]).

%Rule Description: Techniques for turning right (not a rule)
%Rule Description: Turning Left
rule(r182, standard, [], [turnLeft], [should-use_left_indicator, must-avoid_overtaking]).

%Rule Description: While turning
rule(r183, standard, [turning], [], [should-keep_left, should-give_way_other_roads]).

%Rule Description: Approach Roundabout
rule(r184, standard, [], [approachingRoundabout], [should-adjust_speed,  should-get_in_lane,  should-give_signal]).

%Rule Description: reaching roundabout
rule(r185, standard, [reachedRoundabout], [], [should-give_priority_to_right]).

%Rule Description: Roundabout signals and positions
rule(r186a, standard, [], [firstExitRoundabout], [should-signal_left, should-approach_left_hand_lane]).
rule(r186b, standard, [], [rightExitRoundabout], [should-signal_right, should-approach_left_hand_lane,should-signal_left_on_exit]).
rule(r186c, standard, [], [otherExitRoundabout], [should-select_lane, should-stay_in_lane, should-signal_left_on_exit]).

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
rule(r199a, standard, [toucanCrossing], [], [should-treat_as_traffic_light]).
rule(r199b, standard, [puffinCrossing], [], [should-treat_as_traffic_light]).
rule(r199c, standard, [equestrianCrossing], [], [should-treat_as_traffic_light]).

%Rule Description: uTurn
rule(r200, standard, [], [uturn], [should-find_quiet_side_road]).

%Rule Description: Do not reverse into main road, and reverse onto drive
rule(r201a, standard, [sideroad, mainRoadNextRoad], [reversing], [must-cancel_reverse]).
rule(r201b, standard, [], [pullIntoDriveway], [should-reverse_into_drive]).

%Rule Description: pay attention while reversing
%Rule Description: Must not reverse more than necessary
rule(r203, standard, [], [reversing], [must-minimise_reversing]).

%Rule Description: defines vulnerable road users
%Rule Description: pay attention to pedestrians, and how to treat rural roads with walkers
%Rule Description: when drive slowly
rule(r206a, standard, [crowdedShoppingStreet], [], [should-drive_slowly]).
rule(r206b, standard, [homezone], [], [should-drive_slowly]).
rule(r206c, standard, [quietlane], [], [should-drive_slowly]).
rule(r206d, standard, [passParkedVehicles], [], [should-drive_slowly]).
rule(r206e, standard, [reversing], [], [should-drive_slowly]).
rule(r206f, standard, [roadWorks], [], [should-drive_slowly]).
rule(r206g, standard, [ruralRoad, pedestriansInRoad], [], [should-drive_slowly,  should-prepare_to_stop]).

%Rule Description: extension of 204, more definitions of vulnerable people
%Rule Description: Near schools
rule(r208, standard, [nearSchool, flashingAmber], [], [should-drive_slowly]).%TODO: Hand check
rule(r208, standard, [nearSchool, flashingAmber], [], [should-drive_very_slowly]).

%Rule Description:Passing school bus
rule(r209, standard, [overtakingSchoolBus], [overtake], [should-drive_slowly]).

%Rule Description: Stop at stop sign held by school crossing patrol
rule(r210, standard, [stopForChildrenSign], [], [must-stop_at_crossing_patrol]).

%Rule Description: Look out for motorcyclists
%Rule Description: Give room to motorcyclists.
rule(r212, standard, [motorcyclistAhead], [overtake], [should-give_room_when_passing]).

%Rule Description: Pay attention to motor/cyclists
%Rule Description: Animals
rule(r214a, standard, [animalInRoad, canPassAnimal], [], [should-drive_slowly,  should-avoid_horn,  should-avoid_revs]).
rule(r214b, standard, [animalInRoad, cantPassAnimal], [], [should-stop_and_turn_engine_off]).

%Rule Description: Horses/ horse drawn captured by 214
%Rule Description: Older drivers exist
%Rule Description: Be patient with learners
%Rule Description: Home zone/Quiet lanes
rule(r218a, standard, [homezone], [], [should-drive_slowly,  should-prepare_to_stop]).
rule(r218b, standard, [quietlane], [], [should-drive_slowly,  should-prepare_to_stop]).

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
rule(r225a, standard, [flashingAmberBeacon], [], [should-approach_with_caution]).
rule(r225b, standard, [maxPossibleSpeed25orLess, onUnrestictedDualCarriageway], [], [must-flash_amber_beacon]).

%Rule Description: Headlights
rule(r226a, standard, [visibilitySeriouslyReduced], [], [must-headlights_on,  should-fog_lights_on]).
rule(r226b, standard, [visibilityClear], [], [must-fog_lights_off]).

%Rule Description: Wet weather
rule(r227, standard, [wetWeather], [], [should-increase_distance_to_car_infront]).

%Rule Description: Icy/Snowy
rule(r228, standard, [icyWeather, notEssentialTravel], [], [must-do_not_drive]).

%Rule Description: Icy/Snowy, setting off
rule(r229, standard, [icyWeather], [setOff], [must-clear_ice_snow_all_windows,  must-light_and_number_plates_clean,  should-mirrors_clear,  should-remove_all_snow]).

%Rule Description: Driving icy/snowy
rule(r230a, standard, [icyWeather, driving], [], [should-give_extensive_extra_seperation_distance]).
rule(r230b, standard, [icyWeather, laneNotCleared], [overtakeSnowplow], [must-do_not_overtake]).

%Rule Description: Drive icy/snowy
rule(r231, standard, [icyWeather], [], [should-drive_very_slowly,  should-drive_very_slowly_on_bends]).

%Rule Description: Windy Weather - can blow off course
%Rule Description: Windy Weather - Keep well back from motocylists overtaking highsided vehicle
rule(r233, standard, [windy, motorcyclistInFront, bikeOvertakingHighSidedVehicle], [], [should-keep_well_back]).

%Rule Description: Entering fog
rule(r234, standard, [approachingFog], [], [should-slow_down]).

%Rule Description: In Fog
rule(r235, standard, [fog], [], [should-pull_up_in_visible_distance,  must-headlights_on,  should-use_windscreen_wipers,  should-use_demisters,  should-do_not_hestitate, should-fog_lights_on]).

%Rule Description: Fog lights
rule(r236, standard, [visibilityClear], [], [must-fog_lights_off]).

%Rule Description: Hot weather
rule(r237, standard, [dazzled], [], [should-slow_down_and_stop]).

%Rule Description: General waiting and parking
rule(r238a, standard, [yellowLine, withinTimePlateTimes], [], [must-avoid_waiting,  must-avoid_parking]).
rule(r238b, standard, [doubleYellowLine], [], [must-avoid_waiting,  must-avoid_parking]).
rule(r238c, standard, [schoolEntranceMarkings], [], [must-avoid_waiting,  must-avoid_parking]).

%Rule Description: Parking
rule(r239, standard, [notDedicatedParkingArea], [park], [must-avoid_parking_against_flow,  should-park_as_close_to_side,  must-engine_off,  must-handbrake_on,  should-lock]).

%Rule Description: Parking continued
rule(r240a, standard, [emergencyArea], [park], [must-avoid_parking]).%TODO: Hand check
rule(r240b, standard, [pedestrianCrossing], [park], [must-avoid_parking]).
rule(r240c, standard, [clearway], [park], [must-avoid_parking]).
rule(r240d, standard, [taxibay], [park], [must-avoid_parking]).
rule(r240e, standard, [urbanClearway, withinUrbanClearwayHours, notDroppingOff], [park], [must-avoid_parking]).
rule(r240f, standard, [doubleWhiteLines, notDroppingOff, loadingGoods], [park], [must-avoid_parking]).
rule(r240g, standard, [tramlines], [park], [must-avoid_parking]).
rule(r240h, standard, [cyclelane, withinCyclelaneOpteration], [park], [must-avoid_parking]).
rule(r240i, standard, [redlines, parkingNotAllowedBySigns], [park], [must-avoid_parking]).
rule(r240j, standard, [prohibitedToStopPark], [park], [must-avoid_parking]).

rule(r240k, standard, [emergencyArea], [stop], [must-avoid_stopping]).
rule(r240l, standard, [pedestrianCrossing], [stop], [must-avoid_stopping]).
rule(r240m, standard, [clearway], [stop], [must-avoid_stopping]).
rule(r240n, standard, [taxibay], [stop], [must-avoid_stopping]).
rule(r240o, standard, [urbanClearway, withinUrbanClearwayHours, notDroppingOff], [stop], [must-avoid_stopping]).
rule(r240p, standard, [doubleWhiteLines, notDroppingOff, loadingGoods], [stop], [must-avoid_stopping]).
rule(r240q, standard, [tramlines], [stop], [must-avoid_stopping]).
rule(r240r, standard, [cyclelane, withinCyclelaneOpteration], [stop], [must-avoid_stopping]).
rule(r240s, standard, [redlines, stoppingNotAllowedBySigns], [stop], [must-avoid_stopping]).
rule(r240t, standard, [prohibitedToStopstop], [stop], [must-avoid_stopping]).

%Rule Description: Parking continued
rule(r241, standard, [parkingRestrictions, dontMeetParkingRestrictions], [park], [must-avoid_parking]).

%Rule Description: Parking still continued
rule(r242, standard, [dangerousToStop], [park], [must-avoid_parking]).
rule(r242, standard, [unncessaryObstruction], [park], [must-avoid_parking]).

%Rule Description: More parking
rule(r243a, standard, [stationaryTraffic], [park], [must-avoid_parking]).
rule(r243b, standard, [schoolEntrance], [park], [must-avoid_parking]).
rule(r243c, standard, [preventingAccessForEmergencyServices], [park], [must-avoid_parking]).
rule(r243d, standard, [nearbusStop], [park], [must-avoid_parking]).
rule(r243e, standard, [nearTramStop], [park], [must-avoid_parking]).
rule(r243f, standard, [nearTaxiRank], [park], [must-avoid_parking]).
rule(r243g, standard, [levelCrossingApproach], [park], [must-avoid_parking]).
rule(r243h, standard, [tramlinesCrossingApproach], [park], [must-avoid_parking]).
rule(r243i, standard, [toJunction10meters, notAuthorisedParkingPlace], [park], [must-avoid_parking]).
rule(r243j, standard, [nearBrowOfHill], [park], [must-avoid_parking]).
rule(r243k, standard, [nearHumpbridge], [park], [must-avoid_parking]).
rule(r243l, standard, [oppositeParkedVehicle], [park], [must-avoid_parking]).
rule(r243m, standard, [forceTrafficToTramlane], [park], [must-avoid_parking]).
rule(r243n, standard, [kerbLoweredForWheelchair], [park], [must-avoid_parking]).
rule(r243o, standard, [bendInRoad], [park], [must-avoid_parking]).
rule(r243p, standard, [obstructCycleFacilities], [park], [must-avoid_parking]).

rule(r243q, standard, [stationaryTraffic], [stop], [must-avoid_stopping]).
rule(r243r, standard, [schoolEntrance], [stop], [must-avoid_stopping]).
rule(r243s, standard, [preventingAccessForEmergencyServices], [stop], [must-avoid_stopping]).
rule(r243t, standard, [nearbusStop], [stop], [must-avoid_stopping]).
rule(r243u, standard, [nearTramStop], [stop], [must-avoid_stopping]).
rule(r243v, standard, [nearTaxiRank], [stop], [must-avoid_stopping]).
rule(r243w, standard, [levelCrossingApproach], [stop], [must-avoid_stopping]).
rule(r243x, standard, [tramlinesCrossingApproach], [stop], [must-avoid_stopping]).
rule(r243y, standard, [toJunction10meters, notAuthorisedstoppingPlace], [stop], [must-avoid_stopping]).
rule(r243z, standard, [nearBrowOfHill], [stop], [must-avoid_stopping]).
rule(r243aa, standard, [nearHumpbridge], [stop], [must-avoid_stopping]).
rule(r243ab, standard, [oppositestopedVehicle], [stop], [must-avoid_stopping]).
rule(r243ac, standard, [forceTrafficToTramlane], [stop], [must-avoid_stopping]).
rule(r243ad, standard, [kerbLoweredForWheelchair], [stop], [must-avoid_stopping]).
rule(r243ae, standard, [bendInRoad], [stop], [must-avoid_stopping]).
rule(r243af, standard, [obstructCycleFacilities], [stop], [must-avoid_stopping]).

%Rule Description: Pavement parking
rule(r244, standard, [onPavement, london], [park], [must-avoid_parking]).
rule(r244, standard, [onPavement, notInLondon], [park], [should-avoid_parking]).

%Rule Description: Parking zones, discribed
%Rule Description: Goods vehicle parking
%Rule Description: Loading and unloading
rule(r247a, standard, [yellowMarkingsOnKerb, signsAdviseRestrictions], [loadUnloading], [must-avoid_loading_unloading]).
rule(r247b, standard, [redRoute, notMarkedBayForLoading], [loadUnloading], [must-avoid_loading_unloading]).

%Rule Description: Parking at night
rule(r248, standard, [night, againstFlowOfTraffic, notParkingSpace], [park], [must-avoid_parking]).

%Rule Description: ParkingLights
rule(r249, standard, [parked, limitabove30mph], [], [must-parking_lights_on]).

%Rule Description: ParkingLights regular vehicles
rule(r250, standard, [parked, limit30orBelow, notParkingSpace, junctionOver10metersAway], [], [must-parking_lights_on]).

%Rule Description: Parking in fog
rule(r251, standard, [fog, parkedInRoad], [], [should-parking_lights_on]).

%Rule Description: Parking on hills
rule(r252a, standard, [hill, facingUphill], [park], [should-close_to_kerb,  should-wheel_away_from_kerb,  should-handbrake_on]).
rule(r252b, standard, [hill, facingDownhill], [park], [should-close_to_kerb,  should-wheel_toward_from_kerb,  should-handbrake_on]).

%Rule Description: Prohibited Vehicles
rule(r253, standard, [amSlowMovingVehicle], [enterMotorway], [must-avoid_motorway]).

%Rule Description: Traffic faster so pay attention
%Rule Description: Read signs
%Rule Description: Signs exist
%Rule Description: Amber lights on sign
rule(r257, standard, [motorway, signFlashingAmber], [], [should-reduce_speed]).

%Rule Description: Red flashing light%Rule Description: Red flashing light across all lanes
rule(r258, standard, [motorway, signFlashingRedX, laneAvailiable], [], [must-follow_sign,  must-avoid_closed_lane]).
rule(r258, standard, [motorway, signFlashingRedX, laneNotAvailiable], [], [must-stop_at_sign,  must-follow_police_direction]).

%Rule Description: Joining the motorway
rule(r259, standard, [], [enterMotorway], [should-priority_to_motorway_traffic,  should-match_speed_to_motorway, should-avoid_hard_shoulder, should-dont_cross_solid_white,  should-stay_on_running_lane, should-keep_left_lane]).

%Rule Description: On motorway
rule(r260, standard, [motorway, visibilityClear], [], [should-steady_speed,  should-safe_distance]).

%Rule Description: keep to speed limit motorway
rule(r261, standard, [motorway], [], [must-keep_under_speed_limit]).

%Rule Description: take breaks
%Rule Description: don't reverse etc
rule(r263, standard, [motorway, notDirectedByPoliceOfficer], [], [must-avoid_drive_against_traffic_flow,  must-avoid_crossing_central_reservation,  must-avoid_reversing]).

%Rule Description: Stay in leftMostLane
rule(r264a, standard, [motorway, hardshoulderNotUsed], [overtake], [should-keep_left_lane]).
rule(r264b, standard, [motorway, hardshoulderUsed], [overtake], [should-move_adjacent_lane]).

%Rule Description: Vehicles banned from right hand lane (3+)
%Rule Description: Get into lane quickly
rule(r266a, standard, [motorway, approachingJunction], [], [should-get_into_lane]).
rule(r266b, standard, [motorway, directionSigns], [], [should-get_into_lane]).

%Rule Description: Overtaking on the motorway
rule(r267, standard, [motorway], [overtake], [should-overtake_on_right,  should-lane_clear,  should-signal]).

%Rule Description: continued
rule(r268, standard, [motorway], [overtake], [must-avoid_overtaking_on_left,  must-avoid_weaving]).

%Rule Description: Avoid hard shoulder
rule(r269a, standard, [motorway, notDirectedByPoliceOfficer], [], [must-avoid_hard_shoulder]).
rule(r269b, standard, [motorway, noSpeedlimitForHardShoulder], [], [must-avoid_hard_shoulder]).

%Rule Description: Avoid emergency area
rule(r270, standard, [motorway], [], [must-avoid_emergency_area]).

%Rule Description: Must not stop 
rule(r271a, standard, [motorway, notDirectedByPoliceOfficer], [], [must-avoid_stopping]).
rule(r271b, standard, [motorway, signSayingStop], [], [must-avoid_stopping]).

%Rule Description: Must not pick up people/ set down people
rule(r272, standard, [motorway], [], [must-avoid_pick_up_set_down]).

%Rule Description: Leaving motorway
rule(r273, standard, [], [leaveMotorway], [should-move_to_left_hand_lane,  should-signal_left_on_exit,  should-reduce_speed_on_slip_road]).

%Rule Description: Reduce speed on slipway
rule(r274, standard, [sliproad], [], [should-reduce_speed_on_slip_road]).

%Rule Description: Breakdown
rule(r276, standard, [brokendown, notOnMotorway], [], [should-get_off_road,  should-use_hazard_lights,  should-keep_sidelights_on]).

%Rule Description: Breakdown (motorway)
rule(r277, standard, [brokendown, motorway], [], [should-go_to_left_hand_land,  should-use_hazard_lights,  should-keep_sidelights_on,  should-pull_into_hard_shoulder,  pull_into_emergency_area]).

%Rule Description: Rejoin
rule(r278, standard, [hardshoulder], [joinMotorway], [should-buildup_speed_on_hard_shoulder]).

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
rule(r288, standard, [roadWorksAhead], [], [must-dontExceedTempSpeedLimit, should-keep_safe_distance,should-get_into_lane, should-avoid_lane_switching, should-merge_in_turn, must-avoid_coned_off_area, should-allow_extra_space_for_works_vehicles]).

%Rule Description: Take special care on motorways
rule(r289, standard, [motorway, workVehicleSign], [], [must-obey_work_vehicle_sign]).
rule(r289, standard, [dualCarriageWay, workVehicleSign], [], [must-obey_work_vehicle_sign]).

%Rule Description: Contraflow in roadWorks
rule(r290, standard, [roadWorks, contraflow], [], [should-increase_distance_to_car_infront,  should-reduce_speed]).

%Rule Description: Level crossing
rule(r291a, standard, [nearLevelCrossing, exitNotClear], [], [must-avoid_crossing_level_crossing,  must-avoid_stopping,  must-avoid_parking]).%TODO: Hand check
rule(r291b, standard, [nearLevelCrossing, exitClear], [], [must-avoid_stopping,  must-avoid_parking]).
rule(r291c, standard, [levelCrossing], [], [must-avoid_stopping,  must-avoid_parking]).

%Rule Description: Level crossing overhead electric lines
rule(r292, standard, [crossLevelCrossing, dontmeetHeightRequirement], [], [must-avoid_level_crossing]).

%Rule Description: Controlled Crossing
rule(r293a, standard, [controlledCrossing, flashingRed], [], [must-stop_at_white_line]).
rule(r293b, standard, [controlledCrossing, amber], [], [must-do_not_stop]).
rule(r293c, standard, [controlledCrossing], [], [must-do_not_reverse]).
rule(r293d, standard, [crossinglightsOn, barriersNotOpen], [crossControlledCrossing], [must-avoid_crossing_level_crossing]).

%Rule Description: Railway telephones
%Rule Description: Crossings without lights
rule(r295, standard, [noCrossingLights, barriersNotOpen], [crossControlledCrossing], [must-avoid_crossing_level_crossing]).

%Rule Description: User gates/barriers
rule(r296, standard, [stopSignCrossing, redLight], [], [must-avoid_crossing_crossing]).
rule(r296, standard, [stopSignCrossing, notGreenLight], [], [must-avoid_crossing_crossing]).

%Rule Description: As before but no lights
rule(r297, standard, [stopSignCrossing, noLights, crossingNotClear], [], [must-avoid_crossing_crossing]).

%Rule Description: Open crossing
rule(r298, standard, [openCrossing, noLights], [], [must-avoid_crossing_crossing]).

%Rule Description: If breakdown on crossing, escape.
%Rule Description: tramlines
rule(r300a, standard, [], [enterTramReservedRoad], [must-avoid_tram_reserved_road]).
rule(r300b, standard, [tramlines], [], [should-avoid_driving_on_rails]).

%Rule Description: Faced with tram
rule(r301a, standard, [tram, noTramPassingLane], [], [should-give_way_to_tram,  should-avoid_overtaking,  must-avoid_overtaking_on_left]).
rule(r301b, standard, [tram, tramPassingLane], [], [should-give_way_to_tram,  should-use_tram_passing_lane,  must-avoid_overtaking_on_left]).

%Rule Description: Park on tramlines
rule(r302, standard, [tramlines], [stop], [must-avoid_parking]).

%Rule Description: at tram stop
rule(r303, standard, [tramStop], [], [must-follow_signs,  must-avoid_overtaking,  must-avoid_overtaking_on_left]).

%Rule Description: Look for pedestrians
%Rule Description: Give way to trams
rule(r305, standard, [tram], [], [should-give_way_to_tram]).

%Rule Description: driving on tram tracks
%Rule Description: overhead electric lines
rule(r307, standard, [tramlines, dontMeetHeightRequirement], [], [should-find_other_route]).

%Emergency
%Rule Description: Emergency Breaking
rule(r118, emergency, [brake], [], [should-brake_hard]).

%Rule Description: ABS - rule is same
rule(r120, emergency, [brake], [], [should-brake_hard]).

%Rule Description: Stop in emergency
rule(r275, emergency, [], [], [should-find_safe_place_to_stop]).
