BEGIN
	dbms_output.put_line('Juego Actual es: ' || to_char(:juego_actual));
	mostrarJuego(:juego_actual);
END;
/