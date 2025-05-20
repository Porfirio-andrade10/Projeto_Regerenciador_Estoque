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

-- alimentos_não_pereciveis

CREATE TRIGGER auditoria_alimentos_nao_pereciveis_update
AFTER UPDATE ON alimentos_nao_pereciveis
FOR EACH ROW
INSERT INTO auditoria_estoque (
    tabela_nome, operacao, unidade_medida_antiga, nome_antigo, custo_antigo, quantidade_estoque_antigo, 
	data_validade_antigo, unidade_medida_nova, nome_novo, custo_novo, quantidade_estoque_novo,data_validade_novo
) VALUES (
    'alimentos_nao_pereciveis', 'UPDATE', OLD.unidade_medida, OLD.nome, OLD.custo, OLD.quantidade_estoque,OLD.data_validade, 
    NEW.unidade_medida, NEW.nome, NEW.custo, NEW.quantidade_estoque, NEW.data_validade
);

CREATE TRIGGER auditoria_alimentos_nao_pereciveis_insert
AFTER  INSERT ON alimentos_nao_pereciveis
FOR EACH ROW
INSERT INTO auditoria_estoque (
	tabela_nome, operacao,
    unidade_medida_nova, nome_novo, custo_novo, quantidade_estoque_novo, data_validade_novo
)VALUES(
	'alimentos_nao_pereciveis', 'insert',
	NEW.unidade_medida, NEW.nome, NEW.custo, NEW.quantidade_estoque, NEW.data_validade
);

CREATE TRIGGER auditoria_alimentos_nao_pereciveis_delete
BEFORE DELETE ON alimentos_nao_pereciveis
FOR EACH ROW
INSERT INTO auditoria_estoque(
	tabela_nome, operacao, 
    unidade_medida_antiga, nome_antigo, custo_antigo, quantidade_estoque_antigo, data_validade_antigo
)VALUES(
	'alimentos_nao_pereciveis','delete',
    OLD.unidade_medida, OLD.nome, OLD.custo, OLD.quantidade_estoque, OLD.data_validade
    );
