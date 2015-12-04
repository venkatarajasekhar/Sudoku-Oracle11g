BEGIN
	dbms_output.put_line('*** Manual de Uso - Sudoku ***');
	dbms_output.put_line('_________________________________________________________________________________________');
	dbms_output.put_line('-Juego Nuevo');
	dbms_output.put_line('--Desc: Crea un juego nuevo apartir de una configuracion aleatoria del nivel seleccionado');
	dbms_output.put_line('--Comando: @crear_juego');
	dbms_output.put_line('--Parametros: ');
	dbms_output.put_line('----nivel: nivel de dificultad del juego (Facil, Intermedio, Dificil y Muy Cerda)');
	dbms_output.put_line('_________________________________________________________________________________________');
	dbms_output.put_line('-Ver Juego Actual');
	dbms_output.put_line('--Desc: Muestra el juego actual');
	dbms_output.put_line('--Comando: @mostrar_juego_actual');
	dbms_output.put_line('--Parametros: ');
	dbms_output.put_line('_________________________________________________________________________________________');
	dbms_output.put_line('-Ver Juego');
	dbms_output.put_line('--Desc: Muestra el juego seleccionado por ID');
	dbms_output.put_line('--Comando: @mostrar_juego');
	dbms_output.put_line('--Parametros: ');
	dbms_output.put_line('----id_Juego: ID del juego');
	dbms_output.put_line('_________________________________________________________________________________________');
	dbms_output.put_line('-Ver Juegos Disponibles');
	dbms_output.put_line('--Desc: Muestra la informacion completa de todos los juegos');
	dbms_output.put_line('--Comando: @mostrar_juego');
	dbms_output.put_line('--Parametros: ');
	dbms_output.put_line('----id_Juego: ID del juego');
	dbms_output.put_line('_________________________________________________________________________________________');

END;
/