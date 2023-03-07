cons(A, [], [A]).
cons(A, [H|T], [A|[H|T]]).
append([], A, A).
append([H|T], A, [H|S]) :- append(T, A, S).

flatten([], []).
flatten([[]|Ts], R) :- flatten(Ts, R).
flatten([[H|T]|Ts], R) :- flatten([H|T], H1), flatten(Ts, T1), append(H1, T1, R).
flatten([H|Ts], R) :- flatten(Ts, T1), cons(H, T1, R).

flatten_cut([], []).
flatten_cut([[]|Ts], R) :- !, flatten_cut(Ts, R).
flatten_cut([[H|T]|Ts], R) :- !, flatten_cut([H|T], H1), flatten_cut(Ts, T1), append(H1, T1, R).
flatten_cut([H|Ts], R) :- flatten_cut(Ts, T1), cons(H, T1, R).
