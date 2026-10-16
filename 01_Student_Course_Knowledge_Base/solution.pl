% Practical 1: Create a simple Knowledge Base using facts, predicates, clauses, and goals (Student-Course Database)
% SWI-Prolog. Load this file in a fresh session.

student(amit). student(neha). student(rahul).
course(ai). course(database). course(python).
enrolled(amit, ai). enrolled(amit, python).
enrolled(neha, database). enrolled(rahul, ai).
teaches(mehta, ai). teaches(rao, database). teaches(sen, python).
classmate(X,Y) :- enrolled(X,C), enrolled(Y,C), dif(X,Y).
student_teacher(S,T) :- enrolled(S,C), teaches(T,C).
