-- DELIMITER cambia el delimitador predeterminado a // para evitar que sql se confunda con el ; dentro del procedimiento

DELIMITER //

CREATE PROCEDURE ObtenerListaPeliculasPorUsuario(IN usuarioId INT)
BEGIN
    SELECT p.titulo, lv.estado 
    FROM Lista_de_vistos lv
    JOIN Pelicula p ON lv.idPelicula = p.idPelicula
    WHERE lv.idUsuario = usuarioId;
END //

DELIMITER ;


CALL ObtenerListaPeliculasPorUsuario(1);
