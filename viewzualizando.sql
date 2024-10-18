create database viewzualiando;
use viewzualiando;

CREATE TABLE FUNC (
    COD INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(50),
    ESPECIALIDADE VARCHAR(250)
);
select * from func;

CREATE TABLE DEPEN(
cod INT auto_increment primary key,
nome VARCHAR(50),
cod_func int ,
foreign key (cod_func) references FUNC (COD)
);

SELECT * FROM DEPEN;
SELECT * FROM FUNC;

insert into FUNC (nome,especialidade)
values ("josé","engenheiro"),
("João", "mestre das obras"),
("maria", "contabilista");

insert into DEPEN (nome,cod_func)
values ("pedro", 1),
("alice",1),
("luana",3);

select FUNC.NOME, DEPEN.NOME
from FUNC
inner join DEPEN
on FUNC.COD = DEPEN.COD_FUNC
WHERE FUNC.COD = 1;

SELECT FUNC.NOME, DEPEN.NOME
FROM FUNC
LEFT JOIN DEPEN
ON FUNC.COD = DEPEN.COD_FUNC;

SELECT FUNC.NOME, DEPEN.NOME
FROM FUNC
LEFT JOIN DEPEN
ON FUNC.COD = DEPEN.COD_FUNC
WHERE DEPEN.NOME is null;

SELECT FUNC.NOME, DEPEN.NOME
FROM FUNC
RIGHT JOIN DEPEN
ON FUNC.COD = DEPEN.COD_FUNC;




#####VIEW#####
CREATE VIEW vw_lista_funcionarios as
SELECT NOME, ESPECIALIDADE
FROM FUNC;

SELECT * from vw_lista_funcionarios;

CREATE VIEW vw_lista_dependentes as
SELECT NOME
FROM DEPEN;
SELECT * from vw_lista_dependentes;


CREATE VIEW vw_lista_funcionarios_e_dependentes as
select FUNC.COD, FUNC.NOME AS NOME_FUNCIONARIO, DEPEN.NOME AS NOME_DEPENDENTE
from FUNC
inner join DEPEN
on FUNC.COD = DEPEN.COD_FUNC;

CREATE VIEW vw_lista_funcionarios_com_dependentes_usando_left as
select FUNC.COD, FUNC.NOME AS NOME_FUNCIONARIO, DEPEN.NOME AS NOME_DEPENDENTE
from FUNC
left join DEPEN
on FUNC.COD = DEPEN.COD_FUNC;

CREATE VIEW vw_lista_funcionarios_com_dependentes_usando_leftEx as
select FUNC.COD, FUNC.NOME AS NOME_FUNCIONARIO, DEPEN.NOME AS NOME_DEPENDENTE
from FUNC
left join DEPEN
on FUNC.COD = DEPEN.COD_FUNC
where DEPEN.COD_FUNC is null;

CREATE VIEW vw_lista_funcionarios_com_dependentes_usando_right as
select FUNC.COD, FUNC.NOME AS NOME_FUNCIONARIO, DEPEN.NOME AS NOME_DEPENDENTE
from FUNC
right join DEPEN
on FUNC.COD = DEPEN.COD_FUNC;

CREATE VIEW vw_lista_funcionarios_com_dependentes_usando_rightEx as
select FUNC.COD, FUNC.NOME AS NOME_FUNCIONARIO, DEPEN.NOME AS NOME_DEPENDENTE
from FUNC
right join DEPEN
on FUNC.COD = DEPEN.COD_FUNC
where DEPEN.COD_FUNC is null;

#1
SELECT * FROM vw_lista_funcionarios_com_dependentes;

#2
SELECT * FROM vw_lista_funcionarios_com_dependentes_usando_left;

#3
SELECT * FROM vw_lista_funcionarios_com_dependentes_usando_leftEx;

#4
SELECT * FROM vw_lista_funcionarios_com_dependentes_usando_right;

#5
SELECT * FROM vw_lista_funcionarios_com_dependentes_usando_rightEx;