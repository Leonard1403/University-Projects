%a. Sa se scrie un predicat care sterge toate aparitiile unui anumit
% atom
%dintr-o lista.
%a---------------------------------------------

%Lista , Element , Rezultat
%(i,i,o)

eliminaAtom([],_,[]):-
    !.
eliminaAtom([H|T],Val,T1):-
    H is Val,
    !,
    eliminaAtom(T,Val,T1).
eliminaAtom([H|T],Val,[H|T1]):-
    eliminaAtom(T,Val,T1).



% b. Definiti un predicat care, dintr-o lista de atomi, produce o lista
% de
%perechi (atom n), unde atom apare in lista initiala de n ori. De ex:
% numar([1, 2, 1, 2, 1, 3, 1], X) va produce X = [[1, 4], [2, 2], [3,
% 1]].

%b------------------------------------------
%(i,i,o)
nrAparitii([],_,0).
nrAparitii([H|T],Val,Nr):-
    H =:= Val,
    !,
    nrAparitii(T,Val,Nr2),
    Nr is Nr2 + 1.
nrAparitii([_|T],Val,Nr):-
    nrAparitii(T,Val,Nr).

%(i,i,o)
adaugaListaFinal([],Lista,[Lista]):-!.
adaugaListaFinal([H|T],Lista,[H|T1]):-
    adaugaListaFinal(T,Lista,T1).

%Lista
%(i,i,o)
start([],Lista,Lista):-
    !.
    %print(Lista).
start([H|T],Lista,Rez):-
    nrAparitii([H|T],H,Rez1),
    eliminaAtom([H|T],H,Rez2),
    adaugaListaFinal(Lista,[H,Rez1],Lista2),
    %print(H),
    %write(' '),
    %print(Rez1),
    %write(' '),
    %print(Rez2),
    %write('\n'),
    %Lista is Lista2,
    start(Rez2,Lista2,Rez).

%(i,o)
start_aux([H|T],Rez):-
    start([H|T],[],Rez).






