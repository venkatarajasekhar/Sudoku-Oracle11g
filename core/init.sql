	Create Table Juegos (
		id number(5) primary key not null,
		status varchar2(20),
		idInicial number(5) not null);

	Create Table Casillas (
		matriz number(1) not null,
		fila number(1),
		columna number(1),
		numero number(1),
		idJuego number(5),
		primary key(matriz,fila,columna,idJuego));

	Create Table Casillas_Iniciales (
		matriz number(1) not null,
		fila number(1),
		columna number(1),
		numero number(1),
		configInicial number(5),
		primary key(matriz,fila,columna,configInicial));

	Alter Table Casillas ADD (
		Constraint juego_FK
		Foreign Key (idJuego)
		References Juegos(id));

	Create Table Iniciales (
		id number(5) primary key not null,
		nivel varchar2(15));

	Alter Table Juegos ADD (
		Constraint configInicial_FK
		Foreign Key (idInicial)
		References Iniciales(id));

	Alter Table Casillas_Iniciales ADD (
		Constraint inicial_FK
		Foreign key (configInicial)
		References Iniciales(id));

	Create Table Usados (
		digito number(1) primary key not null,
		cantidad number(2),
		idJuego number(5) not null);

	Alter Table Usados ADD (
		Constraint game_FK
		Foreign Key (idJuego)
		References Juegos(id));

	/* Restricciones */


	/* Bind Variables */
	VARIABLE juego_actual number;


	/* Compilar funciones y procedimientos en /utils */
@@..\utils\cant_juegos.sql;
@@..\utils\existe_casilla.sql;
@@..\utils\mostrar_juego.sql;
@@..\utils\existe_casilla_juego.sql;
@@..\utils\numero_valido.sql;
/* @@..\utils\drop_all.sql; */

	/* Compilar funciones y procedimientos en /core */
@config_inicial;
@crear_juego;
@juego_ganado;

















