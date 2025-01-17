/*

30.	Incluir na tabela VALOR_PRODUTO os campos:
usuario VARCHAR2(30)
data_atual DATE

Alterar a trigger verifica_valor da apostila para que tamb�m sejam 
inclu�dos na tabela valor_produto a data do sistema no momento da 
atualiza��o e o nome do usu�rio que realizou a altera��o no campo valor.
*/
CREATE OR REPLACE TRIGGER VERIFICA_VALOR
BEFORE UPDATE OF VALOR ON PRODUTO
FOR EACH ROW
BEGIN
	INSERT INTO VALOR_PRODUTO
	(CODIGO, VALOR_ANTERIOR, VALOR_NOVO, USUARIO, DATA_ATUAL)
	VALUES
	(:OLD.CODIGO, :OLD.VALOR, :NEW.VALOR, USER, SYSDATE);
END;

/*
31.	Criar uma Trigger que insira um novo registro na tabela AUDIT_EMP 
cada vez que um registro da tabela EMP for inserido, atualizado ou 
exclu�do, gravando nos campos abaixo os seguintes valores:

USER_NAME = User
TIMESTAMP = Data sistema
EMPNO = C�digo antigo do empregado
OLD_NAME = Nome antigo do empregado
NEW_NAME = Nome novo do empregado
OLD_JOB = Cargo antigo do empregado
NEW_JOB = Cargo novo do empregado
OLD_MGR = C�digo antigo do gerente do empregado
NEW_MGR = C�digo novo do gerente do empregado
OLD_SAL = Sal�rio antigo do empregado
NEW_SAL = Sal�rio novo do empregado

Criar a tabela de auditoria chamada AUDIT_EMP, conforme comando abaixo:
*/
CREATE TABLE AUDIT_EMP 
(USER_NAME VARCHAR2(10),
TIMESTAMP DATE,
EMPNO NUMBER(5),
OLD_NAME VARCHAR2(20),
NEW_NAME VARCHAR2(20),
OLD_JOB VARCHAR2(10),
NEW_JOB VARCHAR2(10),
OLD_MGR NUMBER(5),
NEW_MGR NUMBER(5),
OLD_SAL NUMBER(12,2),
NEW_SAL NUMBER(12,2));

CREATE OR REPLACE TRIGGER AUDIT_EMP_VALUES
AFTER INSERT OR UPDATE OR DELETE ON EMP
FOR EACH ROW
BEGIN
	INSERT INTO AUDIT_EMP
	(USER_NAME, TIMESTAMP, EMPNO, OLD_NAME, NEW_NAME, OLD_JOB, NEW_JOB, 
	OLD_MGR, NEW_MGR, OLD_SAL, NEW_SAL) -- OPCIONAL
	VALUES
	(USER, SYSDATE, :OLD.EMPNO, :OLD.ENAME, :NEW.ENAME, :OLD.JOB, :NEW.JOB,
	:OLD.MGR, :NEW.MGR, :OLD.SAL, :NEW.SAL);
END;

