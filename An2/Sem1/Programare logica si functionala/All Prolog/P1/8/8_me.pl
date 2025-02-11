%a. Sa se scrie un predicat care testeaza daca o lista este multime.
%a-------------------------------------

%(i,i,o)
apartine([],_,0):-!.
apartine([H|T],Element,Rez):-
    apartine(T,Element,Rez2),
    H =:= Element,
    !,
    Rez is Rez2 + 1.
apartine([_|T],Element,Rez):-
    apartine(T,Element,Rez).


%(i,i)
listaMultime([],1):-!.
listaMultime([H|T],1):-
    apartine([H|T],H,Val),
    Val =:= 1,
    !,
    listaMultime(T,1).


% b. Sa se scrie un predicat care elimina primele 3 aparitii ale unui
% element
%intr-o lista. Daca elementul apare mai putin de 3 ori, se va elimina de
%cate ori apare.
%b--------------------------------------

elimina3(Lista,Element,Rezultat):-elimina3(Lista,Element,3,Rezultat).
elimina3(X,_,0,X):-!.
elimina3([],_,_,[]):-!.
elimina3([H|T],Element,N,T2):-
    H =:= Element,
    N2 is N - 1,
    !,
    elimina3(T,Element,N2,T2).
elimina3([H|T],Element,N,[H|T2]):-
    elimina3(T,Element,N,T2).
