%a) Sa se determine pozitiile elementului maxim dintr-o lista liniara.
% De ex:
%poz([10,14,12,13,14], L) va produce L = [2,5].
%a-----------------------------------------------

%(i,o)
maxim([],0):-!.
maxim([H|T],Rezultat):-
    maxim(T,Rezultat),
    H < Rezultat,
    !.
maxim([H|_],H).


%(Lista,Pozitie,Rezultat)
listaPozitii([],_,_,[]):-!.
listaPozitii([H|T],Element,Pozitie,[Pozitie|T1]):-
    H =:= Element,
    !,
    Pozitie1 is Pozitie + 1,
    listaPozitii(T,Element,Pozitie1,T1).
listaPozitii([_|T],Element,Pozitie,T1):-
    Pozitie1 is Pozitie + 1,
    listaPozitii(T,Element,Pozitie1,T1).

start([H|T],Rez):-
    maxim([H|T],RezMaxim),
    listaPozitii([H|T],RezMaxim,1,Rez).

% b) Se da o lista eterogena, formata din numere intregi si liste de
% numere intregi. Sa se inlocuiasca fiecare sublista cu pozitiile
% elementului maxim din sublista respectiva. De ex:
%[1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
%[1, [2], [1, 3], 3, 6, [2], 5, [1, 2, 3], 7]
%b----------------------------------------------

pozMaximSublista([],[]):-!.
pozMaximSublista([H|T],[Var|T1]):-
    is_list(H),
    !,
    start(H,Var),
    pozMaximSublista(T,T1).
pozMaximSublista([H|T],[H|T1]):-
    pozMaximSublista(T,T1).
