-- Insercion de datos
INSERT INTO `Usuario` (nombre, correo, contrasena, tipo_suscripcion) VALUES
('Juan Pérez', 'juan.perez@gmail.com', 'ContraseñaSegura123', 'premium'),
('Ana Gómez', 'ana.gomez@hotmail.com', 'MiContraseña456', 'basica'),
('Luis Martínez', 'luis.martinez@yahoo.com', 'Passw0rd!', 'premium'),
('María Rodríguez', 'maria.rodriguez@outlook.com', 'ContraseñaFuerte789', 'basica'),
('Carlos Fernández', 'carlos.fernandez@gmail.com', '12345Segura!', 'premium');


INSERT INTO `Pelicula` (titulo, anio_lanzamiento, duracion, url_imagen) VALUES
('Inception', 2010, 148, 'https://m.media-amazon.com/images/I/912AErFSBHL._AC_UF894,1000_QL80_.jpg'),
('The Godfather', 1972, 175, 'https://m.media-amazon.com/images/M/MV5BYTJkNGQyZDgtZDQ0NC00MDM0LWEzZWQtYzUzZDEwMDljZWNjXkEyXkFqcGc@._V1_.jpg'),
('The Dark Knight', 2008, 152, 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg'),
('Pulp Fiction', 1994, 154, 'https://pics.filmaffinity.com/Pulp_Fiction-210382116-mmed.jpg'),
('El secreto de sus ojos', 2009, 129, 'https://pics.filmaffinity.com/El_secreto_de_sus_ojos-483213496-large.jpg');


INSERT INTO `Serie` (titulo, anio_lanzamiento, num_temporadas, imagen_url) VALUES
('Breaking Bad', 2008, 5, 'https://es.web.img3.acsta.net/pictures/18/04/04/22/52/3191575.jpg'),
('Game of Thrones', 2011, 8, 'https://m.media-amazon.com/images/I/91iY86ZIuOL._AC_UF894,1000_QL80_.jpg'),
('Stranger Things', 2016, 3, 'https://www.ecartelera.com/carteles-series/100/124/021_m.jpg'),
('The Crown', 2016, 4, 'https://pics.filmaffinity.com/The_Crown_Serie_de_TV-838357032-large.jpg'),
('The Office', 2005, 9, 'https://pics.filmaffinity.com/The_Office_Serie_de_TV-210023284-large.jpg');



INSERT INTO `Temporada` (numero_temporada, numero_episodios, fecha_lanzamiento, IdSerie) VALUES
-- Breaking Bad
(1, 7, '2008-01-20', 1),
(2, 13, '2009-03-08', 1),
(3, 13, '2010-04-25', 1),
(4, 13, '2011-07-17', 1),
(5, 16, '2012-07-15', 1),

-- Game of Thrones
(1, 10, '2011-04-17', 2),
(2, 10, '2012-04-01', 2),
(3, 10, '2013-03-31', 2),
(4, 10, '2014-04-06', 2),
(5, 10, '2015-04-12', 2),
(6, 10, '2016-04-24', 2),
(7, 7, '2017-07-16', 2),
(8, 6, '2019-04-14', 2),

-- Stranger Things
(1, 8, '2016-07-15', 3),
(2, 9, '2017-10-27', 3),
(3, 8, '2019-07-04', 3),

-- The Crown
(1, 10, '2016-11-04', 4),
(2, 10, '2017-12-08', 4),
(3, 10, '2019-11-17', 4),
(4, 10, '2020-11-15', 4),

-- The Office
(1, 6, '2005-03-24', 5),
(2, 22, '2005-09-20', 5),
(3, 25, '2006-09-21', 5),
(4, 14, '2007-09-27', 5),
(5, 28, '2008-09-25', 5),
(6, 26, '2009-09-17', 5),
(7, 22, '2010-09-23', 5),
(8, 24, '2011-09-22', 5),
(9, 23, '2012-09-20', 5);


INSERT INTO episodio (titulo, duracion, fecha_lanzamiento, idTemporada) VALUES 
('Pilot', 58, '2008-01-20', 1),
('Cats in the Bag...', 48, '2008-01-27', 1),
('...And the Bags in the River', 48, '2008-02-10', 1),
('Cancer Man', 48, '2008-02-17', 1),
('Gray Matter', 48, '2008-02-24', 1),
('Crazy Handful of Nothin', 48, '2008-03-02', 1),
('A No-Rough-Stuff-Type Deal', 48, '2008-03-09', 1);


INSERT INTO `Genero` (idGenero, nombre, descripcion) VALUES
(1, 'Acción', 'Películas de acción y aventura.'),
(2, 'Drama', 'Películas que exploran el drama humano.'),
(3, 'Comedia', 'Películas de comedia y entretenimiento.'),
(4, 'Ciencia Ficción', 'Películas que exploran lo desconocido.'),
(5, 'Terror', 'Películas de terror y suspenso.');


INSERT INTO `Lista_de_vistos` (titulo, tipo_contenido, fecha_agregado, estado, idUsuario) VALUES
('Inception', 'pelicula', '2023-10-01', 'visto', 1),
('Breaking Bad', 'serie', '2023-10-02', 'en progreso', 2),
('The Godfather', 'pelicula', '2023-10-03', 'por ver', 3),
('The Office', 'serie', '2023-10-04', 'visto', 4),
('Stranger Things', 'serie', '2023-10-05', 'por ver', 5),
('The Godfather', 'pelicula', '2023-10-03', 'por ver', 1);


INSERT INTO `Actor` (nombre, fecha_nacimiento, nacionalidad) VALUES
('Leonardo DiCaprio', '1974-11-11', 'Estadounidense'),
('Bryan Cranston', '1956-03-07', 'Estadounidense'),
('Natalie Portman', '1981-06-09', 'Israeli'),
('Robert Downey Jr.', '1965-04-04', 'Estadounidense'),
('Kate Winslet', '1975-10-05', 'Britanica'),
('Aaron Paul', '1979-08-27', 'Estadounidense'),  
('Lena Headey', '1973-10-03', 'Británica'),      
('Finn Wolfhard', '2002-12-23', 'Canadiense'),   
('Matt Smith', '1982-10-28', 'Británico'),        
('Mindy Kaling', '1979-06-24', 'Estadounidense'); 

INSERT INTO `Pelicula_Genero` (idPelicula, idGenero) VALUES
(1, 1), -- Inception, Acción
(2, 2), -- The Godfather, Drama
(3, 1), -- The Dark Knight, Acción
(4, 2), -- Pulp Fiction, Drama
(5, 2); -- The Shawshank Redemption, Drama

INSERT INTO `Serie_Genero` (idSerie, idGenero) VALUES
(1, 2), -- Breaking Bad, Drama
(2, 4), -- Game of Thrones, Fantasía
(3, 4), -- Stranger Things, Ciencia Ficción
(4, 2), -- The Crown, Biográfica
(5, 3); -- The Office, Comedia

INSERT INTO serie_actor (idSerie, idActor) VALUES
(1, 2),  
(1, 6), 
(2, 7),  
(3, 8), 
(4, 9),  
(5, 10);  


INSERT INTO pelicula_actor (idPelicula, idActor) VALUES (1, 1); 

INSERT INTO lista_pelicula (idLista, idPelicula) VALUES
(1,1),
(3,2),
(6,2);

INSERT INTO lista_serie (idLista, idSerie) VALUES
(2,1),
(4,5),
(5,3);