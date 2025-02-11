%a) Intr-o lista L sa se inlocuiasca toate aparitiile unui element E cu
%elementele unei alte liste, L1. De ex: inloc([1,2,1,3,1,4],1,[10,11],X)
%va produce X=[10,11,2,10,11,3,10,11,4].
%a----------------------------------------------

%inlocuire(Lista,Element,Sublitsa,Rezultat)

%(i,i,i,i,o)
inlocuire([],_,_,_,[]):-!.
inlocuire([H|T],Element,Lista1,[],Rezultat):-
    H =:= Element,
    !,
    inlocuire(T,Element,Lista1,Lista1,Rezultat).
inlocuire([H|T],Element,Lista1,[H1|T1],[H1|Rezultat]):-
    H =:= Element,
    !,
    inlocuire([H|T],Element,Lista1,T1,Rezultat).
inlocuire([H|T],Element,Lista1,Lista2,[H|Rezultat]):-
    inlocuire(T,Element,Lista1,Lista2,Rezultat).

%(i,i,i,o)
inlocuire_start([H|T],Element,Lista,X):-
    inlocuire([H|T],Element,Lista,Lista,X).


% b) Se da o lista eterogena, formata din numere intregi si liste de
% numere intregi. In fiecare sublista sa se inlocuiasca toate aparitiile
% primului element din sublista cu o lista data. De ex:
%[1, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] si [11, 11] =>
% [1, [11, 11, 1, 11, 11], 3, 6, [11, 11, 10, 1, 3, 9], 5, [11 11 11 11
% 11 11], 7]
%b----------------------------------------------

%(i,i,o)
%sublistaInlocuire(Lista,Sublista,Rezultat)
primulElement([H|_],H):-!.

sublistaInlocuire([],_,[]):-!.
sublistaInlocuire([H|T],[H1|T1],[Lista|Rezultat]):-
    is_list(H),
    !,
    primulElement(H,El),
    inlocuire_start(H,El,[H1|T1],Lista),
    sublistaInlocuire(T,[H1|T1],Rezultat).
sublistaInlocuire([H|T],[H1|T1],[H|Rezultat]):-
    sublistaInlocuire(T,[H1|T1],Rezultat).

