CREATE OR REPLACE FUNCTION numeroValido
	(pmatriz IN number, pfila IN number, pcolumna IN number,pnumero IN number,pidJuego IN number)
	RETURN Boolean
IS
col_pos number;
fila_pos number;
BEGIN
	/*Ajusta la posicion de revision a nivel de filas*/
	IF pmatriz between 1 and 3 THEN
		fila_pos := 1;
	ELSIF pmatriz between 4 and 6 THEN
		fila_pos := 4;
	ELSE
		fila_pos := 7;
	END IF;
	/*Ajusta la posicion de revision a nivel de columnas*/
	IF pmatriz = 1 or pmatriz = 4 or pmatriz = 7 THEN
		col_pos := 1;
	ELSIF pmatriz = 2 or pmatriz = 5 or pmatriz = 8 THEN
		col_pos := 2;
	ELSE
		col_pos := 3;
	END IF;
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
	FOR i IN 1..3 LOOP	
			FOR casilla IN (select * from casillas where fila = pfila and idJuego = pidJuego and
								matriz = fila_pos order by columna) LOOP
				IF casilla.numero = pnumero THEN
					RETURN FALSE;
				END IF;
			END LOOP;
			fila_pos := fila_pos + 1;	
	END LOOP;
	/*Revisa que el numero no se repita dentro de la columna*/
	FOR i IN 1..3 LOOP
			FOR casilla IN (select * from casillas where columna = pcolumna and idJuego = pidJuego and
								matriz = col_pos order by fila) LOOP
				IF casilla.numero = pnumero THEN
					RETURN FALSE;
				END IF;
			END LOOP;
			col_pos := col_pos + 3;	
	END LOOP;
	RETURN TRUE;
END;
/

