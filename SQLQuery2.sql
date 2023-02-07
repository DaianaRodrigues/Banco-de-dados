CREATE DATABASE escola;

USE escola;

CREATE TABLE cursos(
	id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	nome VARCHAR(100) NOT NULL,
	mensalidade DECIMAL(3,2) NOT NULL,
);

ALTER TABLE cursos ALTER COLUMN mensalidade INT;

DROP TABLE alunos;

CREATE TABLE alunos(
	id INT IDENTITY(1,1) PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cpf CHAR(11) NOT NULL,
	email VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL,
	alunos_id INT,
	FOREIGN KEY (alunos_id) REFERENCES cursos(id)
);

CREATE TABLE endereço(
	id INT IDENTITY(1,1) PRIMARY KEY,
	rua VARCHAR(255) NOT NULL,
	cidade VARCHAR(255) NOT NULL,
	numero INT NOT NULL,
	endereço_id INT,
	complemento VARCHAR(255),
	FOREIGN KEY (endereço_id) REFERENCES alunos(id)
);

 INSERT INTO alunos (nome, cpf, email, data_nascimento) VALUES 
('Luana', '12356789000','luana@gmail.com', '01-05-1996'),
('Marilia', '09846532788', 'marilia@hotmail.com', '03-05-1995'),
('Raquel', '46789034511', 'raquel@gmail.com', '15-07-1994'),
('Joana', '01257892244', 'joana@gmail.com', '03-07-1995'),
('Fabricio', '35489721377', 'fabricio@gmail.com', '01-05-1993'),
('Everaldo', '57893409677','everaldo@hotmail.com', '07-05-1993'),
('Ricardo', '12390567845', 'ricardo@gmail.com', '15-05-1998'),
('Cleber', '34578909845','cleber@hotmail.com', '01-05-1997'),
('Fernando', '23678956705','fernando@hotmail.com', '03-05-1989'),
('Felipe', '09168934566','felipe@hotmail.com', '03-05-1996'),
('Matheus','11199955587', 'matheus@hotmail.com', '15-05-1989'),
('Rodrigo', '24690812355', 'rodrigo@hotmail.com', '01-05-1996'),
('Luma', '78690322457', 'luma@gmail.com', '01-05-1996'),
('Rafael', '07856712344', 'rafael@gmail.com', '15-03-1991'),
('Mariana', '12345678922', 'mariana@gmail.com', '01-07-1998'),
('Monique', '00989045677', 'monique@gmail.com', '15-07-1993'),
('Joaquim', '36745689712', 'joaquim@hotmail.com', '01-05-1994'),
('Sandro', '09876543211', 'sandro@gmail.com', '01-05-1996'),
('Henrique', '12567893466', 'henrique@gmail.com', '07-07-1995');

INSERT INTO cursos (nome, mensalidade) VALUES 
('Tecnologia da Informação', 20000),
('Desenvolvimento de Sistema', 25000),
('Admistração', 17800),
('Engenharia', 34500),
('Filosofia', 23000);

SELECT * FROM cursos;

SELECT * FROM alunos;

SELECT * FROM endereço;

INSERT INTO endereço (rua, cidade, numero) VALUES 
('Rua Xororó', 'São Paulo', 56),
('Rua Galatea', 'São Paulo', 256),
('Rua Antônio Mariani', 'Rio de Janeiro', 67),
('Rua Soldado José Reymão', 'Bahia', 89),
('Rua Hercí­lio Luz', 'Rio de Janeiro', 200),
('Rua Júlio Ribeiro Neto', 'São Paulo', 800),
('Rua Paolo Porpora', 'Santa Catarina', 300),
('Travessa Bom Jesus do Norte', 'Bahia', 456),
('Rua Paulo Bastide', 'Rio de Janeiro', 1000),
('Rua Charles Naufal', 'São Paulo', 80),
('Rua Padre Ângelo Gioielli', 'Santa Catarina', 567),
('Rua Valdomiro Urbani', 'Rio de Janeiro', 908),
('Rua Doutor Americano', 'São Paulo', 34),
('Via de Pedestre Cerebia', 'Bahia', 2),
('Travessa do Fado', 'Rio de Janeiro', 45),
('Rua Jales Rodrigues Silva','São Paulo', 678),
('Avenida Wando Henrique Cardim', 'Santa Catarina', 569);


INSERT INTO endereço (rua, cidade, numero) VALUES 
('Rua Luís Morales', 'Pernanbuco', 567),
('Rua da Independência', 'São Paulo', 1500),
('Rua Virgí­lio Manente', 'Maranhão', 24);


CREATE TABLE modulos(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	modulos VARCHAR(255),
	modulos_id INT,
	FOREIGN KEY (modulos_id) REFERENCES cursos(id)
);

INSERT INTO modulos (modulos, modulos_id) VALUES 
('Lógica de Programação', 6),
('Inglês', 8),
('Letras', 10),
('Banco de Dados', 7),
('Calculo', 9);

SELECT * FROM modulos;

