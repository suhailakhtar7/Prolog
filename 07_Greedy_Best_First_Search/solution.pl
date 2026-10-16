% Practical 7: Implement Greedy Best-First Search using a heuristic function to find a path in a graph
% SWI-Prolog. Load this file in a fresh session.

arc(s,a,2). arc(s,b,1). arc(a,g,8). arc(b,c,2). arc(c,g,2).
h(s,4). h(a,1). h(b,3). h(c,2). h(g,0).

% Heuristics in this example are estimates to the fixed goal g.
greedy(Start,g,Path,Cost) :- h(Start,H),
    greedy_open([H-state(Start,[Start],0)],[],Rev,Cost), reverse(Rev,Path).
greedy_open([_-state(g,P,C)|_],_,P,C) :- !.
greedy_open([_-state(N,P,C)|Rest],Closed,Result,Cost) :-
    ( memberchk(N,Closed) -> greedy_open(Rest,Closed,Result,Cost)
    ; findall(H-state(X,[X|P],C1),
          (arc(N,X,W), \+ memberchk(X,[N|Closed]), C1 is C+W, h(X,H)),New),
      append(Rest,New,All), keysort(All,Sorted),
      greedy_open(Sorted,[N|Closed],Result,Cost)
    ).
