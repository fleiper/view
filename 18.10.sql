CREATE DATABASE EMPRESA_TURMA1_E;
USE EMPRESA_TURMA1_E;

CREATE TABLE departamento(
id_departamento int auto_increment primary key,
nome varchar (50)
);

CREATE TABLE funcionario(
id_funcionario int auto_increment primary key,
salario decimal (10,2),
nome varchar (100),
id_departamento int,
foreign key (id_departamento) references departamento (id_departamento)
);

CREATE TABLE dependente(
id_dependente int auto_increment primary key,
nome varchar (100),
id_funcionario int,
foreign key (id_funcionario) references funcionario (id_funcionario)
);

insert into departamento (nome)
values ("RH"),
	("T.I"),
    ("FINANCEIRO"),
    ("ADMINISTRATIVO"),
    ("VENDAS");
select * from departamento;

insert into funcionario (salario,nome,id_departamento)
values (3000.00,"CAIO",1),
	(3000.00, "Fellipe",2),
    (3000.00, "Adriano",2),
    (4500.00,"Nicolle",3),
    (4500.00,"Adauto",3),
    (2000.00,"Julio",4);
select * from funcionario;

insert into dependente (nome,id_funcionario)
values 
	("Enrolados",2),
    ("Bob Esponja",3),
    ("Matt",4),
    ("McQueen",5),
	("Max",2),
    ("Patrick",3),
	("Carlos",2),
    ("Seu sirigueijo",3);
   
    
select * from dependente;

#ATIVIDADE 1
select funcionario.nome as funcionario, count(dependente.id_dependente) as N°_dependentes
from funcionario
join dependente
on funcionario.id_funcionario = dependente.id_funcionario
group by funcionario.id_funcionario
having count(dependente.id_dependente)>2;

#ATIVIDADE 2
select departamento.nome as departamento, funcionario.nome as nome_funcionario
from departamento
left join funcionario
on departamento.id_departamento = funcionario.id_departamento
order by departamento.nome, funcionario.nome;

#ATIVIDADE 3
select funcionario.id_funcionario,funcionario.nome,count(dependente.id_dependente) as dependentes
from funcionario
left join dependente
on funcionario.id_funcionario = dependente.id_funcionario
group by funcionario.id_funcionario, funcionario.nome;

#ATIVIDADE 4
select avg(salario) from funcionario;

#ATIVIDADE 5
select departamento.nome, funcionario.nome
from departamento
inner join funcionario
on id_departamento = id_funcionario
where departamento is null;

#ATIVIDADE 6
select sum(salario) from funcionario;

#ATIVIDADE 7
select departamento.nome as departamento, sum(funcionario.salario) as custos
from departamento
left join funcionario
on departamento.id_departamento = funcionario.id_departamento
group by departamento.id_departamento, departamento.nome;


