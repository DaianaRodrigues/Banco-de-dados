SELECT * FROM categorias;

CREATE PROCEDURE buscar_categoria
	@nome_categoria VARCHAR(20)
	AS
	SET @nome_categoria = '%' + @nome_categoria + '%'

	SELECT * FROM categorias
	WHERE nome LIKE @nome_categoria;

EXEC buscar_categoria 'TI';

CREATE PROCEDURE busca_contagem_produtos
	@nome_categoria VARCHAR(20)
	AS
	SET @nome_categoria = '%' + @nome_categoria + '%'

	SELECT
	COUNT(p.id) AS contagem_produto,
	c.nome
	FROM produtos AS p
	JOIN categorias AS c
	ON p.id_categoria = c.id
	WHERE c.nome LIKE @nome_categoria
	GROUP BY c.nome;

EXEC busca_contagem_produtos 'Games';

CREATE TRIGGER tr_log
ON categorias
AFTER UPDATE, INSERT, DELETE
AS
SELECT * FROM categorias

CREATE PROCEDURE inserir_categoria
	@nome_categoria VARCHAR(50),
	@ativo CHAR(3)
AS
	BEGIN
		INSERT INTO categorias (nome, ativa) 
		VALUES (@nome_categoria, @ativo);
	END;

EXEC inserir_categoria 'Roupas', '[v]'



