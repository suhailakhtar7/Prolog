% Practical 10: Solve an optimization problem using Simulated Annealing to escape local optima
% SWI-Prolog. Load this file in a fresh session.

:- use_module(library(random)).


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

% Accept worse candidates with probability exp(delta / temperature).
anneal(Start,Seed,Best,Value,Trace) :-
    integer(Start), score(Start,V), integer(Seed), set_random(seed(Seed)),
    anneal_loop(500,10.0,Start,V,Start,V,Best,Value,Trace).
anneal_loop(0,_,X,V,B,BV,B,BV,[step(X,V)]) :- !.
anneal_loop(K,T,X,V,B,BV,Best,Value,[step(X,V)|Tail]) :-
    K > 0, findall(Y,neighbor(X,Y),Ys), random_member(Candidate,Ys),
    score(Candidate,CV), Delta is CV-V,
    ( Delta >= 0 -> NX=Candidate, NV=CV
    ; R is random_float,
      ( R < exp(Delta/T) -> NX=Candidate, NV=CV ; NX=X, NV=V ) ),
    ( NV > BV -> NB=NX, NBV=NV ; NB=B, NBV=BV ),
    K1 is K-1, T1 is max(0.001,T*0.99),
    anneal_loop(K1,T1,NX,NV,NB,NBV,Best,Value,Tail).
compare :-
    hill_climb(0,H,HV,_), format('Hill climbing: x=~w, value=~w~n',[H,HV]),
    forall(between(1,5,Seed),
       (anneal(0,Seed,B,V,_), format('Annealing seed ~w: x=~w, value=~w~n',[Seed,B,V]))).
