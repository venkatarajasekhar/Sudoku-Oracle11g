CREATE OR REPLACE FUNCTION crearJuego(nConfig IN number)
	RETURN number
IS
	nFila number(1) := 1;
	nColumna number(1) := 1;
	nNumero casillas.numero%TYPE;
	nMatriz number(1);
	nIdJuego number(6);
	nCambiable number(1);
	
BEGIN
	nIdJuego := cantJuegos() +1;
	INSERT INTO Juegos VALUES (nIdJuego, 'Incompleto', nConfig);

	FOR i in 1..9 LOOP
		nMatriz := i;
		FOR j IN 1..9 LOOP
			IF (existeCasilla(nMatriz, nFila, nColumna, nConfig)) THEN
				SELECT numero INTO nNumero FROM casillas_iniciales WHERE
					matriz = nMatriz and fila = nFila and
					columna = nColumna and configInicial = nConfig;
				nCambiable := 0;
			ELSE
				nNumero := 0;
				nCambiable := 1;
			END IF;
			/* Si la casilla existe en configInicial, copie las casilla, sino, meta una nueva con 0s */
			INSERT INTO Casillas VALUES (nMatriz, nFila, nColumna, nNumero, nCambiable, nIdJuego);

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
	RETURN nIdJuego;
END;
/