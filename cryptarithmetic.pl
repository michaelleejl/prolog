member(A, [H|_]) :- A=H.
member(A, [_|T]) :- member(A, T).

cons(A, L, [A|L]).

solve1([S,E,N,D],[M,O,R,E],[M,O,N,E,Y], Base, Acc, C) :-
    Var = [S,E,N,D,M,O,R,Y],
    B is Base-1,
    Var in 0..B, all_different(Var),
    B4 is B*B*B*B,
    B3 is B*B*B,
    B2 is B*B,
    B3*S + B2*E + B*N + D +
    B3*M + B2*O + B*R + E #=
    B4*M + B3*O + B2*N + B*E + Y,
    S #\= 0, M #\=0,
    labeling([],Var),
    not(member(Var, Acc)),
    !,
    cons(Var, Acc, Acc1),
    solve1([S,E,N,D],[M,O,R,E],[M,O,N,E,Y], Base, Acc1, C1),
    C is C1+1. 

solve1(_,_,_, _, _, 0).

solveCount(Base, C) :- solve1([S,E,N,D],[M,O,R,E],[M,O,N,E,Y], Base, [], C).

len([], 0).
len([_|T], N) :- len(T, M), N is M+1.