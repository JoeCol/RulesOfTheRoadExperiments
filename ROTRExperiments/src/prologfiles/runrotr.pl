:- include('findactions').
:- initialization(main).

main :- getActions(standard,[vehicleSafe,bendInRoad,headlightsOff,allChildrenUsingChildSeatAsRequired,canReadNumberPlate,exitClear,dualCarriageWay,vehicleDoesntFitsInCentralReservation,roadAheadClear,fuel,driving,completeOvertakeBeforeSolidWhiteLine,routePlanned,lightRed,allPassengersWearingSeatBeltsAsRequired,sidelightsOff],[approachingTrafficLight,setOff],Actions), write(Actions), halt(0).