
CREATE TABLE diretor(
	id INT IDENTITY(1,1),
	nome VARCHAR(250)
);

CREATE TABLE filmes(
	id_filmes INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	nome_em_portugues VARCHAR(100),
	nome_original VARCHAR(100),
	ano_lan�amento INT,
	tipo VARCHAR(50),
	sinopse TEXT,
)

INSERT INTO filmes (nome_em_portugues, nome_original, ano_lan�amento, sinopse) 
VALUES ('Jurassic Park - Parque dos Dinossauros', 'Jurassic Park', 1993,'Os paleont�logos Alan Grant, Ellie Sattler e o matem�tico Ian Malcolm fazem parte de um seleto grupo escolhido para visitar uma ilha habitada por dinossauros criados a partir de DNA pr�-hist�rico. O idealizador do projeto e bilion�rio John Hammond garante a todos que a instala��o � completamente segura. Mas ap�s uma queda de energia, os visitantes descobrem, aos poucos, que v�rios predadores ferozes est�o soltos e � ca�a.');

CREATE TABLE genero(
	id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Tipo VARCHAR(100)
);

CREATE TABLE horarios(
	id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	horarios TIME
);

CREATE TABLE sala_do_filme(
	id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
);

CREATE TABLE salas(
	id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	nome VARCHAR(100),
	capacidade CHAR(150),
);

ALTER TABLE diretor ADD diretor_id INT;
ALTER TABLE diretor ADD FOREIGN KEY (diretor_id) REFERENCES filmes(id_filmes);

SELECT * FROM filmes;
SELECT * FROM diretor;
SELECT * FROM genero;

INSERT INTO diretor (nome) VALUES ('Steven Spielberg');
INSERT INTO genero(tipo) VALUES ('aventura,
fic��o cient�fica');

ALTER TABLE genero ADD genero_id INT;
ALTER TABLE genero ADD FOREIGN KEY (genero_id) REFERENCES filmes(id_filmes);

