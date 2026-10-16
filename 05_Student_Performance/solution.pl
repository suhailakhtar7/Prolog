% Practical 5: Classify students as topper, average, and fail using rule-based reasoning
% SWI-Prolog. Load this file in a fresh session.

marks(amit,92). marks(neha,65). marks(rahul,34).
marks(sara,85). marks(kiran,40). marks(isha,84).
category(M,topper) :- number(M), M >= 85, M =< 100.
category(M,average) :- number(M), M >= 40, M < 85.
category(M,fail) :- number(M), M >= 0, M < 40.
performance(S,C) :- marks(S,M), category(M,C).
topper(S) :- performance(S,topper).
average(S) :- performance(S,average).
failed(S) :- performance(S,fail).
