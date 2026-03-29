	CREATE DATABASE Escola;

	CREATE TABLE Aluno (
	registro INT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	dataNaxcimento DATE
	);
	
	CREATE TABLE Professor (
	codigo INT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	email VARCHAR(45),
	titulacao ENUM ('grad','espec','msc','dr')
	);
	
	CREATE TABLE Disciplima(
	id INT  AUTO_INCREMENT  PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	cargaHoraria INT,
	livro VARCHAR(45) UNIQUE
	);
	
	CREATE TABLE Turma (
	codigo INT PRIMARY KEY,
	disciplina INT,
	sigla VARCHAR(10) DEFAULT ('ctds2023-1'),
	nAlunos INT,
	sala VARCHAR(10),
	professor INT,
	FOREIGN KEY (disciplina) REFERENCES Disciplima (id),
	FOREIGN KEY (professor) REFERENCES Professor (codigo)
	);
	
	CREATE TABLE Matricula (
	id INT AUTO_INCREMENT PRIMARY KEY,
	turma INT,
	aluno INT,
	ano DATE,
	nota DECIMAL(8.2),
	FOREIGN KEY (aluno) REFERENCES Aluno (registro),
	FOREIGN KEY (turma) REFERENCES Turma(codigo)
	);
	
-----Alteração da tabela--------

 ---ALTER TABLE Aluno ADD COLUMNS cidade VARCHAR(45);
	  ALTER TABLE Aluno ADD COLUMN cidade VARCHAR(45);
	  ALTER TABLE Disciplina MODIFY COLUMN nome VARCHAR(45) NULL;
	  ALTER TABLE MODIFY COLUMN cidade VARCHAR(45) DEFAULT 'Jaraguá do Sul';
	 ----acrescentar a coluna Frequência para Matrícula
	 ----acrescentar uma restrição para que a nota de um aluno seja sempre maior ou igual a zero
	 
	 ALTER TABLE Matricula ADD COLUMN Frequencia int;
	 ALTER TABLE Matricula  MODIFY COLUMN nota DECIMAL(5.2) CHECK (nalunos >=0);
	 
	 ----Inserir dados
	 INSERT INTO aluno (registro, nome, dataNascimento)
			VALUES (1000, 'Henry', '2000-07-10'); 
			
	INSERT INTO aluno (registro, nome, dataNascimento)
			VALUES (1001, 'Caio', '2001-07-10'); 
			
	INSERT INTO aluno (registro, nome, dataNascimento)
			VALUES (1002, 'Iury', '2002-07-10'); 
			
	INSERT INTO Disciplina (id, nome, cargaHoraria, livro)
			VALUES (NULL, 'Banco de Dados', 80, 'Intodução à Banco de Dados');
			

	INSERT INTO Professor(codigo, nome, email, titilacao)
			VALUES(1000, 'Bruno', 'bruno@ifsc.edu.br', 'Mestrado');
			
	INSERT INTO Turma (codigo, disciplina, sigla, sala, professor)
			VALUES(1000, 1, 0, 'B-302', 1000);
			
	INSERT INTO Matricula (id, turma, aluno, ano, nota)
			VALUES(NULL, 1000, 1002, 2026, NULL);
			
	  
	-----ALTER TABLE turma MODIFY COLUMN sigla VARCHAR(20) DEFAULT 'ctds2023-1'