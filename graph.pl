edge(a, b).
edge(b, a).
edge(b, c).

%search
path(A, A).
path(A, B) :- edge(A, C), path(C, B).

%search with cycles
cpath(A, A, _).
cpath(A, B, Visited) :- edge(A, C), not(member(C, Visited)), cpath(C, B, [C|Visited]).

%search with a log
lpath(A, A, []).
lpath(A, B, [A-C|Log]) :- edge(A, C), lpath(C, B, Log).

%search with cycles and a log
clpath(A, A, [], _).
clpath(A, B, [A-C|Log], Visited) :- edge(A, C), not(member(C, Visited)), clpath(C, B, Log, [C|Visited]).