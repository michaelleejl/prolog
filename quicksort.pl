append([],A,A).  
append([H|T],A,[H|R]) :- append(T,A,R). 
cons(A, L, [A|L]).

split([], _, [], []).
split([H|T], A, [H|L], R) :- H =< A, split(T, A, L, R).
split([H|T], A, L, [H|R]) :- H > A, split(T, A, L, R).

qsort([], []).
qsort([H|T], B) :- split(T, H, L, R), qsort(L, L1), qsort(R, R1), append(L1, [H], L2), append(L2, R1, B).

split2([], _, [], [], []).
split2([H|T], A, [H|L], M, R) :- H < A, split2(T, A, L, M, R).
split2([H|T], A, L, [H|M], R) :- H = A, split2(T, A, L, M, R).
split2([H|T], A, L, M, [H|R]) :- H > A, split2(T, A, L, M, R).


qsort2([], []).
qsort2([H|T], B) :- split2(T, H, L, M, R), qsort2(L, L1), qsort2(R, R1), cons(H, M, M1), append(L1, M1, L2), append(L2, R1, B).


qsort3([], A-A).
qsort3([H|T], S-SP) :- split(T, H, L, R), qsort3(L, S-[H|RS]), qsort3(R, RS-SP).
qsortdl(L, SL) :- qsort3(L, SL-[]).