%!example database

father(terach, nachor).
father(terach, haran).
father(terach, abraham).
father(abraham, isaac).
father(haran, lot).
father(haran, milcah).
father(haran, yiscah).

mother(sarah, isaac).

male(terach).
male(abraham).
male(nachor).
male(haran).
male(isaac).
male(lot).

female(sarah).
female(milcah).
female(yiscah).

/******************************************************************/
%! basic queries

%! 		male(terach).
%!		male(X).


/******************************************************************/
%! conjuntive queries and shared variables

%!		father(terach,X), father(X, Y)


%!  EXAMPLE  - listar los hijos de haran y luego listar las hijas de haran

%!		father(haran, X), male(X).


/******************************************************************/
%! Rules

		son(X,Y):- father(Y,X), male(X).

		grandFather(X,Y):- father(X,Z), father(Z,Y), male(X).



%! que pasa con la relacion de hijo cuando se trata de la relacion madre, hace falta agregar

		son(X,Y):- mother(Y,X), male(X).

%!  de igual forma podemos crear una relacion de abuelo (abuelo o abuela) agregando las siguientes reglas

		grandParent(X,Y) :- father(X,Z), father(Z,Y).
		grandParent(X,Y) :- father(X,Z), mother(Z,Y).
		grandParent(X,Y) :- mother(X,Z), father(Z,Y).
		grandParent(X,Y) :- mother(X,Z), mother(Z,Y).

%!	Una forma mas simple de representar la relacion abuelo anterior es como sigue
		
		parent(X,Y) :- father(X,Y).
		parent(X,Y)	:- mother(X,Y).
		
%! 	asi entonces modificamos las reglas de son y grandParent como sigue
		
		son(X,Y) :- parent(Y,X), male(X).
		grandParent(X,Y) :- parent(X,Z), parent(Z,Y).


%!	EJERCICIO		DEFINIR LA RELACION HERMANO

		%!		brother(A,B) :- parent(Pa, A), parent(Pa, B), male(A).
		
		%! El problema es que la regla anterior permite queries como la que sigue
		
		%! 		brother(nachor, nachor).
		
		%! por lo tanto es necesario agregar el operador diferente
				brother(A,B) :- parent(Pa, A), parent(Pa, B), male(A), A \= B.
				
%! Recursive Rules
	
	%! Ahora definamos algunas reglas para bisabuelo y tatarabuelo
	
		%!	greatGrandParent(A,D) :- parent(A, S), grandParent(S, D).
		%! 	greatgreatGrandParent(A,D) :- parent(A, S), greatGrandParent(S, D).
		

	
	%! Las reglas anteriores se pueden generalizar si agregamos una regla recursiva
		
		ancestor(A, D) :- parent(A, D).
		ancestor(A, D) :- parent(A, S), ancestor(S,D).

		
	%! Otra forma recursiva de generalizar las reglas anteriores es:

	%!	ancestor(A, D) :- parent(A, D).
	%!	ancestor(A, D) :- ancestor(A, S), ancestor(S,D).
		
		
		
word(astante,  a,s,t,a,n,t,e).
word(astoria,  a,s,t,o,r,i,a).
word(baratto,  b,a,r,a,t,t,o).
word(cobalto,  c,o,b,a,l,t,o).
word(pistola,  p,i,s,t,o,l,a).
word(statale,  s,t,a,t,a,l,e).

crossword(V1,V2,V3,H1,H2,H3):- word(V1, V11, V12, V13, V14, V15, V16, V17),
                               word(V2, V21, V22, V23, V24, V25, V26, V27),
                               word(V3, V31, V32, V33, V34, V35, V36, V37),
                               word(H1, H11, V12, H13, V22, H15, V32, H17),
                               word(H2, H21, V14, H23, V24, H25, V34, H27),
                               word(H3, H31, V16, H33, V26, H35, V36, H37), 
							   V1 \= H1.
							   

palabra(camion, c,a,m,i,o,n).
palabra(media, m,e,d,i,a,_).
palabra(mango, m,a,n,g,o,_).
palabra(mora, m,o,r,a,_,_).
palabra(mesa, m,e,s,a,_,_).
palabra(cama, c,a,m,a,_,_).

crucigrama(H1,H2,V1, V2, V3, V4):- 	palabra(H1, _, H12, _,H14,_,H16),
									palabra(H2, _, H22, _, H24, _, _),
									palabra(V1, _,H12, _,_,_,_),
									palabra(V2, _,_, _,H14,_,_),
									palabra(V3, _,_, H16,_,H22,_),
									palabra(V4, _,_, _,H24,_,_),
									H1 \= H2,							
									H1 \= V1, H1 \= V2, H1 \= V3, H1 \= V4, 
									H2 \= V1, H2 \= V2, H2 \= V3, H2 \= V4,
									V1 \= V2, V1 \= V3, V1 \= V4,
									V2 \= V3, V2 \= V4, 
									V3 \= V4.


%! Definición recursiva de función sucesor y numeros naturales

	natural(0, 0).
	natural(s(X), N) :- natural(X,S), N is S+1.

	
%! Tamanio de una lista
	dlength([], 0).
	dlength([H|T],N) :- dlength(T, S), N is S+1. 
	

%! determine if a list is empty or not
	
	isEmpty([], true).
	isEmpty([_|_], false).
	
	
%! Last element in a list
	last([H|[]],H).
	last([H|T], Sol) :- last(T, Sol).
	
%! append an element to a list
	
	mAppend([], L, L).
	mAppend([H|T], L, [H|R]) :- mAppend(T, L, R).
	

%! Delete an element from a list

	delete([], X, []).
	delete([H|T], H, Ys) :- delete(T, H, Ys).
	delete([H|T], Z, [H|Ys]) :- H\=Z, delete(T, Z, Ys).
	
%! Insert element in a list in specific position
						
%! Imprir la posición en la lista en la que se encuentra
%! la coincidencia
									
	inList(X, [X|_], Cont, Z):- Z is Cont.
	inList(X, [_|T], Cont, Z):- inList(X, T, Cont+1, Z).
	
	nat(0).
	

	
	




	


									