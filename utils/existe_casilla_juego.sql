CREATE OR REPLACE FUNCTION existeCasillaJuego
	(pmatriz IN number, pfila IN number, pcolumna IN number,idJuego IN number)
	RETURN Boolean
IS
	rows number(3);
BEGIN
	SELECT count(*) INTO rows FROM casillas WHERE
		casillas.matriz = pmatriz and casillas.fila = pfila and
		casillas.columna = pcolumna and casillas.idJuego = idJuego;
	IF rows > 0 THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
/