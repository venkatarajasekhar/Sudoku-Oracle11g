CREATE OR REPLACE FUNCTION cantJuegos
	RETURN number
IS
	cant number(6);
BEGIN
	SELECT count(*) INTO cant FROM juegos;
	RETURN cant;
END;
/