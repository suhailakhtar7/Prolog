% Practical 4: Develop a timetable database and answer queries regarding faculty, subjects, and classrooms
% SWI-Prolog. Load this file in a fresh session.

% timetable(Day,Time,Subject,Faculty,Room).
timetable(monday, nine, ai, mehta, r101).
timetable(monday, ten, database, rao, r102).
timetable(tuesday, nine, python, sen, lab1).
timetable(tuesday, ten, ai, mehta, r101).
timetable(wednesday, eleven, mathematics, sharma, r103).
faculty_schedule(F,D,T,S,R) :- timetable(D,T,S,F,R).
subject_room(S,D,T,R) :- timetable(D,T,S,_,R).
room_busy(R,D,T) :- timetable(D,T,_,_,R).
% Restrict queries to known slots; negation is checked only after binding.
day(monday). day(tuesday). day(wednesday).
slot(nine). slot(ten). slot(eleven).
room(r101). room(r102). room(r103). room(lab1).
room_free(R,D,T) :- room(R), day(D), slot(T), \+ room_busy(R,D,T).
