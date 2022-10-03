:- include('findactions').
:- initialization(main).

main :- getRecommendedActions(standard,[routePlanned,headlightsOff,allPassengersWearingSeatBeltsAsRequired,bendInRoad,vehicleSafe,dualCarriageWay,roadAheadClear,fuel,canReadNumberPlate,driving,allChildrenUsingChildSeatAsRequired,sidelightsOff,exitClear,completeOvertakeBeforeSolidWhiteLine,vehicleDoesntFitsInCentralReservation],[],Actions), write(Actions), halt(0).