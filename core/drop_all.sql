

Alter Table Casillas
	Drop Constraint juego_FK;

Alter Table Juegos
	Drop Constraint inicial_FK;

Alter Table Usados
	Drop Constraint game_FK;

Drop Table Juegos;

Drop Table Casillas;

Drop Table Iniciales;

Drop Table Usados;