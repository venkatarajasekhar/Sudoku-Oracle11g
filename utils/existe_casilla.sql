CREATE OR REPLACE FUNCTION existeCasilla
	(pmatriz IN number, pfila IN number, pcolumna IN number, pconfig In number)
	RETURN Boolean
IS
	rows number(3);
BEGIN
	SELECT count(*) INTO rows FROM casillas_iniciales WHERE
		casillas_iniciales.matriz = pmatriz and casillas_iniciales.fila = pfila and
		casillas_iniciales.columna = pcolumna and casillas_iniciales.configInicial = pconfig;
	IF rows > 0 THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
/