CREATE DATABASE IF NOT EXISTS sistema_lobo 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE sistema_lobo;

CREATE TABLE cidade (
    id_cidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE bombeiro (
    id_bombeiro INT PRIMARY KEY AUTO_INCREMENT,
    nip VARCHAR(20) UNIQUE NOT NULL,
    patente VARCHAR(45),
    email VARCHAR(50),
    nome VARCHAR(45) NOT NULL,
    regiao VARCHAR(45), -- Padronizado sem acento
    id_quartel INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_quartel) REFERENCES quartel(id_quartel)
) ENGINE=InnoDB;

CREATE TABLE viatura (
    id_viatura INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(45) UNIQUE NOT NULL,
    tipo VARCHAR(45) NOT NULL,
    status VARCHAR(45) NOT NULL,
    id_quartel INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_quartel) REFERENCES quartel(id_quartel)
) ENGINE=InnoDB; 

CREATE TABLE papel (
    id_papel INT PRIMARY KEY AUTO_INCREMENT,
    nome_papel VARCHAR(45) NOT NULL UNIQUE,
    requer_vinculo_bombeiro BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(45) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    id_papel INT NOT NULL,
    id_bombeiro INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_papel) REFERENCES papel(id_papel),
    FOREIGN KEY (id_bombeiro) REFERENCES bombeiro(id_bombeiro)
) ENGINE=InnoDB;

CREATE TABLE ocorrencia (
    id_ocorrencia INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(15) NOT NULL,
    tipo VARCHAR(45) NOT NULL,
    tipo_ocorrencia VARCHAR(100) NOT NULL,
    descricao TEXT,
    regiao VARCHAR (30),
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    precisao_gps DECIMAL(5, 2) NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_hora_abertura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_hora_fechamento DATETIME NULL,
    sincronizado BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE bombeiro_ocorrencia (
    id_bombeiro INT,
    id_ocorrencia INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_bombeiro, id_ocorrencia),
    FOREIGN KEY (id_bombeiro) REFERENCES bombeiro(id_bombeiro),
    FOREIGN KEY (id_ocorrencia) REFERENCES ocorrencia(id_ocorrencia)
) ENGINE=InnoDB;

CREATE TABLE viatura_ocorrencia (
    id_viatura INT,
    id_ocorrencia INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_viatura, id_ocorrencia),
    FOREIGN KEY (id_viatura) REFERENCES viatura(id_viatura),
    FOREIGN KEY (id_ocorrencia) REFERENCES ocorrencia(id_ocorrencia)
) ENGINE=InnoDB;

CREATE TABLE log_auditoria (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    acao VARCHAR(50) NOT NULL,
    entidade VARCHAR(50) NOT NULL,
    id_entidade INT NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    detalhes TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
) ENGINE=InnoDB;
