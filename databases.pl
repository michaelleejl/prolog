tName(acr31,'Andrew Rice').
tName(arb33,'Alastair Beresford').
tName(mjll2, 'Michael Lee').
tCollege(acr31, 'Churchill').
tCollege(arb33, 'Robinson').
tCollege(jhyc3, 'Corpus Christi').
tGrade(mjll2, 'IA', 1).
tGrade(acr31,'IA',2.1).
tGrade(acr31,'IB',2.1).
tGrade(acr31,'II',1).
tGrade(arb33,'IA',2.1).
tGrade(arb33,'IB',1).
tGrade(arb33,'II',1).

% qNameCollege(?A, ?B) succeeds if there exists a C such that tName(C, A) and tCollege(C, B)
qNameCollege(A, B) :- tName(C, A), tCollege(C, B).

% qNameCollege(?A, ?B, ?C) succeeds if there exists a C such that tName(C, A) and tCollege(C, B)
qNameCollegeCRSID(A, B, C) :- tName(C, A), tCollege(C, B).

% qNameCollege(?A, ?B) succeeds if there exists a C such that tName(C, A) and tCollege(C, B), or
% if there exists a C such that tName(C, A) and B=''.
qNameCollegeBlank(A, B) :- tName(C, A), tCollege(C, B).
qNameCollegeBlank(A, B) :- tName(C, A), not(tCollege(C, B)), B = ''. 

% qNameBlankCollegeBlank(?A, ?B) succeeds if there exists a C such that tName(C, A) and tCollege(C, B), or
% if there exists a C such that tName(C, A) and B=''.
qNameBlankCollegeBlank(A, B) :- tName(C, A), tCollege(C, B).
qNameBlankCollegeBlank(A, B) :- tName(C, A), not(tCollege(C, B)), B = ''. 
qNameBlankCollegeBlank(A, B) :- tCollege(C, B), not(tName(C, A)), A = ''. 

% define what a lower grade means
lowerGrade(3, 2.2).
lowerGrade(3, 2.1).
lowerGrade(3, 1).
lowerGrade(2.2, 2.1).
lowerGrade(2.2, 1).
lowerGrade(2.1, 1).

%define what a lower year means
lowerYear('IA', 'IB').
lowerYear('IA', 'II').
lowerYear('IB', 'II').

%lowestGrade(+C, -G) succeeds if there exists a Y such that tGrade(C, Y, G), and for all Y', it is not the case that lowerAttainedGrade(C, Y', G), and it is not the case that greaterYear(C, Y, G).
lowestGrade(C, G) :- tGrade(C, Y, G), not(lowerAttainedGrade(C, _, G)), not(greaterYear(C, Y, G)).

%lowerAttainedGrade(+C, +G, +G1) succeeds if there exists a Y such that tGrade(C,Y,G), there exists a Y1 such that tGrade(C,Y1,G), and lowerGrade(G, G1).
lowerAttainedGrade(C, G, G1) :- tGrade(C, _, G), tGrade(C, _, G1), lowerGrade(G, G1).

%greaterYear(+C, +Y, +G) succeeds if there exists a Y1 such that tGrade(C, Y1, G), and lowerYear(Y1, Y).
greaterYear(C, Y, G) :- tGrade(C, Y1, G), lowerYear(Y1, Y).

member(A, [H|_]) :- A = H.
member(A, [_|T]) :- member(A, T).

%countGrades(+G, -N, +Acc) succeeds if 
% 1) there exists C,Y such that tGrade(C,Y,G), and (C,Y) is not a member of Acc, and N is one more than M, where countGrades(G, M, [(C, Y)|Acc]) succeeds.
% 2) there does not exist C, Y such that tGrade(C,Y,G), and (C,Y) is not a member of Acc, and N is 0. 
countGrades(G, N, Acc) :- tGrade(C, Y, G), not(member((C, Y), Acc)), !, countGrades(G, M, [(C, Y)|Acc]), N is M+1.
countGrades(_, 0, _).

c(G, N) :- countGrades(G, N, []).