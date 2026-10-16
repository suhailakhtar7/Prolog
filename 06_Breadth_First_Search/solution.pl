% Practical 6: Implement Breadth-First Search (BFS) to find the shortest path in a graph
% SWI-Prolog. Load this file in a fresh session.

edge(a,b). edge(a,c). edge(b,d). edge(c,e).
edge(d,g). edge(e,g). edge(e,a).
node(a). node(b). node(c). node(d). node(e). node(g).
bfs(Start,Goal,Path) :- node(Start), node(Goal), queue([[Start]],Goal,[Start],Rev), reverse(Rev,Path).
queue([[Goal|T]|_],Goal,_,[Goal|T]) :- !.
queue([[N|T]|Rest],Goal,Seen,Path) :-
    findall(X,(edge(N,X), \+ memberchk(X,Seen)),Raw),
    sort(Raw,Children),
    findall([X,N|T],member(X,Children),NewPaths),
    append(Rest,NewPaths,Q), append(Seen,Children,Seen1),
    queue(Q,Goal,Seen1,Path).
