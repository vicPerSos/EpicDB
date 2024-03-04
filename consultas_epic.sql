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
select * from estudio where id=2;
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
    id = 7;

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
select * from biblioteca;