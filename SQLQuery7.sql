USE clientes_db;

--JOINS

CREATE TABLE categorias(
	id INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(30),
	ativa CHAR(3),
	PRIMARY KEY (id)
);

insert into categorias (nome, ativa) Values
('Informatica','[v]'),
('Telefonia','[v]'),
('Games','[v]'),
('TV, Audio e Video','[v]'),
('Impress?o e imagem','[v]');

SELECT * FROM categorias;

CREATE TABLE produtos (
	id INT NOT NULL IDENTITY(1,1),
	id_categoria INT,
	descricao VARCHAR(50),
	preco INT,
	url_imagem VARCHAR(100),
	PRIMARY KEY (id)
);

insert into produtos (id_categoria, descricao, preco) values
(1,'SSD 128GB', 300),
(1,'SSD 256GB', 500),
(1,'KIT TECLADO E MOUSE', 600),
(3,'PLAYSTATION 3', 1500),
(2,'SAMSUNG A51', 2500),
(4,'TELEVIS?O LG 55"', 3000),
(3,'PLAYSTATION 3 1TB', 1500),
(2,'SAMSUNG S9', 2500),
(2,'IPHONE 8', 2500),
(2,'IPHONE 9', 3000),
(2,'IPHONE X', 4000),
(4,'TELEVIS?O SAMSUNG 32"', 1000),
(4,'TELEVIS?O SAMSUNG 48"', 3000),
(3,'PLAYSTATION 4 1TB', 2800),
(3,'PLAYSTATION 5 1TB', 5000),
(1,'Teclado Razer Gamer', 250),
(1,'Fone de ouvido Hyperx',170),
(1,'Mouse Gamer Razer', 90),
(1,'Mouse Gamer Razer 2400', 200)

insert into produtos (descricao, preco) values
('Mouse Gamer', 280),
('Teclado Gamer', 390);

SELECT * FROM produtos;

--TRAZER APENAS PRODUTOS QUE TENHAM CATEGORIA: INNER JOIN
SELECT * FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id;

--TRAZER TODOS OS PRODUTOS MESMO OS QUE NAO TEM CATEGORIA E AINDA ASSIM TRAZER A LISTAGEM DE CATEGORIAS
SELECT * FROM produtos p
LEFT JOIN categorias c
ON p.id_categoria = c.id;

--TRAZER TUDO DA TABEA DIREITA INCLUSIVE AS CATEGORIA QUE NAO TEM PRODUTO: RIGHT JOIN
SELECT * FROM produtos p
RIGHT JOIN categorias c
ON p.id_categoria = c.id;

--TRAZER TUDO DE TODOS: FULL JOIN
SELECT * FROM produtos p
FULL JOIN categorias c
ON p.id_categoria = c.id;

-- MAIOR PRE?O POR CATEGORIA, TRAZENDO QUAL CATEGORIA O PRODUTO ?, APENAS PRODUTOS CATEGORIZADOS
SELECT c.nome, MAX(p.preco) AS max_preco
FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id
GROUP BY c.nome;

-- MENOR E MAIOR PRE?O DO PRODUTO DA CATEGORIA GAME E TELEFONIA
SELECT c.nome, MAX(p.preco) AS max_preco, MIN(p.preco) AS min_preco
FROM produtos p
	INNER JOIN categorias c
	ON p.id_categoria = c.id
WHERE c.nome = 'GAMES' OR c.nome = 'TELEFONIA'
GROUP BY c.nome;


-- QUANTO CUSTA O MAIOR PRODUTO N?O CATALOGADO
SELECT MAX(preco)
FROM produtos p
LEFT JOIN categorias c
ON c.id = p.id_categoria
WHERE c.nome IS NULL;

-- Media de pre?o de todos os produtos por categoria
SELECT c.nome, AVG(p.preco) as preco_medio
FROM produtos p
LEFT JOIN categorias c
ON p.id_categoria = c.id
GROUP BY c.nome;

--QUAL o pre?o do mouse mais caro, traga o nome da sua categoria

WITH aux_table AS (SELECT YEAR(data_nascimento) AS ano,
	CASE 
		WHEN YEAR(data_nascimento) >= 1993 THEN 'True'
		ELSE 'False' 
	END AS 'is_millenium',
	id
FROM funcionario)

SELECT is_millenium, COUNT(id) AS contagem
FROM aux_table
GROUP BY is_millenium;

-- criacao de views

-- Crie uma view que traga a m?dia salarial 
--dos homens e mulheres que nasceram nos anos 90

CREATE VIEW view_mediasalario_sexo AS (
	SELECT sexo, AVG(salario) as media_salario
	FROM funcionario
	WHERE YEAR(data_nascimento) >= '1990'
	GROUP BY sexo
);

SELECT * FROM view_mediasalario_sexo

INSERT INTO funcionario (nome, email, sexo, data_nascimento, salario, departamento_id) VALUES
('Diego', 'luana@gmail.com', 'M', '01-05-1996', 1000000, 1)