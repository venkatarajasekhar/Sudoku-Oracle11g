DECLARE
	linea varchar2(999);
	CURSOR juego IS (SELECT * from casillas where idJuego = 1);
BEGIN
	FOR i in 1..2 LOOP
		FOR casilla in (select * from casillas where fila = i) LOOP
			linea := linea || '|' || casilla.numero || '|';
		END LOOP;
		dbms_output.put_line(linea);
	END LOOP;
END;
/