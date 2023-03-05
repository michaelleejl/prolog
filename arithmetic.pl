prim(1,i).
prim(N,s(R)):- N>1, M is N-1, prim(M,R).
plus(A, i, s(A)).
plus(A, s(B), s(C)) :- plus(A, B, C).
mult(A, i, A).
mult(A, s(B), D) :- mult(A, B, C), plus(A, C, D).
