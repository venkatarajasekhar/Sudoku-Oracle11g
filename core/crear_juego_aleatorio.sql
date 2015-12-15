DECLARE
	idInicial number(5);
	CURSOR iniciales IS ( SELECT * FROM
		(SELECT id FROM Iniciales ORDER BY DBMS_RANDOM.RANDOM) WHERE rownum < 2);
BEGIN
	OPEN iniciales;
	FETCH iniciales INTO idInicial;
	dbms_output.put_line('idInicial=' || to_char(idInicial));
	:juego_actual := crearJuego(idInicial);
END;
/