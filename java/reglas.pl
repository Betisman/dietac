/* aux lo uso para que el pr@l@g "reconozca" las funciones */
excedido(aux).
limitado(aux).
prohibido(aux).
insuficiente(aux).
preferente(aux).

/* pasrticularidades */
limitado(a).

/* reglas */
noApto(X):-not((not(prohibido(X)),not(excedido(X)))).
/*
aux(X):-not(prohibido(X)),not(excedido(X)).
noApto(X):-not(aux(X)).
*/
prioritario(X):-not(noApto(X)),insuficiente(X).
muyRecomendado(X):-not(noApto(X)),not(prioritario(X)),preferente(X).
recomendado(X):-not(noApto(X)),not(prioritario(X)),not(muyRecomendado(X)),not(limitado(X)).
apto(X):-not(noApto(X)),not(prioritario(X)),not(muyRecomendado(X)),not(recomendado(X)).
