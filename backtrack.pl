take([H|T], H, T).
take([H|T], R, [H|S]) :- take(T, R, S).

append([], A, A).
append([H|T], A, [H|B]) :- append(T, A, B).
