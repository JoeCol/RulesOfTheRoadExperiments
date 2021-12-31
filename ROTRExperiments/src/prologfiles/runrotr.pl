:- include('findactions').
:- initialization(main).

main :- getActions(standard,[headlightsOff,completeOvertakeBeforeSolidWhiteLine,sidelightsOff,allPassengersWearingSeatBeltsAsRequired,fuel,driving,allChildrenUsingChildSeatAsRequired,exceedingSpeedLimit,canReadNumberPlate,vehicleSafe,exitClear,routePlanned,roadAheadClear,overtaking,dualCarriageWay,vehicleDoesntFitsInCentralReservation,bendInRoad],[],Actions), write(Actions), halt(0).