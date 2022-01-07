rule(r89, standard, [vehicleUnsafe], [], [must-next_safe_stop]).

rule(r118, emergency, [], [brake], [should-brake_hard]).
rule(r121, emergency, [], [brake], [should-brake_hard]).
rule(r275, emergency, [], [], [should-find_safe_place_to_stop]).


getRecommendedActions([RName|Tail], Context, B, I, A, R) :-
	rule(RName, Context, Br, Ir, Ar),
	((subset(Br, B), subset(Ir, I)) -> append(Ar, A, Ao); Ao = A),
	getRecommendedActions(Tail, Context, B, I, Ao, R), !.
	
getRecommendedActions(RName, Context, B, I, A, R) :-
	rule(RName, Context, Br, Ir, Ar),
	((subset(Br, B), subset(Ir, I)) -> append(Ar, A, Ao); Ao = A),
	getRecommendedActions([], Context, B, I, Ao, R), !.
	
getRecommendedActions([], _, _, _, A, Ao) :- Ao = A.	
	
getRecommendedActions(Context, B, I, R) :-
	findall(X, rule(X,Context,_,_,_), L),
	getRecommendedActions(L, Context, B, I, [], A),
	sort(A, R).