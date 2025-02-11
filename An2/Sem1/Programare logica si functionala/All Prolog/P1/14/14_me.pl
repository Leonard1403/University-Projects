%a. Sa se scrie un predicat care testeaza egalitatea a doua multimi,
% fara
%sa se faca apel la diferenta a doua multimi.
%a------------------------------------------

%eliminaListaElement(Lista,Element,Rezultat)
%(i,i,o)
eliminaListaElement([],_,[]).
eliminaListaElement([H|T],Element,[H|T1]):-
    not(H =:= Element),
    eliminaListaElement(T,Element,T1).
eliminaListaElement([_|T],Element,T1):-
    eliminaListaElement(T,Element,T1).

%(i,i)
membru([H|_],H):-!.
membru([_|T],Element):-
    membru(T,Element).

%(i,i)
egalitate(_,[]):-!.
egalitate([H|T],[H1|T1]):-
    membru([H|T],H1),
    egalitate([H|T],T1).

%(i,i)
start([H|T],[H1|T1]):-
    egalitate([H|T],[H1|T1]),
    egalitate([H1|T1],[H|T]).


%b. Definiti un predicat care selecteaza al n-lea element al unei liste.
%b-------------------------------------------

%selecte(Lista,Pozitie,Rezultat)

selectie([H|_],Pozitie,H):-
    Pozitie < 1,
    !.
selectie([H],_,H):-
    !.
selectie([H|_],Pozitie,H):-
    Pozitie =:= 1,
    !.
selectie([_|T],Pozitie,Rezultat):-
    Pozitie1 is Pozitie - 1,
    selectie(T,Pozitie1,Rezultat).
