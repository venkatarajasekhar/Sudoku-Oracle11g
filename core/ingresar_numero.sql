DECLARE
	pmatriz number(1) := &matriz; 
	pfila number(1) := &fila;
	pcolumna number(1) := &columna;
	pnumero number(1) := &numero;
	cambiable number(1);
BEGIN

	
	select casillas.cambiable into cambiable from casillas where matriz = pmatriz 
		and columna = pcolumna and fila = pfila and idJuego = :juego_actual;
		
	/*Revisa si la casilla que se desea cambiar es una casilla inicial*/
	IF cambiable = 0 THEN 
		dbms_output.put_line('No es posible cambiar esta casilla, intente de nuevo');

	ELSIF numerovalido(pmatriz, pfila, pcolumna,pnumero,:juego_actual) THEN
		UPDATE casillas
		set numero = pnumero
		where matriz = pmatriz and columna = pcolumna
		and fila = pfila and idJuego = :juego_actual;
	ELSE
		dbms_output.put_line('No se ha podido ingresar el numero, 
			intente de nuevo');
	END IF;

	IF juegoganado(:juego_actual) THEN 
		dbms_output.put_line('Ganaste el juego!');
	END IF;
	mostrarJuego(:juego_actual);
END;
/






