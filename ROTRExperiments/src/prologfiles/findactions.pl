:- include('UKrotr.pl').

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