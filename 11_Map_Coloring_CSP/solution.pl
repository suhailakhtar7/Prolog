% Practical 11: Represent a Map-Coloring problem as a CSP and solve it using backtracking search
% SWI-Prolog. Load this file in a fresh session.

color(red). color(green). color(blue).
% Australian regions: WA, NT, SA, Q, NSW, V, T.
map_coloring([wa-WA,nt-NT,sa-SA,q-Q,nsw-NSW,v-V,t-T]) :-
    color(WA), color(NT), WA \= NT,
    color(SA), SA \= WA, SA \= NT,
    color(Q), Q \= NT, Q \= SA,
    color(NSW), NSW \= SA, NSW \= Q,
    color(V), V \= SA, V \= NSW,
    color(T).
