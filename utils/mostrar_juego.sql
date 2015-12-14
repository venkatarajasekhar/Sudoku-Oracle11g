CREATE OR REPLACE PROCEDURE mostrarJuego(nIdJuego IN number)
	IS
	x number := 1;
	y number := 3;
	counter number := 1;
	linea varchar2(999);
	output varchar2(1);
BEGIN
	dbms_output.put_line('---------------------------------------------');
	FOR i IN 1..3 LOOP
		FOR j in 1..3 LOOP
			FOR casilla in (select * from casillas where fila = j and idJuego = nIdJuego and
								matriz between x and y order by matriz, fila, columna) LOOP
				IF (casilla.numero = 0) THEN
					output := '*';
				ELSE
					output := to_char(casilla.numero);
				END IF;

				IF (counter = 9) THEN
					linea := linea || ' | ' || output || ' | ';
				ELSIF (MOD(counter,3) = 0) THEN
					linea := linea || ' | ' || output || ' | -';
				ELSE
					linea := linea || ' | ' || output;
				END IF;
				counter := counter + 1;
			END LOOP;
			dbms_output.put_line(linea);
			dbms_output.new_line();
			linea := '';
			counter := 1;
		END LOOP;
		x := y + 1;
		y := y + 3;
		dbms_output.put_line('---------------------------------------------');
	END LOOP;
END;
/