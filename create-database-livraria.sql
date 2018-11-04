/* 
banco do projeto de DW2
 @@ ghonorio
*/

-- no hsqldb não precisa especificar o tamanho dos INT e AUTO_INCREMENT é relativo ao IDENTITY
-- criando tabelas do banco
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