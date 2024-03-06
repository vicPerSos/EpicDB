use epic;
-- tabla estudio
-- Muestra el país de el estudio Estudio7
SELECT 
    pais
FROM
    estudio
WHERE
    nombre = 'Estudio7';
-- Muestra toda la informacion del tercer estudio;
SELECT 
    *
FROM
    estudio
WHERE
    id = 3;
-- muestra el/los estudio/s que pertenezcan a PaisH
SELECT 
    *
FROM
    estudio
WHERE
    pais = 'PaisH';

-- tabla usuario
-- Muestra el nick de el usuario numero 8
SELECT 
    nick
FROM
    usuario
WHERE
    id = 8;

-- Muestra los 3 ultimos usario registrados
SELECT 
    *
FROM
    usuario
ORDER BY fech_reg DESC
LIMIT 3;

-- Muestra el correo de los usuarios impares
SELECT 
    correo
FROM
    usuario
WHERE
    id % 2 != 0;
    
-- Tabla juego 

-- Muestra los jegos que cuesten menos de 30€
SELECT 
    *
FROM
    juego
WHERE
    precio < 30;
-- Muestra el id de los estudios de los juegos multiplos de 3
SELECT 
    estudio
FROM
    juego
WHERE
    id % 3 = 0;
-- Muestra los juegos de carrera
SELECT * from juego where genero='carreras';


-- Tabla biblioteca

-- Dame el id de los jugadores del juego numero 3
SELECT 
    usuario
FROM
    biblioteca
WHERE
    juego = 2;
-- muestra los datos de las bliblioecas cuyo id sea divisor de 33
SELECT 
    *
FROM
    biblioteca
WHERE
    33 % id = 0;
-- muestra los juegos del usuario 4
SELECT 
    juego
FROM
    biblioteca
WHERE
    usuario = 4; 
    
-- Tabla valoracion

-- muestra las valoraciones de cuatro estrellas
SELECT 
    *
FROM
    valoracion
WHERE
    estrella = 4;
SELECT * from valoracion;
-- muestra la ultima valoracion
SELECT 
    *
FROM
    valoracion
ORDER BY fech DESC
LIMIT 1;
-- muestras las valoraciones del usuario 5
SELECT 
    *
FROM
    valoracion
WHERE
    usuario = 5;







-- Vistas
-- Una que te diga los 3 juegos mejor valorados.
CREATE OR REPLACE VIEW nuevos AS
    SELECT 
        titulo, fech_sal
    FROM
        juego
    ORDER BY fech_sal DESC
    LIMIT 5;
    select * from nuevos;
    
-- Otra que te diga los 20 más baratos.
CREATE OR REPLACE VIEW baratos AS
SELECT 
        titulo, precio
    FROM
        juego
    ORDER BY precio ASC
    LIMIT 20 ;
    select * from baratos;

-- consultas complejas


-- 1 Vista que elija el juego gratis de la semana para cada usuario siendo siempre de menos de 35€
CREATE OR REPLACE VIEW regala AS
    SELECT 
        u.nombre, j.titulo
    FROM
        usuario u,
        juego j
    WHERE
        j.precio < 30
    ORDER BY RAND();
    
    
SELECT * FROM regala;

-- 2 Muestra los nombres de usuario y su valoracion y estreyas del juego7
SELECT 
    u.nombre, v.estrella, v.mensaje
FROM
    juego j
        JOIN
    valoracion v ON v.juego = j.id
        JOIN
    usuario u ON u.id = v.usuario
WHERE
    j.id = 7;

-- 3 Vista que te muestre los 3 mejores juegos por estrellas 
CREATE OR REPLACE VIEW mejores AS
SELECT 
    j.titulo, u.nick, v.mensaje, AVG(v.estrella)
FROM
    juego j
        JOIN
    valoracion v ON j.id = v.juego
        JOIN
    usuario u ON v.usuario = u.id
GROUP BY j.titulo , u.nick , v.mensaje , v.estrella
ORDER BY v.estrella DESC
LIMIT 3;    

SELECT * FROM mejores;

-- 4 Muestra la Valoración Promedio por Género:
SELECT 
    genero, AVG(v.estrella) AS valoracion_promedio
FROM
    juego j
        JOIN
    valoracion v ON j.id = v.juego
GROUP BY genero;

-- 5 Juegos en comun entre dos usuario
CREATE OR REPLACE VIEW comun AS
    SELECT 
        u1.nombre AS usuario1, u2.nombre AS usuario2, j.titulo
    FROM
        usuario u1
            JOIN
        biblioteca b1 ON u1.id = b1.usuario
            JOIN
        juego j ON b1.juego = j.id
            JOIN
        biblioteca b2 ON j.id = b2.juego
            JOIN
        usuario u2 ON b2.usuario = u2.id AND u1.id < u2.id;

SELECT * FROM comun;

-- 6 Muestra el Estudio con Mayor Cantidad de Juegos
SELECT 
    e.nombre AS estudio, COUNT(j.id) AS cantidad_juegos
FROM
    estudio e
        LEFT JOIN
    juego j ON e.id = j.estudio
GROUP BY e.nombre
ORDER BY cantidad_juegos DESC
LIMIT 1;

-- 7 Muestra juegos que tienen valoraciones por encima de la media
CREATE OR REPLACE VIEW critica AS 
SELECT 
    j.titulo, max(estrella),AVG(v.estrella) AS valoracion_promedio
FROM
    juego j
        JOIN
    valoracion v ON j.id = v.juego
GROUP BY j.titulo
HAVING MAX(v.estrella) > AVG(v.estrella)
;
SELECT * FROM critica;

-- 8 Muestra las valoraciones 
SELECT 
    u.nombre
FROM
    usuario u
        LEFT JOIN
    valoracion v ON u.id = v.usuario
WHERE
    v.id IS NULL;

-- 9 Muestra los cinco usuarios con la mayor cantidad de juegos en su biblioteca
SELECT 
    u.nombre, COUNT(b.juego) AS cantidad_juegos
FROM
    usuario u
        LEFT JOIN
    biblioteca b ON u.id = b.usuario
GROUP BY u.nombre
ORDER BY cantidad_juegos DESC
LIMIT 5;

-- 10 Muestra las valoraciones por mes
SELECT MONTH(v.fech) AS mes, COUNT(v.id) AS cantidad_valoraciones
FROM valoracion v
GROUP BY MONTH(v.fech)
ORDER BY mes;








