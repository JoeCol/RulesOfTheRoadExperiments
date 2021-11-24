:- include('findactions').
:- initialization(main).

main :- getActions(standard,[],[],Actions), write(Actions), halt(0).