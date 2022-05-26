:- include('findactions').
:- initialization(main).

main :- getRecommendedActions(standard,[headlightsOff,exitClear,allChildrenUsingChildSeatAsRequired,lightRed,allPassengersWearingSeatBeltsAsRequired,vehicleDoesntFitsInCentralReservation,sidelightsOff,fuel,canReadNumberPlate,vehicleSafe,dualCarriageWay,roadAheadClear,routePlanned,completeOvertakeBeforeSolidWhiteLine,driving,bendInRoad],[turnRight],Actions), write(Actions), halt(0).