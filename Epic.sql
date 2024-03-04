-- cabecera 
Drop Database  If Exists Epic;
Create Database Epic;
Use Epic;


CREATE TABLE Estudio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    pais VARCHAR(20)
);
Describe Estudio;

CREATE TABLE Usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    nick VARCHAR(100),
    correo VARCHAR(75),
    fech_reg DATE
);
Describe Usuario;

CREATE TABLE Juego (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    estudio INT,
    fech_sal DATE,
    genero VARCHAR(30),
    valoracion INT,
    precio DECIMAL(4 , 2 ),
    CONSTRAINT chk_genero CHECK (genero in('miedo','aventura','estrategia','carreras','romance')),
    CONSTRAINT fk_studio_game FOREIGN KEY (estudio)
        REFERENCES Estudio (id)
);


CREATE TABLE Biblioteca (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario INT,
    juego INT,
    CONSTRAINT fk_user_library FOREIGN KEY (usuario)
        REFERENCES Usuario (id),
    CONSTRAINT fk_game_library FOREIGN KEY (juego)
        REFERENCES Juego (id)
);

CREATE TABLE Valoracion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario INT,
    juego INT,
    estrella DECIMAL(2.1),
    mensaje VARCHAR(200),
    fech DATE,
    CONSTRAINT Bad_point CHECK (estrella <= 5 AND estrella >= 0),
    CONSTRAINT fk_user_point FOREIGN KEY (usuario)
        REFERENCES Usuario (id),
    CONSTRAINT fk_game_point FOREIGN KEY (juego)
        REFERENCES Juego (id)
);

-- Inserción de datos ficticios para la tabla Estudio
INSERT INTO Estudio (nombre, pais) VALUES
('Estudio1', 'PaísA'),
('Estudio2', 'PaísB'),
('Estudio3', 'PaísC'),
('Estudio4', 'PaísD'),
('Estudio5', 'PaísE'),
('Estudio6', 'PaísF'),
('Estudio7', 'PaísG'),
('Estudio8', 'PaísH'),
('Estudio9', 'PaísI'),
('Estudio10', 'PaísJ');
select * from Estudio;

-- Inserción de datos ficticios para la tabla Usuario
INSERT INTO Usuario (nombre, nick, correo, fech_reg) VALUES
('Usuario1', 'Nick1', 'usuario1@example.com', '2023-01-01'),
('Usuario2', 'Nick2', 'usuario2@example.com', '2023-02-15'),
('Usuario3', 'Nick3', 'usuario3@example.com', '2023-03-30'),
('Usuario4', 'Nick4', 'usuario4@example.com', '2023-04-12'),
('Usuario5', 'Nick5', 'usuario5@example.com', '2023-05-25'),
('Usuario6', 'Nick6', 'usuario6@example.com', '2023-06-10'),
('Usuario7', 'Nick7', 'usuario7@example.com', '2023-07-15'),
('Usuario8', 'Nick8', 'usuario8@example.com', '2023-08-20'),
('Usuario9', 'Nick9', 'usuario9@example.com', '2023-09-25'),
('Usuario10', 'Nick10', 'usuario10@example.com', '2023-10-30');
select * from usuario;

-- Inserción de datos ficticios para la tabla Juego
INSERT INTO Juego (titulo, estudio, fech_sal, genero, valoracion, precio) VALUES
('Juego1', 1, '2023-01-10', 'Aventura', 4, 29.99),
('Juego2', 2, '2023-02-20', 'Estrategia', 3, 39.99),
('Juego3', 3, '2023-03-15', 'Romance', 5, 19.99),
('Juego4', 4, '2023-04-25', 'Carreras', 2, 49.99),
('Juego5', 5, '2023-05-05', 'Miedo', 4, 59.99),
('Juego6', 6, '2023-06-10', 'Aventura', 4, 29.99),
('Juego7', 7, '2023-07-15', 'Estrategia', 3, 39.99),
('Juego8', 8, '2023-08-20', 'Romance', 5, 19.99),
('Juego9', 9, '2023-09-25', 'Carreras', 2, 49.99),
('Juego10', 10, '2023-10-30', 'Miedo', 4, 59.99);
select * from juego;

-- Inserción de datos ficticios para la tabla Biblioteca
INSERT INTO Biblioteca (usuario, juego) VALUES
(1, 2),
(2, 4),
(3, 1),
(4, 3),
(5, 5),
(6, 7),
(7, 9),
(8, 6),
(9, 8),
(10, 10);
select * from biblioteca;

-- Inserción de datos ficticios para la tabla Valoracion
INSERT INTO Valoracion (usuario, juego, estrella, mensaje, fech) VALUES
(1, 2, 4, 'Me encanta este juego', '2023-02-22'),
(2, 4, 2, 'No me gustó tanto como esperaba', '2023-04-30'),
(3, 1, 5, 'Increíble experiencia de juego', '2023-01-15'),
(4, 3, 3, 'Divertido pero un poco complicado', '2023-03-18'),
(5, 5, 4, 'Gran historia y jugabilidad', '2023-05-10'),
(6, 7, 4, 'Me encanta este juego', '2023-07-22'),
(7, 9, 2, 'No me gustó tanto como esperaba', '2023-09-30'),
(8, 6, 5, 'Increíble experiencia de juego', '2023-08-15'),
(9, 8, 3, 'Divertido pero un poco complicado', '2023-10-18'),
(10, 10, 4, 'Gran historia y jugabilidad', '2023-11-10');
select * from valoracion;


