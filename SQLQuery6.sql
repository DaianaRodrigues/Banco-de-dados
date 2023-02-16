CREATE DATABASE clientes_db;

USE clientes_db;

CREATE TABLE clientes(
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nome VARCHAR(255),
	idade INT,
	cpf CHAR(11),
	sexo CHAR(1)
);

DROP TABLE clientes;

INSERT INTO clientes (nome, idade, sexo, cpf) VALUES ('Robson', 40, 'M', '12312312312');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Denise', 35,'F', '18989888812');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Madalena', 55,'F', '34534534545');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Jorge', 60, 'M', '89089089090');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Ana', 18, 'F', '90909009090');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Bruna', 26, 'F','78568945239');

SELECT * FROM clientes;

SELECT * FROM clientes WHERE sexo = 'M';

SELECT * FROM  clientes WHERE sexo = 'F' AND idade > 30 ORDER BY idade DESC;

CREATE TABLE departamentos(
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	departamento VARCHAR(20)
);

INSERT INTO departamentos (departamento) VALUES ('Vendas'), ('Marketing'), ('RH'), ('TI'), ('Administrativo'), ('Desenvolvimento');

SELECT * FROM departamentos;

CREATE TABLE funcionario(
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(255),
	sexo CHAR(1),
	data_nascimento DATE,
	salario INT,
	departamento_id INT,
	FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

INSERT INTO funcionario (nome, email, sexo, data_nascimento, salario, departamento_id) VALUES
('Luana', 'luana@gmail.com', 'F', '01-05-1996', 3000, 1),
('Marilia', 'marilia@hotmail.com', 'F', '03-05-1995', 3100, 2),
('Raquel', 'raquel@gmail.com', 'F', '15-07-1994', 3050, 3),
('Joana', 'joana@gmail.com', 'F', '03-07-1995', 3000, 4),
('Fabricio', 'fabricio@gmail.com', 'M', '01-05-1993', 4700, 5),
('Everaldo', 'everaldo@hotmail.com', 'M', '07-05-1993', 4600, 6),
('Ricardo', 'ricardo@gmail.com', 'M', '15-05-1998', 3500, 1),
('Cleber', 'cleber@hotmail.com', 'M', '01-05-1997', 3300, 3),
('Fernando', 'fernando@hotmail.com', 'M', '03-05-1989', 3000, 2),
('Felipe', 'felipe@hotmail.com', 'M', '03-05-1996', 3070, 4),
('Matheus', 'matheus@hotmail.com', 'M', '15-05-1989', 4060, 5),
('Rodrigo', 'rodrigo@hotmail.com', 'M', '01-05-1996', 3060, 6),
('Luma', 'luma@gmail.com', 'F', '01-05-1996', 3700, 1),
('Rafael', 'rafael@gmail.com', 'M', '15-03-1991', 3500, 4),
('Mariana', 'mariana@gmail.com', 'F', '01-07-1998', 3900, 4),
('Monique', 'monique@gmail.com', 'F', '15-07-1993', 4100, 2),
('Joaquim', 'joaquim@hotmail.com', 'M', '01-05-1994', 3300, 3),
('Sandro', 'sandro@gmail.com', 'M', '01-05-1996', 4700, 5),
('Henrique', 'henrique@gmail.com', 'M', '07-07-1995', 3500, 6),
('Maria', 'maria@gmail.com', 'F', '07-07-1995', 4100, 3),
('Penha', 'penha@gmail.com', 'F', '07-07-1988', 5000, 5),
('Laura', 'laura@gmail.com', 'F', '07-07-1990', 5500, 5);

SELECT * FROM funcionario;

SELECT COUNT(*) AS contagem_funcionario FROM funcionario WHERE sexo = 'M';

SELECT * FROM funcionario ORDER BY data_nascimento DESC;

SELECT AVG(salario) AS media_salarial FROM funcionario;

SELECT departamento_id, MIN(salario) AS menor_salario, MAX(salario) AS maior_salario FROM funcionario GROUP BY departamento_id;

SELECT sexo, AVG(salario) AS media_salario, COUNT(id) AS quantidade FROM funcionario GROUP BY sexo;

-- QUANTAS PESSOAS TEM EM CADA DEPARTAMENTO?
SELECT departamento_id, COUNT(id) AS num_funcionario FROM funcionario
GROUP BY departamento_id;

--QUAL A SOMA DE SALARIO POR DEPARTAMENTO?
SELECT departamento_id, SUM(salario) AS soma_salario, COUNT(id) AS numero_pessoas
FROM funcionario
GROUP BY departamento_id;

-- Quantos homens tem por departamento e ganham mais de 3800
SELECT departamento_id, COUNT(id) AS num_funcionarios
FROM funcionario
WHERE sexo='M' AND salario>3800
GROUP BY departamento_id;

SELECT departamento_id, MAX(salario) AS max_salario
FROM funcionario
GROUP BY departamento_id
HAVING MAX(salario) > 4200;

--QUANTOS HOMENS TEM POR DEPARTAMENTO, GANHAM MAIS DE 3800 DESCONSIDERANDO 
--OS DEPARTAMENTOS QUE TENHAM APENAS UM HOMEM
SELECT departamento_id, COUNT(id) AS num_funcioarios 
FROM funcionario
WHERE sexo  = 'M' AND salario > 3800
GROUP BY departamento_id
HAVING COUNT(id) > 1;

--QUANTAS MULHERES QUE TEM EMAIL @GMAIL.COM TEM MEDIA DE SALARIO MAIOR QUE 4000 POR DEPARTAMENTO
SELECT departamento_id, COUNT(id) AS quantidade_mulheres, AVG(salario) AS media_salario
FROM funcionario
WHERE sexo = 'F' AND email LIKE '%@gmail.com'
GROUP BY departamento_id
HAVING AVG(salario) > 4000;

-- Crie uma View que traga a soma salarial,
--o maior salario e a quantidade de funcionarios por nome do departamento
--Contudo, apenas dos departamentos que a soma salarial 

CREATE VIEW view_soma_salarial AS(
	SELECT 
	d.departamento, 
	MAX(f.salario) AS max_salario,
	SUM(f.salario) AS soma_salario,
	COUNT(f.id) AS contagem
	FROM funcionario AS F
	INNER JOIN departamentos AS d
	ON d.id = f.departamento_id
	GROUP BY d.departamento
	HAVING SUM(f.salario) > 13000
);

CREATE VIEW view_homem_mulher_media_salario AS (
	SELECT
	d.departamento,
	f.sexo,
	AVG(f.salario) AS media_salario
	FROM funcionario AS f
	INNER JOIN departamentos AS d
	ON f.departamento_id = d.id
	WHERE(f.sexo = 'M' AND MONTH(f.data_nascimento) = '05') or (f.sexo = 'F' AND MONTH(f.data_nascimento) = '07')
	GROUP BY d.departamento, f.sexo
);

DROP VIEW view_homem_mulher_media_salario;

SELECT * FROM view_homem_mulher_media_salario;

--Trazer o menor e o maior preço de cada categoria
--(alguns produtos podem ter preçoes iguais) e a descrição de cada produto

WITH base_table AS (
SELECT
	id_categoria,
	SUM(preco) AS soma_preco,
	AVG(preco) AS media_preco,
	MIN(preco) AS min_preco,
	MAX(preco) AS max_preco
FROM produtos
GROUP BY id_categoria)
SELECT 
	bt.id_categoria,
	p.descricao,
	p.preco
	FROM base_table AS bt
	INNER JOIN produtos p
	ON bt.id_categoria = p.id_categoria
	AND (bt.min_preco = p.preco OR bt.max_preco = p.preco);

--Trazer o menor salário de cada departamento e o nome do 
--funcionario que recebe esse valor. Trazer o nome do departamento
WITH base_table AS (
	SELECT 
		d.id,
		d.departamento,
		MIN(salario) AS menor_salario
	FROM departamentos d
	INNER JOIN funcionario f
	ON f.departamento_id = d.id
	GROUP BY d.id, d.departamento
)

SELECT
	bt.departamento,
	bt.menor_salario
FROM funcionario f
INNER JOIN base_table bt
ON bt.id = f.departamento_id 
AND bt.menor_salario = f.salario


SELECT 
departamento_id,
nome,
YEAR(data_nascimento) AS ano_nascimento,
FIRST_VALUE(YEAR(data_nascimento)) OVER(PARTITION BY departamento_id ORDER BY YEAR(data_nascimento)) AS menor_ano
FROM funcionario
ORDER BY departamento_id

SELECT 
	id_categoria,
	preco,
	LAG(preco) OVER(PARTITION BY id_categoria ORDER BY preco),
FROM produtos
	ORDER BY id_categoria
	ORDER BY produtos

	