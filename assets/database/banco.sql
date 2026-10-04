CREATE DATABASE IF NOT EXISTS db_familia;

USE db_familia;

CREATE TABLE usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nome_usuario VARCHAR(255) NOT NULL,
    email_usuario VARCHAR(155) NOT NULL UNIQUE,
    senha_usuario VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('usuario', 'admin') DEFAULT 'usuario',

    PRIMARY KEY (id_usuario)
);

CREATE TABLE familias (
    id_familia INT NOT NULL AUTO_INCREMENT,
    nome_familia VARCHAR(255) NOT NULL,
    descricao TEXT,

    PRIMARY KEY (id_familia)
);

CREATE TABLE pessoas (
    id_pessoa INT NOT NULL AUTO_INCREMENT,
    id_familia INT NOT NULL,
    nome_pessoa VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    descricao TEXT,

    PRIMARY KEY (id_pessoa),

    FOREIGN KEY (id_familia)
        REFERENCES familias(id_familia)
        ON DELETE CASCADE
);

CREATE TABLE fotos (
    id_foto INT NOT NULL AUTO_INCREMENT,
    id_familia INT NOT NULL,
    titulo VARCHAR(255),
    descricao TEXT,
    caminho_arquivo VARCHAR(500) NOT NULL,
    data_foto DATE,

    PRIMARY KEY (id_foto),

    FOREIGN KEY (id_familia)
        REFERENCES familias(id_familia)
        ON DELETE CASCADE
);

CREATE TABLE fotos_pessoas (
    id_foto INT NOT NULL,
    id_pessoa INT NOT NULL,

    PRIMARY KEY (id_foto, id_pessoa),

    FOREIGN KEY (id_foto)
        REFERENCES fotos(id_foto)
        ON DELETE CASCADE,

    FOREIGN KEY (id_pessoa)
        REFERENCES pessoas(id_pessoa)
        ON DELETE CASCADE
);