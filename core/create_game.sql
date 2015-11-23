Declare 
	fila number(1) := 1;
	columna number(1) := 1;
BEGIN
	Insert into Juegos values (
		1,
		'A todo Darsh',
		1);

	FOR i in 1..9 LOOP
		FOR j in 1..9 LOOP

			IF (j = 7) THEN
				fila := 3;
			ELSIF (j = 4) THEN
				fila := 2;
			ELSE 
				fila := fila;
			END IF; 

			dbms_output.put_line(i ||', ' || fila
				||', ' || columna ||', ' || 0 ||', ' || 1);

			Insert into Casillas values (
				i, fila, columna, 0, 1);

			IF (columna = 3) THEN
				columna := 1;
			ELSE
				columna := columna + 1;
			END IF;

		END LOOP;
		columna := 1;
		fila := 1;
		dbms_output.put_line(i || ' matrix created');
	END LOOP;

END;
/