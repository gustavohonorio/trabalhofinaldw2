/* 
banco do projeto de DW2
 @@ ghonorio
*/

-- criando tabelas do banco
CREATE TABLE area(
	id	INT(2) AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255),
	secao INTEGER
);

CREATE TABLE autor(
	id INT(2) AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255),
	endereco VARCHAR(255),
	livros INT(3)	
);

CREATE TABLE cliente(
	id INT(2) AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255),
	endereco VARCHAR(255),
	livros INT(3),
	nfs INT(3)
);

CREATE TABLE editora(
	id INT(2) AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255),
	endereco VARCHAR(255),
	livros INT(3)	
);

CREATE TABLE livro(
	id INT(2) AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255),
	autor INTEGER,
	area INTEGER,
	editora INTEGER,
	preco VARCHAR(255)	
);

CREATE TABLE notaFiscal(
	id INT(2) AUTO_INCREMENT PRIMARY KEY,
	cliente INTEGER,
	numeroFatura INT(10),
	dataFatura DATE,
	numeroNF INT(10),
	dataNF TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	qntLivros INT(3),
	valorNota VARCHAR(255)	
);

CREATE TABLE secao(
	id INT(2) AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255),
	areas INT(3)
);

-- definindo relacionamento entre objetos
ALTER TABLE area ADD CONSTRAINT FK_AreaSecao FOREIGN KEY (secao) REFERENCES secao (id);
ALTER TABLE livro ADD CONSTRAINT FK_LivroAutor FOREIGN KEY (autor) REFERENCES autor(id);
ALTER TABLE livro ADD CONSTRAINT FK_LivroArea FOREIGN KEY (area) REFERENCES area(id);
ALTER TABLE livro ADD CONSTRAINT FK_LivroEditora FOREIGN KEY (editora) REFERENCES editora(id);
ALTER TABLE notaFiscal ADD CONSTRAINT FK_NotaCliente FOREIGN KEY (cliente) REFERENCES cliente(id);