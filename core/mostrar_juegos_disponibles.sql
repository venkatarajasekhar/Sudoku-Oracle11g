DECLARE
	dificultad iniciales.nivel%TYPE;
BEGIN
	FOR juego in (SELECT * FROM juegos) LOOP
		SELECT nivel
		INTO dificultad
		FROM iniciales
		WHERE iniciales.id = juego.idInicial;

		dbms_output.put_line('______________________________________________________________');
		dbms_output.put_line('*** Juego numero: ' || juego.id || ', Dificultad: ' ||
			dificultad || ', Estado: ' || juego.status);
		mostrarJuego(juego.id);
		dbms_output.put_line('______________________________________________________________');
	END LOOP;
END;
/