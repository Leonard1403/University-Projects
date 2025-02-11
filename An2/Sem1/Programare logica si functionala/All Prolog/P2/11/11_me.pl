%a) Se da o lista de numere intregi. Se cere sa se scrie de 2 ori in
% lista fiecare numar prim.
%a----------------------------------------------------------


%prim(Nr,I)
prim(Nr):- prim(Nr,2).
prim(Nr,_):-
    Nr =:= 2,
    !.
prim(Nr,_):-
    Nr =:= 3,
    !.
prim(Nr,I):-
    I < Nr,
    Nr2 is Nr mod I,
    Nr2 \== 0,
    !,
    I2 is I + 1,
    %write('intrat'),nl,
    prim(Nr,I2).
prim(Nr,I):-
    Nr \== 1,
    I >= Nr,
    %write('intrat'),
    !.

dubluPrim([],[]):-!.
dubluPrim([H|T],[H,H|T2]):-
    prim(H),
    !,
    dubluPrim(T,T2).
dubluPrim([H|T],[H|T2]):-
    dubluPrim(T,T2).


% b) Se da o lista eterogena, formata din numere intregi si liste de
% numere intregi. Se cere ca in fiecare sublista sa se scrie de 2 ori
% fiecare numar prim. De ex:
%[1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5] =>
%[1, [2, 2, 3, 3], 4, 5, [1, 4, 6], 3, [1, 3, 3, 7, 7, 9, 10], 5]
%b----------------------------------------------------

sublistaDubluPrim([],[]):-!.
sublistaDubluPrim([H|T],[Val|T2]):-
    is_list(H),
    !,
    dubluPrim(H,Val),
    sublistaDubluPrim(T,T2).
sublistaDubluPrim([H|T],[H|T2]):-
    sublistaDubluPrim(T,T2).

