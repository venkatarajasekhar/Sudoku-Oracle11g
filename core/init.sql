Create Table Juegos (
	id number(5) primary key not null,
	status varchar2(20),
	idInicial number(5) not null);

Create Table Casillas (
	matriz number(2) not null,
	fila number(2),
	columna number(2),
	numero number(1),
	idJuego number(5) not null,
	primary key(matriz,fila,columna));

Alter Table Casillas ADD (
	Constraint juego_FK
	Foreign Key (idJuego)
	References Juegos(id));

Create Table Iniciales (
	id number(5) primary key not null,
	nivel varchar2(15));

Alter Table Juegos ADD (
	Constraint inicial_FK
	Foreign Key (idInicial)
	References Iniciales(id));

	/* Foreign Key de Casillas -> Iniciales */

Create Table Usados (
	digito number(1) primary key not null,
	cantidad number(2),
	idJuego number(5) not null);

Alter Table Usados ADD (
	Constraint game_FK
	Foreign Key (idJuego)
	References Juegos(id));

/* Restricciones */


/* Configuracion Inicial */

Insert into Iniciales values (
	1,
	'Principiante');

Insert into Iniciales values (
	2,
	'Intermedio');

Insert into Iniciales values (
	3,
	'Experto');

Insert into Iniciales values (
	4,
	'Muy Cerda');















