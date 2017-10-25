
(defglobal ?*nod-gen* = 0)

(deffacts Grafo
	( Camino Origen a Destino b Coste 10 Tipo ambos )
	( Camino Origen a Destino c Coste 8 Tipo pie )
	( Camino Origen a Destino e Coste 10 Tipo ambos )

	( Camino Origen b Destino a Coste 10 Tipo ambos)
	( Camino Origen b Destino c Coste 5 Tipo pie)	
	( Camino Origen b Destino f Coste 6 Tipo pie)
	
	( Camino Origen c Destino a Coste 8 Tipo pie)
	( Camino Origen c Destino b Coste 5 Tipo pie)
	( Camino Origen c Destino d Coste 6 Tipo pie)	
	( Camino Origen c Destino g Coste 6 Tipo pie)
	( Camino Origen c Destino h Coste 6 Tipo pie)
	
	( Camino Origen d Destino c Coste 6 Tipo pie)
	( Camino Origen d Destino h Coste 14 Tipo ambos)
	
	( Camino Origen e Destino a Coste 10 Tipo ambos)
	( Camino Origen e Destino i Coste 20 Tipo pie)
	( Camino Origen e Destino j Coste 9 Tipo ambos)
	
	( Camino Origen f Destino b Coste 6 Tipo pie)	
	( Camino Origen f Destino k Coste 10 Tipo pie)
	( Camino Origen f Destino l Coste 6 Tipo pie)
	
	( Camino Origen g Destino c Coste 6 Tipo pie)	
	( Camino Origen g Destino h Coste 8 Tipo pie)	
	( Camino Origen g Destino l Coste 9 Tipo pie)
	( Camino Origen g Destino m Coste 12 Tipo pie)
	
	( Camino Origen h Destino d Coste 14 Tipo ambos)
	( Camino Origen h Destino g Coste 8 Tipo pie)
	( Camino Origen h Destino i Coste 12 Tipo ambos)
	( Camino Origen h Destino c Coste 6 Tipo pie)
	
	( Camino Origen i Destino e Coste 20 Tipo pie)
	( Camino Origen i Destino h Coste 12 Tipo ambos)
	( Camino Origen i Destino o Coste 2 Tipo pie)
	
	( Camino Origen j Destino o Coste 7 Tipo ambos)
	( Camino Origen j Destino e Coste 9 Tipo ambos)
	
	( Camino Origen k Destino l Coste 2 Tipo ambos)
	( Camino Origen k Destino f Coste 10 Tipo pie)
	
	( Camino Origen l Destino p Coste 6 Tipo ambos)
	( Camino Origen l Destino m Coste 7 Tipo ambos)
	( Camino Origen l Destino g Coste 9 Tipo pie)
	( Camino Origen l Destino k Coste 2 Tipo ambos)
	( Camino Origen l Destino f Coste 6 Tipo pie)
	
	( Camino Origen m Destino q Coste 2 Tipo pie)
	( Camino Origen m Destino g Coste 12 Tipo pie)
	( Camino Origen m Destino l Coste 7 Tipo ambos)
	
	( Camino Origen n Destino q Coste 6 Tipo pie)
	( Camino Origen n Destino o Coste 8 Tipo ambos)
	
	( Camino Origen o Destino n Coste 8 Tipo ambos)
	( Camino Origen o Destino j Coste 7 Tipo ambos)
	( Camino Origen o Destino i Coste 2 Tipo pie)
	
	( Camino Origen p Destino r Coste 4 Tipo ambos)
	( Camino Origen p Destino q Coste 2 Tipo pie)
	( Camino Origen p Destino l Coste 6 Tipo ambos)
	
	( Camino Origen q Destino r Coste 3 Tipo pie)
	( Camino Origen q Destino m Coste 2 Tipo pie)
	( Camino Origen q Destino n Coste 6 Tipo pie)
	( Camino Origen q Destino p Coste 2 Tipo pie)

	( Camino Origen r Destino p Coste 4 Tipo ambos)
	( Camino Origen r Destino q Coste 3 Tipo pie)
	
	( Nodo Letra a Tipo bicicleta Barrio 1 )
	
	( Nodo Letra b Tipo bicicleta Barrio 2 )
	( Nodo Letra c Tipo normal Barrio 2 )
	( Nodo Letra d Tipo normal Barrio 2 )
	( Nodo Letra e Tipo normal Barrio 2 )
	( Nodo Letra j Tipo bicicleta Barrio 2 )
	
	( Nodo Letra f Tipo normal Barrio 3 )
    	( Nodo Letra g Tipo normal Barrio 3 )
	( Nodo Letra h Tipo bicicleta Barrio 3 )
	( Nodo Letra i Tipo normal Barrio 3 )
	( Nodo Letra o Tipo normal Barrio 3 )

	( Nodo Letra k Tipo bicicleta Barrio 4 )
	( Nodo Letra l Tipo normal Barrio 4 )
	( Nodo Letra m Tipo bicicleta Barrio 4 )
	( Nodo Letra n Tipo bicicleta Barrio 4 )

    	( Nodo Letra p Tipo normal Barrio 5 )
	( Nodo Letra q Tipo normal Barrio 5 )

	( Nodo Letra r Tipo bicicleta Barrio 6 )
	
	( Recorrido Actual a Destino o Bici false CosteTotal 0 Nivel 0)
)

