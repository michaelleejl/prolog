male(m).
male(f).
male(s1).
male(s2).
female(d).
female(w).

child(d, w).
spouse(m, w).
spouse(w, m).
child(m, f).
spouse(d, f).
spouse(f, d).
child(s1, w).
child(s1, m).
child(s2, f).
child(s2, d).

husband(A, B) :- spouse(A, B), male(A).
wife(A, B) :- spouse(A, B), female(A).

parent(A, B) :- child(B, A).
parent(A, B) :- spouse(A, C), parent(C,B).
son(A, B) :- child(A, B), male(A).
daughter(A, B) :- child(A, B), female(A).

sibling(A, B) :- parent(C, A), parent(C,B).
brother(A, B) :- sibling(A, B), male(A).
sister(A, B) :- sibling(A, B), female(A).

father(A, B) :- parent(A, B), male(A).
father(A, B) :- parent(C, B), husband(A, C).

mother(A, B) :- parent(A, B), female(A).
mother(A, B) :- parent(C, B), wife(A, C).

fatherInLaw(A, B) :- father(A, C), spouse(B, C).
sonInLaw(A, B) :- husband(A, C), daughter(C, B).
brotherInLaw(A, B) :- sibling(A, C), husband(B, C).
uncle(A, B) :- brother(A, C), parent(C,B).

grandfather(A, B) :- male(A), parent(A, C), parent(C, B).

widow(A, B) :- spouse(A, B), female(A), dead(B).
