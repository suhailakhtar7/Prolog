% Practical 9: Implement Hill Climbing for optimization problems
% SWI-Prolog. Load this file in a fresh session.

% Maximize this finite numerical objective over integer x in [0,10].
score(0,0). score(1,3). score(2,6). score(3,5). score(4,4).
score(5,5). score(6,7). score(7,9). score(8,12). score(9,10). score(10,8).
neighbor(X,Y) :- Y is X-1, Y >= 0.
neighbor(X,Y) :- Y is X+1, Y =< 10.
hill_climb(Start,Best,Value,Trace) :- integer(Start), score(Start,_), climb(Start,Best,Value,Trace).
climb(X,Best,Value,[X|Tail]) :-
    score(X,V), findall(S-Y,(neighbor(X,Y),score(Y,S)),Candidates),
    keysort(Candidates,Sorted), last(Sorted,NextValue-Next),
    ( NextValue > V -> climb(Next,Best,Value,Tail)
    ; Best=X, Value=V, Tail=[] ).