(defrule PieXaY
	;(declare (salience 70))
	(Recorrido Actual ?ori Destino ?dest Bici false CosteTotal ?costet Nivel ?n)
	(Camino Origen ?ori Destino ?d Coste ?coste Tipo ?t)
	(profundidad-maxima ?prof)
	(test (< ?n ?prof))
 => 
	(assert(Recorrido Actual ?d Destino ?dest Bici false CosteTotal (+ ?costet ?coste) Nivel (+ ?n 1)))
	(bind ?*nod-gen* (+ ?*nod-gen* 1))
)

(defrule BiciXaY
	;(declare (salience 90))
	( Recorrido Actual ?ori Destino ?dest Bici true CosteTotal ?costet Nivel ?n )
	( Camino Origen ?ori Destino ?d Coste ?coste Tipo ambos )
	(profundidad-maxima ?prof)
	(test (< ?n ?prof))
	;(test (neq ?dest ?d))
=>
	(assert(Recorrido Actual ?d Destino ?dest Bici true CosteTotal (+ ?costet (div ?coste 2)) Nivel (+ ?n 1)))
	(bind ?*nod-gen* (+ ?*nod-gen* 1))
)

(defrule cogerBici
	;(declare (salience 50))
	( Recorrido Actual ?ori $?a Bici false CosteTotal ?cost Nivel ?n )
	( Nodo Letra ?ori Tipo bicicleta $?)
	(profundidad-maxima ?prof)
	(test (< ?n ?prof))
=>
	(assert (Recorrido Actual ?ori $?a Bici true CosteTotal (+ ?cost 1) Nivel (+ ?n 1)))
	(bind ?*nod-gen* (+ ?*nod-gen* 1))
)

(defrule dejarBici
	;(declare (salience 40))
	( Recorrido Actual ?ori $?a Bici true CosteTotal ?cost Nivel ?n )
	( Nodo Letra ?ori Tipo bicicleta $?)
	(profundidad-maxima ?prof)
	(test (< ?n ?prof))
=>
	(assert (Recorrido Actual ?ori $?a Bici false CosteTotal (+ ?cost 1) Nivel (+ ?n 1)))
	(bind ?*nod-gen* (+ ?*nod-gen* 1))
)

(defrule parada
	(declare (salience 100))
	( Recorrido Actual ?act Destino ?act Bici false CosteTotal ?cost Nivel ?n )
=>
	(printout t "LLEGO AL FINALCON COSTE  " ?cost crlf)
	(printout t "SOLUCION ENCONTRADA EN EL NIVEL " ?n crlf)
	(printout t "NUMERO DE NODOS EXPANDIDOS O REGLAS DISPARADAS " ?*nod-gen* crlf)
	(halt)
)

(deffunction inicio ()
    (reset)
	(printout t "Profundidad Maxima:= " )
	(bind ?prof (read))
	(printout t "Tipo de Busqueda " crlf "    1.- Anchura" crlf "    2.- Profundidad" crlf )
	(bind ?a (read))
	(if (= ?a 1)
	       then    (set-strategy breadth)
	       else   (set-strategy depth))
    (printout t " Ejecuta run para poner en marcha el programa " crlf)
	(assert (profundidad-maxima ?prof))
)
