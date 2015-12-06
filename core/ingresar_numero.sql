DECLARE
	pmatriz number(1) := &matriz;
	pcolumna number(1) := &columna; 
	pfila number(1) := &fila;
	pnumero number(1) := &numero;
BEGIN
	IF numerovalido(pmatriz, pfila, pcolumna,pnumero,:juego_actual) THEN
		UPDATE casillas
		set numero = pnumero
		where matriz = pmatriz and columna = pcolumna
		and fila = pfila;
	ELSE
		dbms_output.put_line('No se ha podido ingresar el numero, 
			intente de nuevo');
	END IF;

	IF juegoganado(:juego_actual) THEN 
		dbms_output.put_line('Ganaste el juego mierda!');
	END IF;
END;
/





