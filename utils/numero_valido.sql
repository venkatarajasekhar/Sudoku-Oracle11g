CREATE OR REPLACE FUNCTION numeroValido
	(pmatriz IN number, pfila IN number, pcolumna IN number,pnumero IN number,pidJuego IN number)
	RETURN Boolean
IS
BEGIN
	/*Revisa que el numero no se repita dentro de la matriz*/
	FOR i IN 1..3 LOOP
		FOR j IN 1..3 LOOP
			FOR casilla IN (select * from casillas where fila = j and idJuego = pidJuego and
								matriz = pmatriz order by fila, columna) LOOP
				IF casilla.numero = pnumero THEN
					RETURN FALSE;
				END IF;
			END LOOP;
		END LOOP;
	END LOOP;
	/*Revisa que el numero no se repita dentro de la fila*/
	FOR i IN 1..9 LOOP
		FOR casilla IN (select * from casillas where fila = pfila and idJuego = pidJuego and
							matriz = pmatriz order by columna) LOOP
			IF casilla.numero = pnumero THEN
				RETURN FALSE;
			END IF;
		END LOOP;
	END LOOP;
	/*Revisa que el numero no se repita dentro de la columna*/
	FOR i IN 1..9 LOOP
		FOR casilla IN (select * from casillas where columna = pcolumna and idJuego = pidJuego and
							matriz = pmatriz order by fila) LOOP
			IF casilla.numero = pnumero THEN
				RETURN FALSE;
			END IF;
		END LOOP;
	END LOOP;
	RETURN TRUE;
END;
/

