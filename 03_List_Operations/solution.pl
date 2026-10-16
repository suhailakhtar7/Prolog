% Practical 3: Perform append, reverse, member search, and list length operations
% SWI-Prolog. Load this file in a fresh session.

my_append([],L,L).
my_append([H|T],L,[H|R]) :- my_append(T,L,R).
my_reverse(L,R) :- reverse_acc(L,[],R).
reverse_acc([],A,A).
reverse_acc([H|T],A,R) :- reverse_acc(T,[H|A],R).
my_member(X,[X|_]).
my_member(X,[_|T]) :- my_member(X,T).
my_length([],0).
my_length([_|T],N) :- my_length(T,M), N is M+1.
