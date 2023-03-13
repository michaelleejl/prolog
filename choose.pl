cons(A, L, [A|L]).

choose(0, L, [], L).
choose(N, [H|T], R, S) :- N > 0, M is N-1, choose(M, T, R1, S), cons(H, R1, R).
choose(N, [H|T], R, S) :- N > 0, choose(N, T, R, S1), cons(H, S1, S).