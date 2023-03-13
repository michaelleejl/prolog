% nil-[root,1,2]+(nil-[child,4]+nil)

append([],A,A).  
append([H|T],A,[H|R]) :- append(T,A,R). 

%preorder(+Tree, -ValueList) succeeds if LV is the value list representation of the left subtree, RV is the value list representation of the right subtree,
%N is the value list representation of the current node, and V is LV @ [N] @ RV.
preorder(nil, []).
preorder(L-N+R, V) :- preorder(L, LV), preorder(R, RV), append(LV, [N|RV], V).

appenddl(A/B, B/C, A/C).
preorderdl2(nil, A/A).
preorderdl2(L-N+R, [N|LV]/RP) :- preorderdl2(L, LV/RV), preorderdl2(R, RV/RP).
preorderdl(L-N+R, V) :- preorderdl2(L-N+R, V/[]).