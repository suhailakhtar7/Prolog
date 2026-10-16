/* Classic Visual Prolog 5.x-style source; NOT modern Visual Prolog or SWI. */
domains
    person, subject = symbol
predicates
    nondeterm student(person)
    nondeterm course(subject)
    nondeterm enrolled(person,subject)
    nondeterm teaches(person,subject)
    nondeterm classmate(person,person)
    nondeterm student_teacher(person,person)
clauses
    student(amit). student(neha). student(rahul).
    course(ai). course(database). course(python).
    enrolled(amit,ai). enrolled(amit,python).
    enrolled(neha,database). enrolled(rahul,ai).
    teaches(mehta,ai). teaches(rao,database). teaches(sen,python).
    classmate(X,Y) :- enrolled(X,C), enrolled(Y,C), X <> Y.
    student_teacher(S,T) :- enrolled(S,C), teaches(T,C).
goal
    enrolled(amit,C), write(C), nl, fail.
