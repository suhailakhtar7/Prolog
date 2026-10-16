% Practical 8: Implement the A* Search algorithm to find the optimal path using path cost and heuristic estimate
% SWI-Prolog. Load this file in a fresh session.

arc(s,a,2). arc(s,b,1). arc(a,g,8). arc(b,c,2). arc(c,g,2).
h(s,4). h(a,1). h(b,3). h(c,2). h(g,0).

astar(Start,g,Path,Cost) :- h(Start,H),
    astar_open([H-state(Start,[Start],0)],[Start-0],Rev,Cost), reverse(Rev,Path).
astar_open([_-state(N,P,G)|Rest],Best,Path,Cost) :-
    memberchk(N-Known,Best),
    ( G > Known -> astar_open(Rest,Best,Path,Cost)
    ; N == g -> Path=P, Cost=G
    ; findall(X-W,arc(N,X,W),Children),
      relax(Children,P,G,Rest,Best,Open1,Best1),
      keysort(Open1,Sorted), astar_open(Sorted,Best1,Path,Cost)
    ).
relax([],_,_,Open,Best,Open,Best).
relax([X-W|Xs],P,G,Open,Best,Final,FinalBest) :-
    G1 is G+W,
    ( memberchk(X-Old,Best), Old =< G1 -> Open1=Open, Best1=Best
    ; h(X,H), F is G1+H,
      Open1=[F-state(X,[X|P],G1)|Open],
      ( select(X-_,Best,Tail) -> Best1=[X-G1|Tail] ; Best1=[X-G1|Best] )
    ),
    relax(Xs,P,G,Open1,Best1,Final,FinalBest).
