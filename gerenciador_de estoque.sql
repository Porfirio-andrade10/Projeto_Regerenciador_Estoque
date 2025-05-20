CREATE database IF NOT EXISTS Gerenciador_de_Estoque;
use gerenciador_de_estoque; 

-- DROP DATABASE gerenciador_de_estoque;

CREATE TABLE alimentos_nao_pereciveis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    unidade_medida VARCHAR(4) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    custo DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    data_validade DATE NOT NULL
);

CREATE TABLE  carne (
    id INT AUTO_INCREMENT PRIMARY KEY,
    unidade_medida VARCHAR(4) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    custo DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    data_validade DATE NOT NULL
);

CREATE TABLE  Hortifruti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    unidade_medida VARCHAR(4) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    custo DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    data_validade DATE NOT NULL
);

CREATE TABLE  Descartaveis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    unidade_medida VARCHAR(4) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    custo DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL
);

CREATE TABLE auditoria_estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tabela_nome VARCHAR(50) NOT NULL,
    operacao VARCHAR(10) NOT NULL,  
    unidade_medida_antiga VARCHAR(4),
    nome_antigo VARCHAR(50),
    custo_antigo DECIMAL(10, 2),
    quantidade_estoque_antigo INT,
    data_validade_antigo DATE,
    unidade_medida_nova VARCHAR(4),
    nome_novo VARCHAR(50),
    custo_novo DECIMAL(10, 2),
    quantidade_estoque_novo INT,
    data_validade_novo DATE,
    data_operacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);