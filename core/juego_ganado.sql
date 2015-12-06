CREATE OR REPLACE FUNCTION juegoGanado(pidJuego IN number)
	RETURN Boolean
IS
	x number := 1;
	y number := 3;
BEGIN
	/*Revisa si el usuario ya ha ganado el juego*/
	FOR i IN 1..3 LOOP
		FOR j IN 1..3 LOOP
			FOR casilla IN (select * from casillas where fila = j and idJuego = pidJuego and
								matriz between x and y order by matriz, fila, columna) LOOP
				IF casilla.numero = 0 THEN
					RETURN FALSE;
				END IF;
			END LOOP;
		END LOOP;
		x := y + 1;
		y := y + 3;
	END LOOP;
	RETURN TRUE;
END;
/