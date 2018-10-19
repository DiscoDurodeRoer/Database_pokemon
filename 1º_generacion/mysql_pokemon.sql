use pokemondb;


/*Tablas*/

Create table if not exists pokemon  (
	numero_pokedex int primary key AUTO_INCREMENT,
    nombre varchar(15),
    peso real,
    altura real, 
    evoluciona_de int,
    foreign key (evoluciona_de) references pokemon(numero_pokedex)
);

Create table if not exists tipo_ataque  (
	id_tipo_ataque int primary key AUTO_INCREMENT,
	tipo varchar(8)
);


Create table if not exists tipo (
	id_tipo int primary key AUTO_INCREMENT, 
    nombre varchar(10),
    id_tipo_ataque int,
	foreign key (id_tipo_ataque) references tipo_ataque(id_tipo_ataque)
);
 
 
Create table if not exists pokemon_tipo  (
	numero_pokedex int,
    id_tipo int,
    primary key(numero_pokedex, id_tipo),
    foreign key (numero_pokedex) references pokemon(numero_pokedex),
    foreign key (id_tipo) references tipo(id_tipo)
);

Create table if not exists estadisticas_base  (
	numero_pokedex int primary key,
    ps int,
    ataque int,
    defensa int,
    especial int,
    velocidad int,
	foreign key (numero_pokedex) references pokemon(numero_pokedex)
);


Create table if not exists movimiento  (
	id_movimiento int primary key AUTO_INCREMENT,
    nombre varchar(20),
    potencia int,
    precision_mov int,
    descripcion varchar(80),
    pp int,
    efecto_secundario varchar(15)

);

Create table if not exists forma_aprendizaje  (
	id_forma_aprendizaje int primary key AUTO_INCREMENT,
    forma_aprendizaje int
);

Create table if not exists MT  ( 
	id_forma_aprendizaje int primary key, 
    MT varchar(5),
    foreign key(id_forma_aprendizaje) references forma_aprendizaje(id_forma_aprendizaje)
);

Create table if not exists MO  ( 
	id_forma_aprendizaje int primary key, 
    MT varchar(5),
    foreign key(id_forma_aprendizaje) references forma_aprendizaje(id_forma_aprendizaje)
);

Create table if not exists nivel_aprendizaje  ( 
	id_forma_aprendizaje int primary key, 
    nivel int,
    foreign key(id_forma_aprendizaje) references forma_aprendizaje(id_forma_aprendizaje)
);


Create table if not exists pokemon_movimiento_forma  (
	numero_pokedex int,
    id_movimiento int,
    id_forma_aprendizaje int,
    primary key(numero_pokedex, id_movimiento, id_forma_aprendizaje),
    foreign key (numero_pokedex) references pokemon(numero_pokedex),
    foreign key (id_movimiento) references movimiento(id_movimiento),
    foreign key (id_forma_aprendizaje) references forma_aprendizaje(id_forma_aprendizaje)
);


 Create table if not exists forma_evolucion  (
	id_forma_evolucion int primary key,
    tipo_evolucion int
);



Create table if not exists tipo_piedra  (
	id_tipo_piedra int primary key,
    nombre_piedra varchar(20)
);

Create table if not exists piedra  (
	id_forma_evolucion int primary key,
    id_tipo_piedra int,
    foreign key (id_tipo_piedra) references tipo_piedra(id_tipo_piedra),
    foreign key (id_forma_evolucion) references forma_evolucion(id_forma_evolucion)
);

Create table if not exists nivel_evolucion  (
	id_forma_evolucion int primary key,
    nivel int,
    foreign key (id_forma_evolucion) references forma_evolucion(id_forma_evolucion)
);

Create table if not exists pokemon_forma_evolucion  (
	numero_pokedex int,
    id_forma_evolucion int,
    primary key(numero_pokedex,id_forma_evolucion),
    foreign key (numero_pokedex) references pokemon(numero_pokedex),
    foreign key (id_forma_evolucion) references forma_evolucion(id_forma_evolucion)
);

/* insercion de datos */

insert into tipo_ataque values(1, 'Físico');
insert into tipo_ataque values(2, 'Especial');


insert into tipo values (1, 'Agua', 2);
insert into tipo values (2, 'Bicho', 1);
insert into tipo values (3, 'Dragón', 2);
insert into tipo values (4, 'Eléctrico', 2);
insert into tipo values (5, 'Fantasma', 1);
insert into tipo values (6, 'Fuego', 2);
insert into tipo values (7, 'Hielo', 2);
insert into tipo values (8, 'Lucha', 1);
insert into tipo values (9, 'Normal', 1);
insert into tipo values (10, 'Planta', 2);
insert into tipo values (11, 'Psíquico', 2);
insert into tipo values (12, 'Roca', 1);
insert into tipo values (13, 'Tierra', 1);
insert into tipo values (14, 'Veneno', 1);
insert into tipo values (15, 'Volador', 1);


/*ejemplo insercion bulbasaur*/
insert into pokemon values (1, 'Bulbasaur', 6.9, 0.7, null);
insert into pokemon values (2, 'Ivysaur', 13, 1, 1);

insert into pokemon_tipo values (1,10);
insert into pokemon_tipo values (1,14);

insert into pokemon_tipo values (1,10);
insert into estadisticas_base values (1,45, 49,49,65,45);


insert into movimiento values(1, 'Placaje', 40, 100, 'Causa daño', 35, null);
insert into movimiento values(2, 'Danza espada', 0, 100, 'Aumenta en dos niveles el ataque del usuario', 30, 'Subir ataque');

insert into forma_aprendizaje values(1, -1);
insert into forma_aprendizaje values(2, -1);

insert into MT values(1, 'MT03');
insert into nivel_aprendizaje values(2, 1);



insert into pokemon_movimiento_formaforma_evolucion values(1, 1, 2);
insert into pokemon_movimiento_forma values(1, 2, 1);


insert into forma_evolucion values(1, -1);
insert into nivel_evolucion values(1, 16);

insert into pokemon_forma_evolucion values(1, 1);














