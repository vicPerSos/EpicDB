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
select * from juego where genero='carreras';


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
select * from valoracion;
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


    
