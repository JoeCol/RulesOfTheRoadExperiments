:- include('findactions').
:- initialization(main).

main :- getActions(standard,[vehicleSafe, canReadNumberPlate, routePlanned, allPassengersWearingSeatBeltsAsRequired, allChildrenUsingChildSeatAsRequired],[],Actions), write(Actions), halt(0).