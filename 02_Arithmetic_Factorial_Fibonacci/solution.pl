% Practical 2: Implement arithmetic operations, Factorial, and Fibonacci Series using recursion
% SWI-Prolog. Load this file in a fresh session.

% Arithmetic predicates expect instantiated numbers.
arithmetic(A,B,Sum,Difference,Product) :-
    number(A), number(B), Sum is A+B, Difference is A-B, Product is A*B.
quotient(A,B,Q) :- number(A), number(B), B =\= 0, Q is A/B.
factorial(N,F) :- integer(N), N >= 0, fact(N,F).
fact(0,1).
fact(N,F) :- N > 0, M is N-1, fact(M,G), F is N*G.
fibonacci(N,F) :- integer(N), N >= 0, fib(N,0,1,F).
fib(0,A,_,A).
fib(N,A,B,F) :- N > 0, M is N-1, C is A+B, fib(M,B,C,F).
% N is the number of terms, starting with F(0)=0.
fibonacci_series(N,L) :- integer(N), N >= 0, series(N,0,1,L).
series(0,_,_,[]).
series(N,A,B,[A|T]) :- N > 0, M is N-1, C is A+B, series(M,B,C,T).
