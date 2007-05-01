/********************
 * JIPKernel
 *
 * 09/19/2002
 *
 * Copyright (C) 2002 Ugo Chirico. All Rights Reserved
 *
 * This is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 **************************/
    
/* comparation operators
***************************/

X @> Y :-
    compare(>, X, Y).

X @< Y :-
    compare(<, X, Y).

X @= Y :-
    compare(=, X, Y).

X @>= Y :-
    compare(>, X, Y);
    compare(=, X, Y).

X @=< Y :-
    compare(<, X, Y);
    compare(=, X, Y).

X >= Y:-
    X > Y ; X == Y.
    
X =< Y:-
    X < Y ; X == Y.
    
X =\= Y :-
    X =:= Y,
    !,
    fail.
    
X =\= Y.

X \== Y :-
    X == Y,
    !,
    fail.
    
X \== Y.

X \= Y :-
    X = Y,
    !,
    fail.
    
X \= Y.


/* general purpose
*********************/

!].

append([], Ys, Ys).

append([X|Xs], Ys, [X|Zs]):-
    append(Xs, Ys, Zs).

X -> Y:-
    call(X),
    !,
    call(Y).

ms(Call, Ms):-
    time(Ms1),
    call(Call),
    time(Ms2),
    Ms is Ms2 - Ms1.

not Call:-
    call(Call),
    !,
    fail.

not Call.

\+ Call:-
    call(Call),
    !,
    fail.
    
\+ Call.

one(X):-
   X,
   !.

once(X):-
   X,
   !.

false:-fail.

otherwise.

repeat.

repeat:-
    repeat.

call(X):-
    X.

;(X, Y):-
    X.
    
;(X, Y):-
    Y.
    
X ^ Y:-
    Y.

tab(N):-
    repeat(N),
    write(' '),
    fail.

tab(_).

time( Year, Month, Day, Hour, Minute, Second, Millisecond ):-
    date(Day, Month, Year),
    time(Hour, Minute, Second, Millisecond).

remove(X, [], []).

remove(X, [X|XS], XS).

remove(X, [Y|XS], [Y|ZS]):-
   remove(X, XS, ZS).

removeall(X, [], []).

removeall(X, XS, ZS):-
   remove(X, XS, Z1S),
   removeall(X, Z1S, ZS).
   
removeall(_, XS, XS).

abolish(Name, Arity):-
    name(Name, CName),
    number_chars(Arity , CArity),
    append(CName, [47|CArity], CFun),
    name(Fun, CFun),
    abolish(Fun).
    
retractone(X):-
    retract(X),
    !.

retractall(X):-
    (retract(X), fail) ; !.
    
expand_term(X, X).

load_files([]):-!.

load_files([X|Rest]):-
    load(X),
    load_files(Rest).
    
load_files(X):-
    load(X).
    
put(X):-
    char(X),
    atom_chars(Y, [X]),
    write(Y).
    
put([X|_]):-
    char(X),
    atom_chars(Y, [X]),
    write(Y).

member(X, [X|Xs]).

member(X, [Y|Ys]):-
    member(X,Ys).

member(X, [X|Xs], 1).

member(X, [Y|Ys], N):-
    member(X, Ys, N1),
    N is N1 + 1.

    
/***************************/
/* type checking           */
/***************************/

atomic(X):-
    (atom(X), !) ; (number(X), !).

callable(X):-
    (atom(X), !) ; (functor(X), !).
    
nonvar(X):-
    \+ var(X).
    
simple(X):-
    (atomic(X),!) ; (var(X), !).

lst([]):-!.

lst(X):-
    cons(X),
    !.
    
nil([]).

/* conversion
**************************/

atom_chars(Name, List):-
    (atom(Name) ; var(Name)),
    name(Name, List).
    
number_chars(Num, List):-
    (number(Num) ; var(Num)),
    name(Num, List).
    






    
