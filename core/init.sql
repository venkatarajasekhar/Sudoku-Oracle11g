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

Alter Table Casillas ADD (
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
















