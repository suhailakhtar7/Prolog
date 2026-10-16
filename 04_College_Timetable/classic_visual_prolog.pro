/* Classic Visual Prolog 5.x-style source; NOT modern Visual Prolog or SWI. */
domains
    day, timeslot, subject, faculty, room = symbol
predicates
    nondeterm timetable(day,timeslot,subject,faculty,room)
    nondeterm faculty_schedule(faculty,day,timeslot,subject,room)
    nondeterm subject_room(subject,day,timeslot,room)
    nondeterm room_busy(room,day,timeslot)
clauses
    timetable(monday,nine,ai,mehta,r101).
    timetable(monday,ten,database,rao,r102).
    timetable(tuesday,nine,python,sen,lab1).
    timetable(tuesday,ten,ai,mehta,r101).
    timetable(wednesday,eleven,mathematics,sharma,r103).
    faculty_schedule(F,D,T,S,R) :- timetable(D,T,S,F,R).
    subject_room(S,D,T,R) :- timetable(D,T,S,_,R).
    room_busy(R,D,T) :- timetable(D,T,_,_,R).
goal
    faculty_schedule(mehta,D,T,S,R),
    write(D," ",T," ",S," ",R), nl, fail.
