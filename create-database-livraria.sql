/* 
banco do projeto de DW2
 @@ ghonorio
*/

-- no hsqldb não precisa especificar o tamanho dos INT e AUTO_INCREMENT é relativo ao IDENTITY
-- criando tabelas do banco
CREATE TABLE logon(
	id	INT IDENTITY PRIMARY KEY,
	usuario VARCHAR(255),
	senha VARCHAR(255)
);

CREATE TABLE area(
	id	INT IDENTITY PRIMARY KEY,
	nome VARCHAR(255),
	secao INT
);

CREATE TABLE autor(
	id INT IDENTITY PRIMARY KEY,
	nome VARCHAR(255),
	endereco VARCHAR(255),
	livros INT	
);

CREATE TABLE cliente(
	id INT IDENTITY PRIMARY KEY,
	nome VARCHAR(255),
	endereco VARCHAR(255),
	livros INT,
	nfs INT
);

CREATE TABLE editora(
	id INT IDENTITY PRIMARY KEY,
	nome VARCHAR(255),
	endereco VARCHAR(255),
	livros INT	
);

CREATE TABLE livro(
	id INT IDENTITY PRIMARY KEY,
	nome VARCHAR(255),
	autor INT,
	area INT,
	editora INT,
	preco VARCHAR(255)	
);

CREATE TABLE notaFiscal(
	id INT IDENTITY PRIMARY KEY,
	cliente INTEGER,
	numeroFatura INT,
	dataFatura DATE,
	numeroNF INT,
	dataNF TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	qntLivros INT,
	valorNota VARCHAR(255)	
);

CREATE TABLE secao(
	id INT IDENTITY PRIMARY KEY,
	nome VARCHAR(255),
	areas INT
);

-- definindo relacionamento entre objetos
ALTER TABLE area ADD CONSTRAINT FK_AreaSecao FOREIGN KEY (secao) REFERENCES secao (id);
ALTER TABLE livro ADD CONSTRAINT FK_LivroAutor FOREIGN KEY (autor) REFERENCES autor(id);
ALTER TABLE livro ADD CONSTRAINT FK_LivroArea FOREIGN KEY (area) REFERENCES area(id);
ALTER TABLE livro ADD CONSTRAINT FK_LivroEditora FOREIGN KEY (editora) REFERENCES editora(id);
ALTER TABLE notaFiscal ADD CONSTRAINT FK_NotaCliente FOREIGN KEY (cliente) REFERENCES cliente(id);

-- carga no banco
INSERT INTO logon (usuario,senha) VALUES ('admin','admin');

INSERT INTO autor (nome,endereco) VALUES ('Fabio de Castro','Rua Orlando Meira');
INSERT INTO autor (nome,endereco) VALUES ('Vitoria Ferreira','Rua Basilio Dibbo');
INSERT INTO autor (nome,endereco) VALUES ('Monteiro Lobato','Av Brasil');

INSERT INTO secao (nome) VALUES ('Ficcao'),
INSERT INTO secao (nome) VALUES ('Geografia');
INSERT INTO secao (nome) VALUES ('Biografia');
INSERT INTO secao (nome) VALUES ('Historia');
INSERT INTO secao (nome) VALUES ('Musica');

INSERT INTO area (nome,secao) VALUES ('Ficcao Cientifica',0),
INSERT INTO area (nome,secao) VALUES ('Topologia',1);
INSERT INTO area (nome,secao) VALUES ('Biografia Regional',2);
INSERT INTO area (nome,secao) VALUES ('Historia da Arte',3);
INSERT INTO area (nome,secao) VALUES ('Erudita',4);

INSERT INTO editora (nome,endereco) VALUES ('Editora Scieze','Rua Campo Salles');
INSERT INTO editora (nome,endereco) VALUES ('Editora Brazuca','Rua Leal Quinze');
INSERT INTO editora (nome,endereco) VALUES ('Editora Budapest','Av Independencia');
INSERT INTO editora (nome,endereco) VALUES ('Editora STLer','Rua Victoria');
INSERT INTO editora (nome,endereco) VALUES ('Editora Paulista','Av Paulista');

-- alterando a tabela livro
ALTER TABLE livro ADD quantidade INT;