 SET SERVEROUTPUT ON
SET VERIFY OFF
/*
23. Criar uma procedure para inclus�o de dados na tabela produto.
Execute antes o comando para cria��o da tabela PRODUTO, conforme abaixo:
CREATE TABLE produto
(codigo NUMBER(4) primary key,nome VARCHAR2(20),valor NUMBER(7,2),
 categoria NUMBER(4));
*/

CREATE TABLE produto
(codigo NUMBER(4) primary key,nome VARCHAR2(20),valor NUMBER(7,2),
 categoria NUMBER(4));

CREATE OR REPLACE PROCEDURE INSERE_PRODUTO
(
	V_COD	IN	PRODUTO.CODIGO%TYPE		,
	V_NOME	IN	PRODUTO.NOME%TYPE		,
	V_VALOR	IN	PRODUTO.VALOR%TYPE		,
	V_CATEG	IN	PRODUTO.CATEGORIA%TYPE
)
IS
BEGIN
	INSERT INTO PRODUTO
	(CODIGO, NOME, VALOR, CATEGORIA)  -- OPCIONAL
	VALUES
	(V_COD, V_NOME, V_VALOR, V_CATEG)	;
EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
		DBMS_OUTPUT.PUT_LINE('C�DIGO DO PRODUTO J� CADASTRADO!');
END INSERE_PRODUTO; 

-------------------------

--EXECUTANDO A PROCEDURE

EXEC INSERE_PRODUTO(&CODIGO, '&NOME', &VALOR, &CATEGORIA);


/*
24. Criar uma procedure para consultar um produto na tabela PRODUTO, informando o c�digo atrav�s
de par�metro. Apresentar seu nome, valor e categoria.
Nota: Tratar erro caso o produto n�o seja encontrado.
Nota: Para executar a procedure, fa�a um bloco PL/SQL que chame a procedure passando par�metro.
*/

CREATE OR REPLACE PROCEDURE CONSULTA_PRODUTO
( -- AREA DE ARGUMENTOS
  V_COD IN PRODUTOS.CODIGO%TYPE
)
IS -- EQUIVALENTE AO DECLATE

V_NOME IN PRODUTO.NOME%TYPE;
V_VALOR PRODUTO.VALOR%TYPE;
V_CATEG PRODUTO.CATEGORIA%TYPE;

BEGIN
  SELECT CODIGO, NOME, VALOR, CATEGORIA 
  INTO  V_NOME, V_VALOR, V_CATEG
  FROM PRODUTO
  WHERE CODIGO = V_COD;

  DBMS_OUTPUT.PUT_LINE('C�DIGO: '|| V_COD);
  DBMS_OUTPUT.PUT_LINE('NOME: '|| V_NOME);
  DBMS_OUTPUT.PUT_LINE('CATEGORIA: '|| V_CATEG);  

EXCEPTION
  WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('CODIGO N�O ENCONTRADO');
END CONSULTA_PRODUTO;

-- EXECUTANDO A PROCEDURE

DECLARE
V_COD PRODUTO.CODIGO%TYPE := &CODIGO;
BEGIN

	CONSULTA_PRODUTO(V_COD)	;
END;

/*
CORRE��O DA PROFESSORA
CREATE OR REPLACE PROCEDURE CONSULTA_PRODUTO
(
	V_COD	IN	PRODUTO.CODIGO%TYPE
)
IS -- EQUIVALENTE AO DECLARE
	V_NOME	PRODUTO.NOME%TYPE			;
	V_VALOR	PRODUTO.VALOR%TYPE			;
	V_CATEG PRODUTO.CATEGORIA%TYPE		;
BEGIN
	SELECT 	NOME, 	VALOR,	 CATEGORIA
	INTO	V_NOME, V_VALOR, V_CATEG
	FROM	PRODUTO
	WHERE	CODIGO = V_COD				;
	DBMS_OUTPUT.PUT_LINE('C�DIGO: ' || V_COD)		;
	DBMS_OUTPUT.PUT_LINE('NOME: ' || V_NOME)		;
	DBMS_OUTPUT.PUT_LINE('CATEGORIA: ' || V_CATEG)	;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('C�DIGO N�O ENCONTRADO!')	;
END CONSULTA_PRODUTO;

--------------

-- EXECUTANDO A PROCEDURE

DECLARE
	V_COD	PRODUTO.CODIGO%TYPE	:= &CODIGO	;
BEGIN
	CONSULTA_PRODUTO(V_COD)	;
END;


*/







