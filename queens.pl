take([H|T], H, T).
take([H|T], R, [H|S]) :- take(T, R, S).

perm([], []).
perm(L, [H|T]) :- take(L, H, R), perm(R, T).

downDiagonal([], _).
downDiagonal([H|T], N) :- N =\= H, M is N-1, downDiagonal(T, M).

upDiagonal([], _).
upDiagonal([H|T], N) :- N =\= H, M is N+1, upDiagonal(T, M).

checkDiagonal(T, N) :- M1 is N-1, M2 is N+1, downDiagonal(T,M1), 
upDiagonal(T,M2).

freeDiagonal([]).
freeDiagonal([H|T]) :- checkDiagonal(T,H), freeDiagonal(T).

append([], A, A).
append([H|T], A, [H|B]) :- append(T, A, B).

genList(0, []).
genList(N, [N|T]) :- N>0, M is N-1, genList(M, T).
queens(N, P) :- genList(N,L), perm(L, P), freeDiagonal(P).
