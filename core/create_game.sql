Declare
	nFila number(1) := 1;
	nColumna number(1) := 1;
	nMatriz number(1);
	nConfig number(5) := 1; /* no debe estar quemado */

	FUNCTION existeCasilla
		(pmatriz IN number, pfila IN number, pcolumna IN number, pconfig In number)
		RETURN Boolean
	IS
		rows number(3);
	BEGIN
		SELECT count(*) INTO rows FROM casillas WHERE
			casillas.matriz = pmatriz and casillas.fila = pfila and
			casillas.columna = pcolumna and casillas.configInicial = pconfig;
		IF rows > 0 THEN
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	END;

BEGIN

	INSERT INTO Juegos VALUES (1, 'A todo Darsh', 1);

	FOR i in 1..9 LOOP
		nMatriz := i;
		FOR j IN 1..9 LOOP
			IF (existeCasilla(nMatriz, nFila, nColumna, nConfig)) THEN

				UPDATE Casillas
					SET idJuego = 1
					WHERE casillas.matriz = nMatriz and casillas.fila = nFila and
						casillas.columna = nColumna and casillas.configInicial = nConfig;
			ELSE
				INSERT INTO Casillas VALUES (nMatriz, nFila, nColumna, 0, 1, nConfig);
			END IF;

			IF nColumna = 3 THEN
				nFila := nFila + 1;
				nColumna := 1;
			ELSE
				nColumna := nColumna + 1;
			END IF;
		END LOOP;
		nFila := 1;
		nColumna := 1;
	END LOOP;
END;
/