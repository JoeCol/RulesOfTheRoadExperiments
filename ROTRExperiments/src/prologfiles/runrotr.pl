:- include('findactions').
:- initialization(main).

main :- getActions(standard,[allPassengersWearingSeatBeltsAsRequired,driving,fuel,roadAheadClear,allChildrenUsingChildSeatAsRequired,vehicleSafe,bendInRoad,dualCarriageWay,routePlanned,headlightsOff,canReadNumberPlate,completeOvertakeBeforeSolidWhiteLine,sidelightsOff],[],Actions), write(Actions), halt(0).