create database TaskFlowDB;

use TaskFlowDB;

create table register_user(
id_registro int not null auto_increment primary key,
nombre varchar(100) not null,
apellido varchar(100) not null,
correo varchar(200) not null unique,
contrasena varchar(255) not null);

create table login_user(
id_user int not null auto_increment primary key,
name_user varchar(50) not null unique,
contrasena varchar(255) not null,
id_registro int not null,
constraint fk_login_register foreign key (id_registro) references register_user (id_registro) on delete cascade);

create table team(
id_team int not null auto_increment primary key,
name_team varchar (100) not null,
code_team varchar(5) unique);

create table members_team(
id_member int not null auto_increment primary key,
user_id int not null,
team_id int not null,
rol_in_team varchar(50) default 'Participante',
constraint fk_member_user foreign key (user_id) references register_user (id_registro) on delete cascade,
constraint fk_member_team foreign key (team_id) references team (id_team) on delete cascade);

create table tasks(
id_task int not null auto_increment primary key,
title varchar(500) not null,
description varchar(600) not null,
status varchar(200) not null,
date_limit datetime,
creator_id int not null,
team_id int not null,
constraint fk_creator_user foreign key (creator_id) references register_user(id_registro) on delete cascade,
constraint fk_team foreign key (team_id) references team (id_team) on delete cascade);

create table task_assignments(
id_assignment int not null auto_increment primary key,
task_id int not null,
user_assignment int not null,
constraint fk_task_id foreign key (task_id) references tasks (id_task) on delete cascade,
constraint fk_user_assingment foreign key (user_assignment) references register_user (id_registro) on delete cascade);

insert into 
	register_user (nombre, apellido, correo, contrasena) values 
    ('Juan David','Agudelo Aldana','juanagudelo@gmail.com','Juanda12345'),
    ('Kevin Daniel','Mendez Rodriguez','kdmendez12@gmail.com','Kmendez25R');
    
insert into
	login_user (name_user, contrasena, id_registro) values
    ('juanagudelo@gmail.com','Juanda12345', 1),
    ('kdmendez12@gmail.com','Kmendez25R', 2);
    
select
	lu.id_user,
    lu.name_user,
    lu.contrasena AS contrasena_encriptada,
    ru.id_registro,
    ru.nombre,
    ru.apellido,
    ru.correo
from login_user lu
inner join register_user ru ON lu.id_registro = ru.id_registro
where lu.name_user = 'kdmendez12@gmail.com';