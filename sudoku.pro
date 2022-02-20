:- use_module(library(clpfd)).
solver(Rows) :-
length(Rows, 9),
maplist(same_length(Rows), Rows),
append(Rows, Vs),
Vs ins 1..9,
maplist(all_distinct, Rows),
transpose(Rows, Columns),
maplist(all_distinct, Columns),
Rows = [A,B,C,D,E,F,G,H,I],
squares(A, B, C),
squares(D, E, F),
squares(G, H, I),
maplist(labeling([ff]), Rows).

squares([], [], []).
squares( [A, B, C | Ss1],
[D, E, F | Ss2],
[G, H, I | Ss3]) :-
all_distinct([A, B, C, D, E, F, G, H, I]),
squares(Ss1, Ss2, Ss3).

puzzle(1, [[8,9,4,_,_,_,_,_,_],
[_,2,_,_,_,_,_,_,_],
[_,_,_,_,6,_,_,_,5],
[_,_,_,_,_,5,9,_,1],
[_,7,_,_,1,_,_,_,_],
[_,_,2,_,_,8,_,_,_],
[7,6,_,_,_,_,3,_,2],
[_,_,_,_,5,7,_,_,_],
[_,_,3,9,_,_,_,4,_]]).

puzzle(2, [[_,4,_,9,_,_,_,5,_],
[2,_,_,_,_,_,_,4,_],
[1,9,_,_,8,_,7,_,_],
[5,_,_,_,_,_,1,_,_],
[_,_,7,_,6,_,_,_,3],
[_,_,_,_,3,_,8,9,_],
[_,8,_,3,4,_,_,6,_],
[3,_,_,2,_,8,_,_,_],
[_,_,_,_,_,_,_,_,_]]).
