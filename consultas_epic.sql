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

