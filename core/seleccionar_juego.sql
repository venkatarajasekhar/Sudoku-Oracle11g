DECLARE
	juego number(2) := '&matriz';
	cant number(5);
BEGIN
	cant := cantJuegos();
	IF (juego <= cant) THEN
		dbms_output.put_line('Juego seleccionado es el numero ' || to_char(juego));
		mostrarJuego(juego);
		:juego_actual := juego;
	ELSE
		dbms_output.put_line('El juego no existe');
	END IF;
END;
/