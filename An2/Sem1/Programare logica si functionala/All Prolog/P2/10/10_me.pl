%a) Se da o lista de numere intregi. Se cere sa se adauge in lista dupa
% 1-ul element, al 3-lea element, al 7-lea elemen, al 15-lea element � o
% valoare data e.
%a--------------------------------------------------------

%(i,i,i,io)
adaugaLista([],_,_,_,[]):-!.
adaugaLista([H|T],Valoare,Pozitie,Calc,[H,Valoare|T2]):-
    Pozitie =:= Calc,
    !,
    Calc2 is Calc*2 + 1,
    Pozitie2 is Pozitie + 1,
    adaugaLista(T,Valoare,Pozitie2,Calc2,T2).
adaugaLista([H|T],Valoare,Pozitie,Calc,[H|T2]):-
    Pozitie2 is Pozitie + 1,
    adaugaLista(T,Valoare,Pozitie2,Calc,T2).


% b) Se da o lista eterogena, formata din numere intregi si liste de
% numere intregi. Lista incepe cu un numar si nu sunt 2 elemente
% consecutive care sunt liste. Se cere ca in fiecare sublista sa se
% adauge dupa 1-ul, al 3-lea, al 7-lea� element valoarea care se gaseste
% inainte de sublista in lista eterogena. De ex:
%[1, [2, 3], 7, [4, 1, 4], 3, 6, [7, 5, 1, 3, 9, 8, 2, 7], 5] =>
% [1, [2, 1, 3], 7, [4, 7, 1, 4, 7], 3, 6, [7, 6, 5, 1, 6, 3, 9, 8, 2, 6,
% 7], 5].
%b------------------------------------------------------

addSublista([],_,[]):-!.
addSublista([H|T],Last,[Val|T2]):-
    is_list(H),
    !,
    adaugaLista(H,Last,1,1,Val),
    addSublista(T,Last,T2).
addSublista([H|T],_,[H|T2]):-
    addSublista(T,H,T2).
