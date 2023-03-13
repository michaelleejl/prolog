solve1([S,E,N,D],[M,O,R,E],[M,O,N,E,Y], Base, C) :-
    Var = [S,E,N,D,M,O,R,Y],
    B is Base-1,
    Var ins 0..B, all_different(Var),
    B1 is Base, B2 is Base*Base, B3 is Base*Base*Base, B4 is Base*Base*Base*Base,
    B3*S + B2*E + B1*N + D +
    B3*M + B2*O + B1*R + E #=
    B4*M + B3*O + B2*N + B1*E + Y,
    findall(Var, labeling([],Var), Vl),
    length(Vl, C).