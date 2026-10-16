% Practical 12: Solve the N-Queens problem using backtracking to satisfy CSP constraints
% SWI-Prolog. Load this file in a fresh session.

% Row position in the list is the row number; its value is the column.
n_queens(N,Columns) :- integer(N), N >= 1,
    numlist(1,N,Available), place(Available,[],Columns).
place([],_,[]).
place(Available,Previous,[C|Rest]) :-
    select(C,Available,Remaining),
    safe(C,Previous,1),
    place(Remaining,[C|Previous],Rest).
safe(_,[],_).
safe(C,[P|Ps],Distance) :-
    abs(C-P) =\= Distance,
    Next is Distance+1, safe(C,Ps,Next).
print_board(Columns) :- length(Columns,N),
    forall(member(C,Columns),
       (forall(between(1,N,J),(J =:= C -> write('Q ') ; write('. '))),nl)).
