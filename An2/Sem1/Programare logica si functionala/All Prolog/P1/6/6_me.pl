%a. Sa se scrie un predicat care elimina dintr-o lista toate elementele
% care
%se repeta (ex: l=[1,2,1,4,1,3,4] => l=[2,3])
%a-------------------------------------------

%(i,i)
%Gaseste nr de aparitii a unui elem in lista
apare([],_,0):-!.
apare([H|T],Elem,Cont):-
    H =:= Elem,
    !,
    apare(T,Elem,Cont2),
    Cont is Cont2 + 1.
apare([_|T],Elem,Cont):-
    apare(T,Elem,Cont).

%(i,i,o)
%Elimina elementele care se repeta
eliminaLista(_,[],[]):-!.
eliminaLista([H|T],[H2|T2],[H2|T1]):-
    apare([H|T],H2,Val),
    Val =:= 1,
    !,
    eliminaLista([H|T],T2,T1).
eliminaLista([H|T],[_|T2],T1):-
    eliminaLista([H|T],T2,T1).

%(i,o)
start([H|T],Rez):-
    eliminaLista([H|T],[H|T],Rez).

% B. Sa Se Elimine toate aparitiile elementului maxim dintr-o lista de
% numere
%intregi.
%b----------------------------------------------

%(i,o)
maxim([X],X):-!.
maxim([H|T],Rez):-
    maxim(T,Rez),
    Rez >= H,
    !.
maxim([H|T],H):-
    maxim(T,_).
    %Rez < H.

%(i,i,o)
eliminaElement([],_,[]):-!.
eliminaElement([H|T],Element,[H|T2]):-
    not(H =:= Element),
    !,
    eliminaElement(T,Element,T2).
eliminaElement([_|T],Element,T2):-
    eliminaElement(T,Element,T2).

%(i,o)
start2([H|T],Rez):-
    maxim([H|T],Rez_Maxim),
    %print(Rez_Maxim),
    !,
    eliminaElement([H|T],Rez_Maxim,Rez).
