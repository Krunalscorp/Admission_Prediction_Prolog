% Declare dynamic predicates for user input
:- dynamic gre/1, toefl/1, cgpa/1, sop/1, lor/1, university_rating/1, research/1.

% Knowledge Base for Graduate Admission Prediction based on Decision Tree

% Rule 1: CGPA <= 8.73
admission(no) :- cgpa(C), C =< 8.73, gre(G), G =< 318.5, cgpa(C), C =< 8.2.
admission(no) :- cgpa(C), C =< 8.73, gre(G), G =< 318.5, cgpa(C), C > 8.2, university_rating(U), U =< 2.5, research(R), R =< 0.5.
admission(no) :- cgpa(C), C =< 8.73, gre(G), G =< 318.5, cgpa(C), C > 8.2, university_rating(U), U =< 2.5, research(R), R > 0.5, gre(G), G =< 311.5.
admission(no) :- cgpa(C), C =< 8.73, gre(G), G =< 318.5, cgpa(C), C > 8.2, university_rating(U), U > 2.5, gre(G), G =< 306.5.
admission(no) :- cgpa(C), C =< 8.73, gre(G), G =< 318.5, cgpa(C), C > 8.2, university_rating(U), U > 2.5, gre(G), G > 306.5, toefl(T), T =< 105.5.

admission(no) :- cgpa(C), C =< 8.73, gre(G), G > 318.5, cgpa(C), C =< 8.59, toefl(T), T =< 106.5.
admission(yes) :- cgpa(C), C =< 8.73, gre(G), G > 318.5, cgpa(C), C =< 8.59, toefl(T), T > 106.5, gre(G), G =< 321.5.
admission(no) :- cgpa(C), C =< 8.73, gre(G), G > 318.5, cgpa(C), C =< 8.59, toefl(T), T > 106.5, gre(G), G > 321.5, toefl(T), T =< 110.5.
admission(yes) :- cgpa(C), C =< 8.73, gre(G), G > 318.5, cgpa(C), C > 8.59, cgpa(C), C =< 8.66.
admission(no) :- cgpa(C), C =< 8.73, gre(G), G > 318.5, cgpa(C), C > 8.66.

% Rule 2: CGPA > 8.73
admission(no) :- cgpa(C), C > 8.73, sop(S), S =< 2.75, toefl(T), T =< 108.5.
admission(yes) :- cgpa(C), C > 8.73, sop(S), S =< 2.75, toefl(T), T > 108.5.
admission(no) :- cgpa(C), C > 8.73, sop(S), S > 2.75, gre(G), G =< 316.5, lor(L), L =< 4.25, cgpa(C), C =< 8.78.
admission(yes) :- cgpa(C), C > 8.73, sop(S), S > 2.75, gre(G), G =< 316.5, lor(L), L =< 4.25, cgpa(C), C > 8.78.
admission(no) :- cgpa(C), C > 8.73, sop(S), S > 2.75, gre(G), G =< 316.5, lor(L), L > 4.25.
admission(yes) :- cgpa(C), C > 8.73, sop(S), S > 2.75, gre(G), G > 316.5, sop(S), S =< 3.75, lor(L), L =< 3.75, cgpa(C), C =< 9.03.
admission(yes) :- cgpa(C), C > 8.73, sop(S), S > 2.75, gre(G), G > 316.5, sop(S), S =< 3.75, lor(L), L > 3.75.
admission(yes) :- cgpa(C), C > 8.73, sop(S), S > 2.75, gre(G), G > 316.5, sop(S), S > 3.75.

% Get user input and classify admission
user_query :-
    write('Enter student details...\n'),
    
    write('Enter GRE score: '), read(GRE),
    retractall(gre(_)), assertz(gre(GRE)),

    write('Enter TOEFL score: '), read(TOEFL),
    retractall(toefl(_)), assertz(toefl(TOEFL)),

    write('Enter University Rating: '), read(UR),
    retractall(university_rating(_)), assertz(university_rating(UR)),

    write('Enter SOP score: '), read(SOP),
    retractall(sop(_)), assertz(sop(SOP)),

    write('Enter LOR score: '), read(LOR),
    retractall(lor(_)), assertz(lor(LOR)),

    write('Enter CGPA: '), read(CGPA),
    retractall(cgpa(_)), assertz(cgpa(CGPA)),

    write('Enter Research (0 or 1): '), read(Research),
    retractall(research(_)), assertz(research(Research)),

    % Run admission classification
    ( admission(Result) ->
        ( Result = 1 -> Decision = 'Yes' ; Decision = 'No' ),
        format('Admission decision: ~w~n', [Decision])
    ;   write('No matching admission rule found.\n')
    ),

    % Prompt for the next query
    write('\nTo initiate the next query, please type: user_query.\n').


% Automatically prompt for student details when file is consulted
:- user_query.