/*
25. Criar a procedure NOTAS para atualizar valores em alguns campos da tabela ALUNO, conforme as
seguintes regras:
? MEDIA: (NOTA1+NOTA2)/2
? RESULTADO: MEDIA >= 7 ? 'APROVADO '
? RESULTADO: MEDIA < 7 ? 'EXAME '
Nota: Antes da procedure, criar a tabela e inserir linhas, conforme comandos abaixo:
CREATE TABLE ALUNO (RA NUMBER(5) PRIMARY KEY, NOME VARCHAR2(20),
NOTA1 NUMBER(3,1), NOTA2 NUMBER(3,1), MEDIA NUMBER(3,1), RESULTADO VARCHAR2(10));
INSERT INTO ALUNO (RA,NOME,NOTA1,NOTA2) VALUES (1,'ANTONIO',9,7);
INSERT INTO ALUNO (RA,NOME,NOTA1,NOTA2) VALUES (2,'BEATRIZ',4,6);
INSERT INTO ALUNO (RA,NOME,NOTA1,NOTA2) VALUES (3,'CLAUDIO',8,6);
*/
CREATE TABLE ALUNO (RA NUMBER(5) PRIMARY KEY, NOME VARCHAR2(20),
NOTA1 NUMBER(3,1), NOTA2 NUMBER(3,1), MEDIA NUMBER(3,1), RESULTADO VARCHAR2(10));
INSERT INTO ALUNO (RA,NOME,NOTA1,NOTA2) VALUES (1,'ANTONIO',9,7);
INSERT INTO ALUNO (RA,NOME,NOTA1,NOTA2) VALUES (2,'BEATRIZ',4,6);
INSERT INTO ALUNO (RA,NOME,NOTA1,NOTA2) VALUES (3,'CLAUDIO',8,6);

CREATE OR REPLACE PROCEDURE NOTAS
(

)

IS
  CURSOR C_ALUNO IS SELECT * FROM ALUNO;
  V_MEDIA ALUNO.MEDIA%TYPE;
  V_RESULT ALUNO.RESULTADO%TYPE;
BEGIN
  FOR V_REGALUNO IN C_ALUNO LOOP
  V_MEDIA := (V_REGALUNO.NOTA1 + V_REGALUNO.NOTA2) /2 ;
  
  IF V_MEDIA >= 7 THEN
  V_RESULT := 'APROVADO';
  ELSE 
  V_RESULT := 'REPROVADO';
  END IF;
  
  UPDATE ALUNO
  SET
  MEDIA = V_MEDIA, RESULTADO = V_RESULT
  WHERE RA = V_REGALUNO.RA;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('REGISTROS ATUALIZADOS COM SUCESSO');
END NOTAS;

-----------

EXEC NOTAS


/*
CORRE��O PROFESSORA
CREATE OR REPLACE PROCEDURE NOTAS
IS
	CURSOR C_ALUNO IS SELECT * FROM ALUNO	;
	V_MEDIA		ALUNO.MEDIA%TYPE			;
	V_RESULT 	ALUNO.RESULTADO%TYPE		;
BEGIN
	FOR V_REGALUNO IN C_ALUNO LOOP
		V_MEDIA := (V_REGALUNO.NOTA1 + V_REGALUNO.NOTA2) / 2 ;
		IF V_MEDIA >= 7 THEN
			V_RESULT := 'APROVADO'	;
		ELSE
			V_RESULT := 'REPROVADO'	;
		END IF;	
		UPDATE ALUNO
		SET
		MEDIA = V_MEDIA, RESULTADO = V_RESULT
		WHERE RA = V_REGALUNO.RA			;
	END LOOP;	
	DBMS_OUTPUT.PUT_LINE('REGISTROS ATUALIZADOS COM SUCESSO!');
END NOTAS;

---------------

-- EXECUTANDO A PROCEDURE

EXEC NOTAS


*/

END NOTAS;

