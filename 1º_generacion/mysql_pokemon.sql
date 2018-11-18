use pokemondb;

/*Borrado de tablas*/

drop table if exists MO;
drop table if exists MT;
drop table if exists nivel_aprendizaje;
drop table if exists pokemon_tipo;
drop table if exists piedra;
drop table if exists tipo_piedra;
drop table if exists tipo_forma_aprendizaje;
drop table if exists tipo_evolucion;
drop table if exists nivel_evolucion;
drop table if exists pokemon_forma_evolucion;
drop table if exists pokemon_movimiento_forma;
drop table if exists forma_evolucion;
drop table if exists forma_aprendizaje;
drop table if exists movimiento_efecto_secundario;
drop table if exists efecto_secundario;
drop table if exists movimiento;
drop table if exists tipo;
drop table if exists tipo_ataque;
drop table if exists tipo_forma_aprendizaje;
drop table if exists estadisticas_base;
drop table if exists evoluciona_de;
drop table if exists pokemon;


/*Tablas*/

Create table if not exists pokemon  (
	numero_pokedex int primary key AUTO_INCREMENT,
    nombre varchar(15),
    peso real,
    altura real
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
    descripcion varchar(500),
    pp int,
    efecto_secundario varchar(45)
);

Create table if not exists efecto_secundario  (
	id_efecto_secundario int primary key,
    efecto_secundario varchar(30)
);


Create table if not exists movimiento_efecto_secundario  (
	id_movimiento int,
    id_efecto_secundario int,
    probabilidad real, 
    primary key (id_movimiento, id_efecto_secundario),
    foreign key (id_movimiento) references movimiento(id_movimiento),
    foreign key (id_efecto_secundario) references efecto_secundario(id_efecto_secundario)
);

Create table if not exists forma_aprendizaje  (
	id_forma_aprendizaje int primary key AUTO_INCREMENT,
    tipo_aprendizaje int
);

Create table if not exists MT  ( 
	id_forma_aprendizaje int primary key, 
    MT varchar(5),
    foreign key(id_forma_aprendizaje) references forma_aprendizaje(id_forma_aprendizaje)
);

Create table if not exists MO  ( 
	id_forma_aprendizaje int primary key, 
    MO varchar(5),
    foreign key(id_forma_aprendizaje) references forma_aprendizaje(id_forma_aprendizaje)
);

Create table if not exists nivel_aprendizaje  ( 
	id_forma_aprendizaje int primary key, 
    nivel int,
    foreign key(id_forma_aprendizaje) references forma_aprendizaje(id_forma_aprendizaje)
);

Create table if not exists tipo_forma_aprendizaje  (
	id_tipo_aprendizaje int primary key AUTO_INCREMENT,
    tipo_aprendizaje varchar(20)
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

 Create table if not exists evoluciona_de  (
	pokemon int,
    pokemon_origen int,
	primary key(pokemon, pokemon_origen),
    foreign key (pokemon) references pokemon(numero_pokedex),
    foreign key (pokemon_origen) references pokemon(numero_pokedex)
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

 Create table if not exists tipo_evolucion  (
	id_tipo_evolucion int primary key,
    tipo_evolucion varchar(15)
);


Create table if not exists pokemon_forma_evolucion  (
	numero_pokedex int,
    id_forma_evolucion int,
    primary key(numero_pokedex,id_forma_evolucion),
    foreign key (numero_pokedex) references pokemon(numero_pokedex),
    foreign key (id_forma_evolucion) references forma_evolucion(id_forma_evolucion)
);

/* insercion de datos */

/*Tipos de ataques*/
insert into tipo_ataque values(1, 'Físico');
insert into tipo_ataque values(2, 'Especial');

/*Tipos*/
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

/*Pokemon*/

insert into pokemon values (1, 'Bulbasaur', 6.9, 0.7);
insert into pokemon values (2, 'Ivysaur', 13,1);
insert into pokemon values (3, 'Venasaur', 100, 2);
insert into pokemon values (4, 'Charmander', 8.5, 0.6);
insert into pokemon values (5, 'Charmeleon', 19, 1.1);
insert into pokemon values (6, 'Charizard', 90.5, 1.7);
insert into pokemon values (7, 'Squirtle', 9, 0.5);
insert into pokemon values (8, 'Wartortle', 22.5, 1);
insert into pokemon values (9, 'Blastoise', 85.5, 1.6);
insert into pokemon values (10, 'Caperpie', 2.9, 0.3);
insert into pokemon values (11, 'Metapod', 9.9, 0.7);
insert into pokemon values (12, 'Butterfree', 32,1.1);
insert into pokemon values (13, 'Weedle', 3.2,0.3);
insert into pokemon values (14, 'Kakuna', 10,0.6);
insert into pokemon values (15, 'Beedrill', 29.5,1.0);
insert into pokemon values (16, 'Pidgey', 1.8,0.3);
insert into pokemon values (17, 'Pidgeotto', 30,1.1);
insert into pokemon values (18, 'Pidgeot', 39.5,1.5);
insert into pokemon values (19, 'Rattata', 3.5,0.3);
insert into pokemon values (20, 'Raticate', 18.5,0.7);
insert into pokemon values (21, 'Spearow', 2,0.3);
insert into pokemon values (22, 'Fearow', 38,1.2);
insert into pokemon values (23, 'Ekans', 6.9,2);
insert into pokemon values (24, 'Arbok', 65,3.5);
insert into pokemon values (25, 'Pikachu', 6,0.4);
insert into pokemon values (26, 'Raichu', 30,0.8);
insert into pokemon values (27, 'Sandshrew', 12,0.6);
insert into pokemon values (28, 'Sandslash', 29.5,1);
insert into pokemon values (29, 'Nidoran♀', 7,0.4);
insert into pokemon values (30, 'Nidorina', 20,0.8);
insert into pokemon values (31, 'Nidoqueen', 60,1.3);
insert into pokemon values (32, 'Nidoran♂', 9,0.5);
insert into pokemon values (33, 'Nidorino', 19.5,0.9);
insert into pokemon values (34, 'Nidoking', 62,1.4);
insert into pokemon values (35, 'Clefairy', 7.5,0.6);
insert into pokemon values (36, 'Clefable', 40,1.3);
insert into pokemon values (37, 'Vulpix', 9.9,0.6);
insert into pokemon values (38, 'Ninetales', 19.9,1.1);
insert into pokemon values (39, 'Jigglypuff', 5.5,0.5);
insert into pokemon values (40, 'Wigglytuff', 12,1);
insert into pokemon values (41, 'Zubat', 7.5,0.8);
insert into pokemon values (42, 'Golbat', 55,1.6);
insert into pokemon values (43, 'Oddish', 5.4,0.5);
insert into pokemon values (44, 'Gloom', 8.6,0.8);
insert into pokemon values (45, 'Vileplume', 18.6,1.2);
insert into pokemon values (46, 'Paras', 5.4,0.3);
insert into pokemon values (47, 'Parasect', 29.5,1);
insert into pokemon values (48, 'Venonat', 30,1);
insert into pokemon values (49, 'Venomoth', 12.5,1.5);
insert into pokemon values (50, 'Digglet', 0.8,0.2);
insert into pokemon values (51, 'Dugtrio', 33.3,0.7);
insert into pokemon values (52, 'Meowth', 4.2,0.4);
insert into pokemon values (53, 'Persian', 32,1);
insert into pokemon values (54, 'Psyduck', 19.6,0.8);
insert into pokemon values (55, 'Golduck',  76.6,1.7);
insert into pokemon values (56, 'Mankey', 28, 0.5);
insert into pokemon values (57, 'Primeape', 32,1);
insert into pokemon values (58, 'Growlithe', 19,0.7);
insert into pokemon values (59, 'Arcanine', 155,1.9);
insert into pokemon values (60, 'Poliwag', 12.4,0.6);
insert into pokemon values (61, 'Poliwhirl', 20,1);
insert into pokemon values (62, 'Poliwrath', 54,1.3);
insert into pokemon values (63, 'Abra', 19.5,0.9);
insert into pokemon values (64, 'Kadabra', 56.5,1.3);
insert into pokemon values (65, 'Alakazam', 48,1.5);
insert into pokemon values (66, 'Machop', 19.5, 0.8);
insert into pokemon values (67, 'Mackoke', 70.5, 1.5);
insert into pokemon values (68, 'Machamp', 130,1.6);
insert into pokemon values (69, 'Bellsprout', 4.0,0.7);
insert into pokemon values (70, 'Weepinbell', 6.4,1);
insert into pokemon values (71, 'Victreebel', 15.5,1.7);
insert into pokemon values (72, 'Tentacool', 45.5,0.9);
insert into pokemon values (73, 'Tentacruel', 55,1.6);
insert into pokemon values (74, 'Geodude', 20,0.4);
insert into pokemon values (75, 'Graveler', 105,1);
insert into pokemon values (76, 'Golem', 300,1.4);
insert into pokemon values (77, 'Ponyta', 30,1);
insert into pokemon values (78, 'Rapidash', 95,1.7);
insert into pokemon values (79, 'Slowpoke', 36,1.2);
insert into pokemon values (80, 'Slowbro', 78.5,1.6);
insert into pokemon values (81, 'Magnemite', 6.0,0.3);
insert into pokemon values (82, 'Magneton', 60,1);
insert into pokemon values (83, 'Farfetch\'d', 15,0.8);
insert into pokemon values (84, 'Doduo', 39.2,1.4);
insert into pokemon values (85, 'Dodrio', 85.2,1.8);
insert into pokemon values (86, 'Seel', 90,1.1);
insert into pokemon values (87, 'Dewgong', 120,1.7);
insert into pokemon values (88, 'Grimer', 30,0.9);
insert into pokemon values (89, 'Muk', 30,1.2);
insert into pokemon values (90, 'Shellder', 4,0.3);
insert into pokemon values (91, 'Cloyster', 132.5,1.5);
insert into pokemon values (92, 'Gastly', 0.1,1.3);
insert into pokemon values (93, 'Haunter', 0.1,1.6);
insert into pokemon values (94, 'Gengar', 40.5,1.5);
insert into pokemon values (95, 'Onix', 210,8.8);
insert into pokemon values (96, 'Drowzee', 32.4,1);
insert into pokemon values (97, 'Hypno', 75.6,1.6);
insert into pokemon values (98, 'Krabby', 6.5,0.4);
insert into pokemon values (99, 'Kingler', 60,1.3);
insert into pokemon values (100, 'Voltorb', 10.4,0.5);
insert into pokemon values (101, 'Electrode', 66.6,1.2);
insert into pokemon values (102, 'Exeggcute', 2.5,0.4);
insert into pokemon values (103, 'Exeggutor', 120,2);
insert into pokemon values (104, 'Cubone', 6.5,0.4);
insert into pokemon values (105, 'Marowak', 45,1);
insert into pokemon values (106, 'Hitmonlee', 49.8,1.5);
insert into pokemon values (107, 'Hitmonchan', 50.2,1.4);
insert into pokemon values (108, 'Lickitung', 65,1.2);
insert into pokemon values (109, 'Koffing', 1,0.6);
insert into pokemon values (110, 'Weezing', 9.5,1.2);
insert into pokemon values (111, 'Rhyhorn', 115,1);
insert into pokemon values (112, 'Rhydon', 120,1.9);
insert into pokemon values (113, 'Chansey', 34.6,1.1);
insert into pokemon values (114, 'Tangela', 35,1);
insert into pokemon values (115, 'Kangaskhan', 80,2.2);
insert into pokemon values (116, 'Horsea', 8,0.4);
insert into pokemon values (117, 'Seadra', 25,1.2);
insert into pokemon values (118, 'Goldeen', 15,0.6);
insert into pokemon values (119, 'Seaking', 39,1.3);
insert into pokemon values (120, 'Staryu', 34.5,0.8);
insert into pokemon values (121, 'Starmie', 80,1.1);
insert into pokemon values (122, 'Mr. Mime', 54.5,1.3);
insert into pokemon values (123, 'Scyther', 56,1.5);
insert into pokemon values (124, 'Jynx', 40.6,1.4);
insert into pokemon values (125, 'Electabuzz', 30,1.1);
insert into pokemon values (126, 'Magmar', 44.5,1.3);
insert into pokemon values (127, 'Pinsir', 55,1.5);
insert into pokemon values (128, 'Tauros', 88.4,1.4);
insert into pokemon values (129, 'Magikarp', 10,0.9);
insert into pokemon values (130, 'Gyarados', 235,6.5);
insert into pokemon values (131, 'Lapras', 220,2.5);
insert into pokemon values (132, 'Ditto', 4,0.3);
insert into pokemon values (133, 'Eevee', 6.5,0.3);
insert into pokemon values (134, 'Vaporeon', 29,1);
insert into pokemon values (135, 'Jolteon', 24.5,0.8);
insert into pokemon values (136, 'Flareon', 25,0.9);
insert into pokemon values (137, 'Porygon', 36.5,0.8);
insert into pokemon values (138, 'Omanyte', 7.5,04);
insert into pokemon values (139, 'Omastar', 35,1);
insert into pokemon values (140, 'Kabuto', 11.5,0.5);
insert into pokemon values (141, 'Kabutops', 40.5,1.3);
insert into pokemon values (142, 'Aerodactyl', 59,1.8);
insert into pokemon values (143, 'Snorlax', 460,2.1);
insert into pokemon values (144, 'Articuno', 55.4,1.7);
insert into pokemon values (145, 'Zapdos', 52.6,1.6);
insert into pokemon values (146, 'Moltres', 60,2);
insert into pokemon values (147, 'Dratini', 3.3,1.8);
insert into pokemon values (148, 'Dragonair', 16.5,4);
insert into pokemon values (149, 'Dragonite', 210,2.2);
insert into pokemon values (150, 'Mewtwo', 122,2);
insert into pokemon values (151, 'Mew', 4,0.4);


/* Evoluciona de */
insert into evoluciona_de values(2,1);
insert into evoluciona_de values(3,2);
insert into evoluciona_de values(5,6);
insert into evoluciona_de values(6,5);
insert into evoluciona_de values(8,7);
insert into evoluciona_de values(9,8);
insert into evoluciona_de values(11,10);
insert into evoluciona_de values(12,11);
insert into evoluciona_de values(14,13);
insert into evoluciona_de values(15,14);
insert into evoluciona_de values(17,16);
insert into evoluciona_de values(18,17);
insert into evoluciona_de values(20,19);
insert into evoluciona_de values(22,21);
insert into evoluciona_de values(24,23);
insert into evoluciona_de values(26,25);
insert into evoluciona_de values(28,27);
insert into evoluciona_de values(30,29);
insert into evoluciona_de values(31,30);
insert into evoluciona_de values(33,32);
insert into evoluciona_de values(34,33);
insert into evoluciona_de values(36,35);
insert into evoluciona_de values(38,37);
insert into evoluciona_de values(40,39);
insert into evoluciona_de values(42,41);
insert into evoluciona_de values(44,43);
insert into evoluciona_de values(45,44);
insert into evoluciona_de values(47,46);
insert into evoluciona_de values(49,48);
insert into evoluciona_de values(51,50);
insert into evoluciona_de values(53,52);
insert into evoluciona_de values(55,54);
insert into evoluciona_de values(57,56);
insert into evoluciona_de values(59,58);
insert into evoluciona_de values(61,60);
insert into evoluciona_de values(62,61);
insert into evoluciona_de values(64,63);
insert into evoluciona_de values(65,64);
insert into evoluciona_de values(67,66);
insert into evoluciona_de values(68,67);
insert into evoluciona_de values(70,69);
insert into evoluciona_de values(73,72);
insert into evoluciona_de values(75,74);
insert into evoluciona_de values(76,75);
insert into evoluciona_de values(78,77);
insert into evoluciona_de values(80,79);
insert into evoluciona_de values(82,81);
insert into evoluciona_de values(85,84);
insert into evoluciona_de values(87,86);
insert into evoluciona_de values(89,88);
insert into evoluciona_de values(91,90);
insert into evoluciona_de values(93,92);
insert into evoluciona_de values(94,93);
insert into evoluciona_de values(97,96);
insert into evoluciona_de values(99,98);
insert into evoluciona_de values(101,100);
insert into evoluciona_de values(103,102);
insert into evoluciona_de values(105,104);
insert into evoluciona_de values(110,109);
insert into evoluciona_de values(112,111);
insert into evoluciona_de values(117,116);
insert into evoluciona_de values(119,118);
insert into evoluciona_de values(121,120);
insert into evoluciona_de values(130,129);
insert into evoluciona_de values(134,133);
insert into evoluciona_de values(135,133);
insert into evoluciona_de values(136,133);
insert into evoluciona_de values(139,138);
insert into evoluciona_de values(141,140);
insert into evoluciona_de values(148,147);
insert into evoluciona_de values(149,148);


/*Tipos Pokemon*/

insert into pokemon_tipo values (1,10);
insert into pokemon_tipo values (1,14);
insert into pokemon_tipo values (2,10);
insert into pokemon_tipo values (2,14);
insert into pokemon_tipo values (3,10);
insert into pokemon_tipo values (3,14);
insert into pokemon_tipo values (4,6);
insert into pokemon_tipo values (5,6);
insert into pokemon_tipo values (6,6);
insert into pokemon_tipo values (6,15);
insert into pokemon_tipo values (7,1);
insert into pokemon_tipo values (8,1);
insert into pokemon_tipo values (9,1);
insert into pokemon_tipo values (10,2);
insert into pokemon_tipo values (11,2);
insert into pokemon_tipo values (12,2);
insert into pokemon_tipo values (12,15);
insert into pokemon_tipo values (13,2);
insert into pokemon_tipo values (13,14);
insert into pokemon_tipo values (14,2);
insert into pokemon_tipo values (14,14);
insert into pokemon_tipo values (15,2);
insert into pokemon_tipo values (15,14);
insert into pokemon_tipo values (16,9);
insert into pokemon_tipo values (16,15);
insert into pokemon_tipo values (17,9);
insert into pokemon_tipo values (17,15);
insert into pokemon_tipo values (18,9);
insert into pokemon_tipo values (18,15);
insert into pokemon_tipo values (19,9);
insert into pokemon_tipo values (20,9);
insert into pokemon_tipo values (21,9);
insert into pokemon_tipo values (21,15);
insert into pokemon_tipo values (22,9);
insert into pokemon_tipo values (22,15);
insert into pokemon_tipo values (23,14);
insert into pokemon_tipo values (24,14);
insert into pokemon_tipo values (25,4);
insert into pokemon_tipo values (26,4);
insert into pokemon_tipo values (27,13);
insert into pokemon_tipo values (28,13);
insert into pokemon_tipo values (29,14);
insert into pokemon_tipo values (30,14);
insert into pokemon_tipo values (31,14);
insert into pokemon_tipo values (31,13);
insert into pokemon_tipo values (32,14);
insert into pokemon_tipo values (33,14);
insert into pokemon_tipo values (34,14);
insert into pokemon_tipo values (34,13);
insert into pokemon_tipo values (35,9);
insert into pokemon_tipo values (36,9);
insert into pokemon_tipo values (37,6);
insert into pokemon_tipo values (38,6);
insert into pokemon_tipo values (39,9);
insert into pokemon_tipo values (40,9);
insert into pokemon_tipo values (41,14);
insert into pokemon_tipo values (41,15);
insert into pokemon_tipo values (42,14);
insert into pokemon_tipo values (42,15);
insert into pokemon_tipo values (43,10);
insert into pokemon_tipo values (43,14);
insert into pokemon_tipo values (44,10);
insert into pokemon_tipo values (44,14);
insert into pokemon_tipo values (45,10);
insert into pokemon_tipo values (45,14);
insert into pokemon_tipo values (46,2);
insert into pokemon_tipo values (46,10);
insert into pokemon_tipo values (47,2);
insert into pokemon_tipo values (47,10);
insert into pokemon_tipo values (48,2);
insert into pokemon_tipo values (48,14);
insert into pokemon_tipo values (49,2);
insert into pokemon_tipo values (49,14);
insert into pokemon_tipo values (50,13);
insert into pokemon_tipo values (51,13);
insert into pokemon_tipo values (52,9);
insert into pokemon_tipo values (53,9);
insert into pokemon_tipo values (54,1);
insert into pokemon_tipo values (55,1);
insert into pokemon_tipo values (56,8);
insert into pokemon_tipo values (57,8);
insert into pokemon_tipo values (58,6);
insert into pokemon_tipo values (59,6);
insert into pokemon_tipo values (60,1);
insert into pokemon_tipo values (61,1);
insert into pokemon_tipo values (62,1);
insert into pokemon_tipo values (62,8);
insert into pokemon_tipo values (63,11);
insert into pokemon_tipo values (64,12);
insert into pokemon_tipo values (65,13);
insert into pokemon_tipo values (66,8);
insert into pokemon_tipo values (67,8);
insert into pokemon_tipo values (68,8);
insert into pokemon_tipo values (69,10);
insert into pokemon_tipo values (69,14);
insert into pokemon_tipo values (70,10);
insert into pokemon_tipo values (70,14);
insert into pokemon_tipo values (71,10);
insert into pokemon_tipo values (71,14);
insert into pokemon_tipo values (72,1);
insert into pokemon_tipo values (72,14);
insert into pokemon_tipo values (73,2);
insert into pokemon_tipo values (73,14);
insert into pokemon_tipo values (74,12);
insert into pokemon_tipo values (74,13);
insert into pokemon_tipo values (75,12);
insert into pokemon_tipo values (75,13);
insert into pokemon_tipo values (76,12);
insert into pokemon_tipo values (76,13);
insert into pokemon_tipo values (77,6);
insert into pokemon_tipo values (78,6);
insert into pokemon_tipo values (79,1);
insert into pokemon_tipo values (79,11);
insert into pokemon_tipo values (80,1);
insert into pokemon_tipo values (80,11);
insert into pokemon_tipo values (81,4);
insert into pokemon_tipo values (82,4);
insert into pokemon_tipo values (83,9);
insert into pokemon_tipo values (83,15);
insert into pokemon_tipo values (84,9);
insert into pokemon_tipo values (84,15);
insert into pokemon_tipo values (85,9);
insert into pokemon_tipo values (85,15);
insert into pokemon_tipo values (86,1);
insert into pokemon_tipo values (86,7);
insert into pokemon_tipo values (87,1);
insert into pokemon_tipo values (87,7);
insert into pokemon_tipo values (88,14);
insert into pokemon_tipo values (89,14);
insert into pokemon_tipo values (90,1);
insert into pokemon_tipo values (91,1);
insert into pokemon_tipo values (91,7);
insert into pokemon_tipo values (92,5);
insert into pokemon_tipo values (92,14);
insert into pokemon_tipo values (93,5);
insert into pokemon_tipo values (93,14);
insert into pokemon_tipo values (94,5);
insert into pokemon_tipo values (94,14);
insert into pokemon_tipo values (95,12);
insert into pokemon_tipo values (95,13);
insert into pokemon_tipo values (96,11);
insert into pokemon_tipo values (97,11);
insert into pokemon_tipo values (98,1);
insert into pokemon_tipo values (99,1);
insert into pokemon_tipo values (100,4);
insert into pokemon_tipo values (101,4);
insert into pokemon_tipo values (102,10);
insert into pokemon_tipo values (102,11);
insert into pokemon_tipo values (103,10);
insert into pokemon_tipo values (103,11);
insert into pokemon_tipo values (104,13);
insert into pokemon_tipo values (105,13);
insert into pokemon_tipo values (106,8);
insert into pokemon_tipo values (107,8);
insert into pokemon_tipo values (108,9);
insert into pokemon_tipo values (109,14);
insert into pokemon_tipo values (110,14);
insert into pokemon_tipo values (111,12);
insert into pokemon_tipo values (111,13);
insert into pokemon_tipo values (112,12);
insert into pokemon_tipo values (112,13);
insert into pokemon_tipo values (113,9);
insert into pokemon_tipo values (114,10);
insert into pokemon_tipo values (115,9);
insert into pokemon_tipo values (116,1);
insert into pokemon_tipo values (117,1);
insert into pokemon_tipo values (118,1);
insert into pokemon_tipo values (119,1);
insert into pokemon_tipo values (120,1);
insert into pokemon_tipo values (121,1);
insert into pokemon_tipo values (121,11);
insert into pokemon_tipo values (122,11);
insert into pokemon_tipo values (123,2);
insert into pokemon_tipo values (123,15);
insert into pokemon_tipo values (124,7);
insert into pokemon_tipo values (124,11);
insert into pokemon_tipo values (125,4);
insert into pokemon_tipo values (126,6);
insert into pokemon_tipo values (127,2);
insert into pokemon_tipo values (128,9);
insert into pokemon_tipo values (129,1);
insert into pokemon_tipo values (130,1);
insert into pokemon_tipo values (130,15);
insert into pokemon_tipo values (131,1);
insert into pokemon_tipo values (131,7);
insert into pokemon_tipo values (132,9);
insert into pokemon_tipo values (133,9);
insert into pokemon_tipo values (134,1);
insert into pokemon_tipo values (135,4);
insert into pokemon_tipo values (136,6);
insert into pokemon_tipo values (137,9);
insert into pokemon_tipo values (138,12);
insert into pokemon_tipo values (138,1);
insert into pokemon_tipo values (139,1);
insert into pokemon_tipo values (139,12);
insert into pokemon_tipo values (140,1);
insert into pokemon_tipo values (140,12);
insert into pokemon_tipo values (141,1);
insert into pokemon_tipo values (141,12);
insert into pokemon_tipo values (142,12);
insert into pokemon_tipo values (142,15);
insert into pokemon_tipo values (143,9);
insert into pokemon_tipo values (144,7);
insert into pokemon_tipo values (144,15);
insert into pokemon_tipo values (145,4);
insert into pokemon_tipo values (145,15);
insert into pokemon_tipo values (146,6);
insert into pokemon_tipo values (146,15);
insert into pokemon_tipo values (147,3);
insert into pokemon_tipo values (148,3);
insert into pokemon_tipo values (149,3);
insert into pokemon_tipo values (149,15);
insert into pokemon_tipo values (150,11);
insert into pokemon_tipo values (151,11);

/*Estadisticas base*/

insert into estadisticas_base values (1,45, 49,49,65,45);
insert into estadisticas_base values (2,60, 62,63,80,60);
insert into estadisticas_base values (3,80, 82,83,100,80);
insert into estadisticas_base values (4,39, 52,43,55,65);
insert into estadisticas_base values (5,58, 64,58,73,80);
insert into estadisticas_base values (6,78, 84,78,97,100);
insert into estadisticas_base values (7,44, 48,65,57,43);
insert into estadisticas_base values (8,59, 63,80,73,58);
insert into estadisticas_base values (9,79, 83,100,95,78);
insert into estadisticas_base values (10,45, 30,35,20,45);
insert into estadisticas_base values (11,50, 20,55,25,30);
insert into estadisticas_base values (12,60, 45,50,80,70);
insert into estadisticas_base values (13,40, 35,30,20,50);
insert into estadisticas_base values (14,45, 25,50,25,35);
insert into estadisticas_base values (15,65, 80,40,63,75);
insert into estadisticas_base values (16,40, 45,40,35,56);
insert into estadisticas_base values (17,63, 60,55,50,71);
insert into estadisticas_base values (18,83, 80,75,70,91);
insert into estadisticas_base values (19,30, 56,35,30,72);
insert into estadisticas_base values (20,55, 81,60,60,97);
insert into estadisticas_base values (21,40, 60,30,31,70);
insert into estadisticas_base values (22,65, 90,65,61,100);
insert into estadisticas_base values (23,35, 60,44,47,55);
insert into estadisticas_base values (24,60, 85,69,65,79);
insert into estadisticas_base values (25,35, 55,30,45,90);
insert into estadisticas_base values (26,60, 90,55,85,100);
insert into estadisticas_base values (27,50, 75,85,25,40);
insert into estadisticas_base values (28,75, 100,110,50,65);
insert into estadisticas_base values (29,55, 47,52,40,41);
insert into estadisticas_base values (30,70, 62,67,55,56);
insert into estadisticas_base values (31,90, 82,87,80,76);
insert into estadisticas_base values (32,46, 57,40,40,50);
insert into estadisticas_base values (33,61, 72,57,55,65);
insert into estadisticas_base values (34,81, 82,77,80,85);
insert into estadisticas_base values (35,70, 45,48,63,35);
insert into estadisticas_base values (36,95, 70,73,87,60);
insert into estadisticas_base values (37,38, 41,40,57,65);
insert into estadisticas_base values (38,73, 76,75,91,100);
insert into estadisticas_base values (39,115, 45,20,30,20);
insert into estadisticas_base values (40,140, 70,45,63,45);
insert into estadisticas_base values (41,40, 45,35,35,55);
insert into estadisticas_base values (42,75, 80,70,70,90);
insert into estadisticas_base values (43,45, 50,55,70,30);
insert into estadisticas_base values (44,60, 65,70,80,40);
insert into estadisticas_base values (45,75, 80,85,95,50);
insert into estadisticas_base values (46,35, 70,55,50,25);
insert into estadisticas_base values (47,60, 95,80,70,30);
insert into estadisticas_base values (48,60, 55,50,47,45);
insert into estadisticas_base values (49,70, 65,60,83,90);
insert into estadisticas_base values (50,10, 55,25,40,95);
insert into estadisticas_base values (51,35, 80,50,60,120);
insert into estadisticas_base values (52,40, 45,35,40,90);
insert into estadisticas_base values (53,65, 70,60,65,115);
insert into estadisticas_base values (54,50, 52,48,57,55);
insert into estadisticas_base values (55,80, 82,78,87,85);
insert into estadisticas_base values (56,40, 80,35,40,70);
insert into estadisticas_base values (57,65, 105,60,65,95);
insert into estadisticas_base values (58,55, 70,45,60,60);
insert into estadisticas_base values (59,90, 110,80,90,95);
insert into estadisticas_base values (60,45, 49,49,65,45);
insert into estadisticas_base values (61,65, 65,65,50,90);
insert into estadisticas_base values (62,90, 85,95,80,70);
insert into estadisticas_base values (63,25, 20,15,80,90);
insert into estadisticas_base values (64,40, 35,30,95,105);
insert into estadisticas_base values (65,55, 50,45,110,120);
insert into estadisticas_base values (66,70, 80,50,35,35);
insert into estadisticas_base values (67,80, 100,70,55,45);
insert into estadisticas_base values (68,90, 130,80,75,55);
insert into estadisticas_base values (69,50, 75,35,50,40);
insert into estadisticas_base values (70,65, 90,50,65,40);
insert into estadisticas_base values (71,80, 105,65,80,70);
insert into estadisticas_base values (72,40, 40,35,75,70);
insert into estadisticas_base values (73,80, 70,65,100,100);
insert into estadisticas_base values (74,40, 80,100,30,20);
insert into estadisticas_base values (75,55, 95,115,45,35);
insert into estadisticas_base values (76,80, 110,130,60,45);
insert into estadisticas_base values (77,50, 85,55,65,90);
insert into estadisticas_base values (78,65, 100,70,80,105);
insert into estadisticas_base values (79,90, 65,65,80,15);
insert into estadisticas_base values (80,95, 75,110,90,30);
insert into estadisticas_base values (81,25, 35,70,75,45);
insert into estadisticas_base values (82,50, 60,95,95,70);
insert into estadisticas_base values (83,52, 65,55,60,60);
insert into estadisticas_base values (85,60, 110,70,60,100);
insert into estadisticas_base values (86,65, 45,55,58,45);
insert into estadisticas_base values (87,90, 70,80,83,70);
insert into estadisticas_base values (88,80, 80,50,45,25);
insert into estadisticas_base values (89,105, 105,75,83,50);
insert into estadisticas_base values (90,30, 65,100,35,40);
insert into estadisticas_base values (91,50, 95,180,65,70);
insert into estadisticas_base values (92,30, 35,30,68,80);
insert into estadisticas_base values (93,45, 50,45,85,95);
insert into estadisticas_base values (94,60, 65,60,103,110);
insert into estadisticas_base values (95,35, 45,160,37,70);
insert into estadisticas_base values (96,60, 48,45,67,42);
insert into estadisticas_base values (97,85, 73,70,94,67);
insert into estadisticas_base values (98,30, 105,90,25,50);
insert into estadisticas_base values (99,55, 130,115,50,75);
insert into estadisticas_base values (100,40, 30,50,55,100);
insert into estadisticas_base values (101,60, 50,70,80,140);
insert into estadisticas_base values (102,60, 40,80,53,40);
insert into estadisticas_base values (103,95, 95,85,95,55);
insert into estadisticas_base values (104,50, 50,95,55,35);
insert into estadisticas_base values (105,60, 80,110,65,45);
insert into estadisticas_base values (106,50, 120,53,73,87);
insert into estadisticas_base values (107,50, 105,79,73,76);
insert into estadisticas_base values (108,90, 55,75,67,30);
insert into estadisticas_base values (109,40, 65,95,53,35);
insert into estadisticas_base values (110,65, 90,120,77,60);
insert into estadisticas_base values (111,80, 85,95,30,25);
insert into estadisticas_base values (112,105, 130,120,45,40);
insert into estadisticas_base values (113,250, 5,5,70,50);
insert into estadisticas_base values (114,65, 55,115,70,60);
insert into estadisticas_base values (115,105, 95,80,60,90);
insert into estadisticas_base values (116,30, 40,70,48,60);
insert into estadisticas_base values (117,55, 65,95,70,85);
insert into estadisticas_base values (118,45, 67,60,43,63);
insert into estadisticas_base values (119,80, 92,65,72,68);
insert into estadisticas_base values (120,30, 45,55,63,85);
insert into estadisticas_base values (121,60, 75,85,93,115);
insert into estadisticas_base values (122,40, 45,65,110,90);
insert into estadisticas_base values (123,70, 110,80,68,105);
insert into estadisticas_base values (124,65, 50,35,105,95);
insert into estadisticas_base values (125,65, 83,57,95,105);
insert into estadisticas_base values (126,65, 95,57,90,105);
insert into estadisticas_base values (127,65, 125,100,63,85);
insert into estadisticas_base values (128,75, 100,95,55,110);
insert into estadisticas_base values (129,20, 10,55,17,80);
insert into estadisticas_base values (130,95, 125,79,80,81);
insert into estadisticas_base values (131,130, 85,80,90,60);
insert into estadisticas_base values (132,48, 48,48,48,48);
insert into estadisticas_base values (133,55, 55,50,55,55);
insert into estadisticas_base values (134,130, 65,60,103,65);
insert into estadisticas_base values (135,65, 65,60,103,130);
insert into estadisticas_base values (136,65, 130,60,103,65);
insert into estadisticas_base values (137,65, 60,70,80,40);
insert into estadisticas_base values (138,35, 40,100,73,35);
insert into estadisticas_base values (139,70, 60,125,93,55);
insert into estadisticas_base values (140,30, 80,90,50,55);
insert into estadisticas_base values (141,60, 115,105,67,80);
insert into estadisticas_base values (142,80, 105,65,67,130);
insert into estadisticas_base values (143,160, 110,65,88,30);
insert into estadisticas_base values (144,90, 85,100,110,85);
insert into estadisticas_base values (145,90, 90,85,83,100);
insert into estadisticas_base values (146,90, 100,90,105,90);
insert into estadisticas_base values (147,41, 64,45,50,50);
insert into estadisticas_base values (148,61, 84,65,70,70);
insert into estadisticas_base values (149,91, 134,95,100,80);
insert into estadisticas_base values (150,106, 110,90,122,130);
insert into estadisticas_base values (151,100, 100,100,100,100);

/*Piedras*/

insert into tipo_piedra values (1,'Piedra trueno');
insert into tipo_piedra values (2,'Piedra fuego');
insert into tipo_piedra values (3,'Piedra agua');
insert into tipo_piedra values (4,'Piedra lunar');
insert into tipo_piedra values (5,'Piedra hoja');


/*Tipo evolucion*/

insert into tipo_evolucion values (1,'Nivel');
insert into tipo_evolucion values (2,'Piedra');
insert into tipo_evolucion values (3,'Intercambio');

/*Formas de evolucion*/

insert into forma_evolucion values (1, 3);
insert into forma_evolucion values (2, 1);
insert into forma_evolucion values (3, 1);
insert into forma_evolucion values (4, 1);
insert into forma_evolucion values (5, 2);
insert into forma_evolucion values (6, 2);
insert into forma_evolucion values (7, 2);
insert into forma_evolucion values (8, 2);
insert into forma_evolucion values (9, 2);
insert into forma_evolucion values (10, 2);
insert into forma_evolucion values (11, 2);
insert into forma_evolucion values (12, 2);
insert into forma_evolucion values (13, 1);
insert into forma_evolucion values (14, 2);
insert into forma_evolucion values (15, 1);
insert into forma_evolucion values (16, 2);
insert into forma_evolucion values (17, 2);
insert into forma_evolucion values (18, 2);
insert into forma_evolucion values (19, 2);
insert into forma_evolucion values (20, 2);
insert into forma_evolucion values (21, 2);
insert into forma_evolucion values (22, 2);
insert into forma_evolucion values (23, 2);
insert into forma_evolucion values (24, 2);
insert into forma_evolucion values (25, 2);
insert into forma_evolucion values (26, 2);
insert into forma_evolucion values (27, 2);
insert into forma_evolucion values (28, 2);
insert into forma_evolucion values (29, 2);


/*Formas de evolucion piedras*/

insert into piedra values (2, 1);
insert into piedra values (3, 2);
insert into piedra values (4, 3);
insert into piedra values (13, 4);
insert into piedra values (15, 5);

/*Formas de evolucion nivel*/

insert into nivel_evolucion values (5, 7);
insert into nivel_evolucion values (6, 10);
insert into nivel_evolucion values (7, 16);
insert into nivel_evolucion values (8, 18);
insert into nivel_evolucion values (9, 20);
insert into nivel_evolucion values (10, 22);
insert into nivel_evolucion values (11, 32);
insert into nivel_evolucion values (12, 36);
insert into nivel_evolucion values (14, 21);
insert into nivel_evolucion values (16, 24);
insert into nivel_evolucion values (17, 31);
insert into nivel_evolucion values (18, 26);
insert into nivel_evolucion values (19, 28);
insert into nivel_evolucion values (20, 33);
insert into nivel_evolucion values (21, 25);
insert into nivel_evolucion values (22, 30);
insert into nivel_evolucion values (23, 40);
insert into nivel_evolucion values (24, 37);
insert into nivel_evolucion values (25, 34);
insert into nivel_evolucion values (26, 38);
insert into nivel_evolucion values (27, 35);
insert into nivel_evolucion values (28, 42);
insert into nivel_evolucion values (29, 55);

/*Formas de evolucion pokemon*/

insert into pokemon_forma_evolucion values (1, 7);
insert into pokemon_forma_evolucion values (2, 11);
insert into pokemon_forma_evolucion values (4, 7);
insert into pokemon_forma_evolucion values (5, 12);
insert into pokemon_forma_evolucion values (7, 7);
insert into pokemon_forma_evolucion values (8, 12);
insert into pokemon_forma_evolucion values (10, 5);
insert into pokemon_forma_evolucion values (11, 6);
insert into pokemon_forma_evolucion values (13, 5);
insert into pokemon_forma_evolucion values (14, 6);
insert into pokemon_forma_evolucion values (16, 8);
insert into pokemon_forma_evolucion values (17, 12);
insert into pokemon_forma_evolucion values (19, 9);
insert into pokemon_forma_evolucion values (21, 9);
insert into pokemon_forma_evolucion values (13, 10);
insert into pokemon_forma_evolucion values (25, 2);
insert into pokemon_forma_evolucion values (27, 10);
insert into pokemon_forma_evolucion values (29, 8);
insert into pokemon_forma_evolucion values (30, 13);
insert into pokemon_forma_evolucion values (32, 8);
insert into pokemon_forma_evolucion values (33, 13);
insert into pokemon_forma_evolucion values (35, 13);
insert into pokemon_forma_evolucion values (37, 3);
insert into pokemon_forma_evolucion values (39, 13);
insert into pokemon_forma_evolucion values (41, 10);
insert into pokemon_forma_evolucion values (43, 14);
insert into pokemon_forma_evolucion values (44, 15);
insert into pokemon_forma_evolucion values (46, 16);
insert into pokemon_forma_evolucion values (48, 17);
insert into pokemon_forma_evolucion values (50, 18);
insert into pokemon_forma_evolucion values (52, 19);
insert into pokemon_forma_evolucion values (54, 20);
insert into pokemon_forma_evolucion values (56, 19);
insert into pokemon_forma_evolucion values (58, 3);
insert into pokemon_forma_evolucion values (60, 21);
insert into pokemon_forma_evolucion values (61, 4);
insert into pokemon_forma_evolucion values (63, 7);
insert into pokemon_forma_evolucion values (64, 1);
insert into pokemon_forma_evolucion values (66, 19);
insert into pokemon_forma_evolucion values (67, 1);
insert into pokemon_forma_evolucion values (69, 14);
insert into pokemon_forma_evolucion values (70, 15);
insert into pokemon_forma_evolucion values (72, 22);
insert into pokemon_forma_evolucion values (74, 21);
insert into pokemon_forma_evolucion values (75, 1);
insert into pokemon_forma_evolucion values (77, 23);
insert into pokemon_forma_evolucion values (79, 24);
insert into pokemon_forma_evolucion values (81, 22);
insert into pokemon_forma_evolucion values (84, 17);
insert into pokemon_forma_evolucion values (86, 25);
insert into pokemon_forma_evolucion values (88, 26);
insert into pokemon_forma_evolucion values (90, 4);
insert into pokemon_forma_evolucion values (92, 21);
insert into pokemon_forma_evolucion values (93, 1);
insert into pokemon_forma_evolucion values (96, 18);
insert into pokemon_forma_evolucion values (98, 19);
insert into pokemon_forma_evolucion values (100, 22);
insert into pokemon_forma_evolucion values (102, 15);
insert into pokemon_forma_evolucion values (104, 19);
insert into pokemon_forma_evolucion values (109, 27);
insert into pokemon_forma_evolucion values (111, 28);
insert into pokemon_forma_evolucion values (116, 11);
insert into pokemon_forma_evolucion values (118, 20);
insert into pokemon_forma_evolucion values (120, 4);
insert into pokemon_forma_evolucion values (129, 9);
insert into pokemon_forma_evolucion values (133, 2);
insert into pokemon_forma_evolucion values (133, 3);
insert into pokemon_forma_evolucion values (133, 4);
insert into pokemon_forma_evolucion values (138, 23);
insert into pokemon_forma_evolucion values (140, 23);
insert into pokemon_forma_evolucion values (147, 22);
insert into pokemon_forma_evolucion values (148, 29);

/*Movimientos*/

insert into movimiento values(1, 'Placaje', 40, 100, 'Causa daño', 35, 9);
insert into movimiento values(2, 'Danza espada', 0, 100, 'Aumenta en dos niveles el ataque del usuario', 30, 9);
insert into movimiento values(3, 'Burbuja', 20, 100, 'Causa daño y tiene una probabilidad del 10% de bajar la velocidad', 30, 1);
insert into movimiento values(4, 'Cascada', 80, 100, 'Causa daño', 15, 1);
insert into movimiento values(5, 'Hidrobomba', 120, 80, 'Causa daño', 5, 1);
insert into movimiento values(6, 'Martillazo', 90, 85, 'Causa daño con probabilidad de dar golpe critico(12,5%)', 10, 1);
insert into movimiento values(7, 'Pistola de agua', 40, 100, 'Causa daño', 25,1);
insert into movimiento values(8, 'Rayo burbuja', 65, 100, 'Causa daño y tiene una probabilidad del 10% de bajar la velocidad', 20,1);
insert into movimiento values(9, 'Refugio', 0, 100, 'Aumenta la defensa en un nivel', 40, 1);
insert into movimiento values(10, 'Surf', 95, 100, 'Causa daño', 15,1);
insert into movimiento values(11, 'Tenaza', 35, 75, 'Causa daño durante 2-5 turnos. Imposibilidad de atacar al objetivo', 15, 1);
insert into movimiento values(12, 'Chupa vidas', 20, 100, 'Causa daño y recupera el 50% PS quitados', 15, 2);
insert into movimiento values(13, 'Disparo demora', 0, 95, 'Baja la velocidad del objetivo', 40,2);
insert into movimiento values(14, 'Doble ataque', 25, 100, 'Causa daño golpeando dos veces. Cada golpe tiene un 20% de probabilidad de envenenar.', 20,2);
insert into movimiento values(15, 'Pin misil', 14, 85, 'Causa daño al objetivo de 2 a 5 veces', 20, 2);
insert into movimiento values(16, 'Furia dragón', 0, 100, 'Quita siempre 40 PS al obejtivo', 10, 3);
insert into movimiento values(17, 'Impactrueno', 40, 100, 'Causa daño y tiene una probabilidad del 10% de paralizar el objetivo.', 30, 4);
insert into movimiento values(18, 'Onda trueno', 0, 100, 'Paraliza el objetivo', 20,4);
insert into movimiento values(19, 'Puño trueno', 75, 100, 'Causa daño y tiene un 10% de paralizar el objetivo', 35, 4);
insert into movimiento values(20, 'Rayo', 95, 100, 'Causa daño y tiene un 10% de paralizar el objetivo', 15, 4);
insert into movimiento values(21, 'Trueno', 120, 70, 'Causa daño y tiene un 10% de paralizar el objetivo', 10,  4);
insert into movimiento values(23, 'Lenguetazo', 20, 100, 'Causa daño y tiene un 30% de paralizar el objetivo', 30,  5);
insert into movimiento values(24, 'Rayo confuso', 0, 100, 'Confunde al objetivo', 10, 5);
insert into movimiento values(25, 'Tinieblas', 0, 100, 'Resta la cantidad de PS equivalentes al nivel de usuario', 15, 5);
insert into movimiento values(26, 'Ascuas', 40, 100, 'Causa daño y tiene una probabilidad del 10% de quemar al objetivo', 25, 6);
insert into movimiento values(27, 'Giro fuego', 15, 100, 'Causa dañó de 2 a 5 turnos. Imposibilidad de atacar al objetivo', 15, 6);
insert into movimiento values(28, 'Lanzallamas', 95, 100, 'Causa daño y tiene una probabilidad del 10% de quemar al objetivo', 15, 6);
insert into movimiento values(29, 'Llamarada', 120, 85, 'Causa daño y tiene una probabilidad del 30% de quemar al objetivo', 5, 6);
insert into movimiento values(30, 'Puño fuego', 75, 100, 'Causa daño y tiene una probabilidad del 10% de quemar al objetivo', 15, 4);
insert into movimiento values(31, 'Neblina', 0, 0, 'Neblina evita durante 5 turnos otros pokemon puedan reducir las estadisiticas del equipo aliado', 30, 7);
insert into movimiento values(32, 'Niebla', 0, 0, 'Restaura todos los cambios, tantos positivos como negativos, en las estadisitcas de todos los pokemon.', 30, 7);
insert into movimiento values(33, 'Puño hielo', 75, 100, 'Causa daño y tiene una probabilidad del 10% de congelar al objetivo', 15, 7);
insert into movimiento values(34, 'Rayo aurora', 65, 100, 'Causa daño y tiene una probabilidad del 10% de bajar un nivel el ataque del objetivo', 20, 7);
insert into movimiento values(35, 'Rayo hielo', 95, 100, 'Causa daño y tiene una probabilidad del 10% de congelar al objetivo', 10, 7);
insert into movimiento values(36, 'Ventisca', 120, 90, 'Causa daño y tiene una probabilidad del 10% de congelar al objetivo', 5, 7);
insert into movimiento values(37, 'Contraataque', 0, 100, 'Devuelve el doble daño recibido si es un físico', 20, 8);
insert into movimiento values(38, 'Doble patada', 30, 100, 'Causa daño, golpeando 2 veces en un mismo turno', 30, 8);
insert into movimiento values(39, 'Movimiento sísmico', 0, 100, 'Resta la cantidad de PS equivalentes al nivel de usuario', 20, 8);
insert into movimiento values(40, 'Patada baja', 50, 90, 'Causa daño y tiene del 30% de retroceder al objetivo', 20, 8);
insert into movimiento values(41, 'Patada giro', 60, 85, 'Causa daño y tiene del 30% de retroceder al objetivo', 15, 8);
insert into movimiento values(42, 'Patada salto', 70, 100, 'Causa daño. Si falla, el usuario se golpea a si mismo restandole 1 PS.', 25, 8);
insert into movimiento values(43, 'Patada salto alta', 85, 90, 'Causa daño. Si falla, el usuario se golpea a si mismo restandole 1 PS.', 20, 8);
insert into movimiento values(44, 'Sumisión', 80, 80, 'Causa daño. Causa daño de retroceso al usuario de 1/4 del daño causado.', 20, 8);
insert into movimiento values(45, 'Afilar', 0, 100, 'sube el ataque del usuario en un nivel', 30, 9);
insert into movimiento values(46, 'Agarre', 55, 100, 'Causa daño.', 30, 9);
insert into movimiento values(47, 'Amortiguador', 0, 0, 'Restaura la mitad de los PS máximos del usuario', 10, 9);
insert into movimiento values(48, 'Anulación', 0, 55, 'Anula un movimiento del objetivo', 20, 9);
insert into movimiento values(49, 'Arañazo', 40, 100, 'Causa daño.', 35, 9);
insert into movimiento values(50, 'Atadura', 15, 75, 'Causa daño de 2 a 5 turnos. Imposibilidad de atacar al objetivo', 20, 9);
insert into movimiento values(51, 'Ataque arena', 0, 100, 'Baja la precisión en un nivel.', 15, 9);
insert into movimiento values(52, 'Ataque furia', 15, 85, 'Causa daño de 2 a 5 turnos.', 20, 9);
insert into movimiento values(53, 'Ataque rápido', 40, 100, 'Causa daño.', 30, 9);
insert into movimiento values(54, 'Autodestrucción', 130, 100, 'Causa daño y debilita al usuario.', 5, 9);
insert into movimiento values(55, 'Beso amoroso', 0, 75, 'Duerme al obejtivo', 10, 9);
insert into movimiento values(56, 'Bomba huevo', 100, 75, 'Causa daño', 10, 9);
insert into movimiento values(57, 'Bomba sónica', 0, 90, 'siempre quita 20 PS', 20, 9);
insert into movimiento values(58, 'Cabezazo', 100, 100, 'Se prepara durante el primer turno y ataca en el segundo', 15, 9);
insert into movimiento values(59, 'Canto', 0, 55, 'Duerme al objetivo.', 15, 9);
insert into movimiento values(60, 'Chirrido', 0, 85, 'Baja en dos niveles la defensa del objetivo.', 40, 9);
insert into movimiento values(61, 'Clavo cañón', 20, 100, 'Causa daño de 2 a 5 turnos.', 15, 9);
insert into movimiento values(62, 'Conversión', 0, 0, 'Cambia el tipo del usuario del oponente', 30, 9);
insert into movimiento values(63, 'Cornada', 65, 100, 'Causa daño.', 25, 9);
insert into movimiento values(64, 'Corte', 50, 100, 'Causa daño.', 30, 9);
insert into movimiento values(65, 'Cuchillada', 70, 100, 'Causa daño y tiene una alta probabilidad de causar un golpe crítico (12,5%).', 20, 9);
insert into movimiento values(66, 'Derribo', 90, 85, 'Causa daño. Causa daño de retroceso al usuario de 1/4 del daño causado ', 20, 9);
insert into movimiento values(67, 'Desarrollo', 0, 0, 'Aumenta en un nivel el especial del usuario.', 40, 9);
insert into movimiento values(68, 'Deslumbrar', 0, 100, 'Provoca paralisis al objetivo.', 30, 9);
insert into movimiento values(69, 'Destello', 0, 100, 'Baja un nivel la precisición del oponente.', 20, 9);
insert into movimiento values(70, 'Destructor', 40, 100, 'Causa daño.', 35, 9);
insert into movimiento values(71, 'Día de pago', 40, 100, 'Causa daño. Se esparcen monedas que se recogen al final del combate', 20, 9);
insert into movimiento values(72, 'Doble equipo', 0, 0, 'Aumenta en un nivel la evasión del usuario.', 15, 9);
insert into movimiento values(73, 'Doble filo', 100, 100, 'Causa daño. Causa daño de retroceso al usuario de 1/4 del daño causado.', 15, 9);
insert into movimiento values(74, 'Doblebofetón', 15, 85, 'Causa daño de 2 a 5 turnos.', 10, 9);
insert into movimiento values(75, 'Explosión', 170, 100, 'Causa daño y debilita al usuario.', 5, 9);
insert into movimiento values(76, 'Foco energía', 0, 0, 'Aumenta la probabilidad asestar golpes criticos.', 40, 9);
insert into movimiento values(77, 'Fortaleza', 0, 0, 'Aumenta en un nivel la defensa del usuario.', 30, 9);
insert into movimiento values(78, 'Fuerza', 80, 100, 'Causa daño.', 15, 9);
insert into movimiento values(79, 'Furia', 20, 100, 'Causa daño. No puede cambiar de movimiento.', 20, 9);
insert into movimiento values(80, 'Golpe', 90, 100, 'Causa daño entre 3 o 4 turnos seguidos. El usuario termina confundido.', 20, 9);
insert into movimiento values(81, 'Golpe cabeza', 70, 100, 'Causa daño y tiene una probabilidad del 30% de hacer retroceder.', 15, 9);
insert into movimiento values(82, 'Golpe cuerpo', 85, 100, 'Causa daño y tiene una probabilidad del 30% de paralizar el objetivo.', 15, 9);
insert into movimiento values(83, 'Golpe kárate', 50, 100, 'Causa daño y tiene un alto índice de golpe crítico.', 25, 9);
insert into movimiento values(84, 'Golpes furia', 50, 100, 'Causa daño de 2 a 5 turnos.', 15, 9);
insert into movimiento values(85, 'Gruñido', 0, 100, 'Baja un nivel el ataque del objetivo.', 40, 9);
insert into movimiento values(86, 'Guillotina', 0, 30, 'Si acierta, provoca KO en un turno.', 5, 9);
insert into movimiento values(87, 'Hipercolmillo', 80, 90, 'Causa daño y tiene un una probabilidad del 10% de hacer retroceder al objetivo.', 15, 9);
insert into movimiento values(88, 'Hiperrayo', 150, 90, 'Causa daño. No podra moverse en el segundo turno.', 5, 9);
insert into movimiento values(89, 'Látigo', 0, 100, 'Baja en un nivel la defensa del oponente.', 30, 9);
insert into movimiento values(90, 'Malicioso', 0, 100, 'Baja en un nivel la defensa del oponente.', 30, 9);
insert into movimiento values(91, 'Megapatada', 120, 75, 'Causa daño.', 5, 9);
insert into movimiento values(92, 'MegaPuño', 80, 85, 'Causa daño.', 20, 9);
insert into movimiento values(93, 'Metrónomo', 0, 0, 'Utiliza un movimiento al azar.', 15, 9);
insert into movimiento values(94, 'Mimético', 0, 0, 'Permite al usuario elegir uno de los movimientos del objetivo y copiarlo.', 25, 9);
insert into movimiento values(95, 'Mordisco', 60, 100, 'Causa daño y tiene una probabilidad del 10% de hacer retroceder.', 25, 9);
insert into movimiento values(96, 'Pantalla de humo', 0, 100, 'Baja en un nivel la precisión del oponente.', 20, 9);
insert into movimiento values(97, 'Perforador',0, 30, 'Si acierta, provoca KO en un turno.', 5, 9);
insert into movimiento values(98, 'Pisotón', 65, 100, 'Causa daño y tiene una probabilidad del 30% de hacer retroceder.', 20, 9);
insert into movimiento values(100, 'Atizar', 80, 75, 'Causa daño.', 20, 9);
insert into movimiento values(101, 'Presa', 50, 100, 'Causa daño de 2 a 5 turnos.', 20, 9);
insert into movimiento values(102, 'Puño cometa', 18, 85, 'Causa daño de 2 a 5 turnos.', 15, 9);
insert into movimiento values(103, 'Rapidez', 60, 0, 'Causa daño. No falla.', 20, 9);
insert into movimiento values(104, 'Recuperación', 0, 0, 'Restaura la mitad de los PS máximos del usuario', 20, 9);
insert into movimiento values(105, 'Reducción', 0, 0, 'Aumenta la evasión del usuario en un nivel.', 10, 9);
insert into movimiento values(106, 'Remolino', 0, 85, 'Ahuyenta a los pokemon salvajes.', 20, 9);
insert into movimiento values(107, 'Constricción', 15, 85, 'Causa daño de 2 a 5 turnos. Imposibilidad de atacar al objetivo', 20, 9);
insert into movimiento values(109, 'Rizo de defensa', 0, 100, 'Aumenta en un nivel la defensa del usuario.', 40, 9);
insert into movimiento values(110, 'Rugido', 0, 0, 'Ahuyenta a los pokemon salvajes.', 20, 9);
insert into movimiento values(111, 'Salpicadura', 0, 0, 'No tiene ningún efecto.', 40, 9);
insert into movimiento values(112, 'Superdiente', 0, 90, 'Quita al objetivo la mitad de sus PS actuales.', 10, 9);
insert into movimiento values(113, 'Supersónico', 0, 55, 'Confunde al objetivo.', 20, 9);
insert into movimiento values(114, 'Sustituto', 0, 0, 'Crea un sustituo con el 25% de los PS maximos del usuario para que reciba el daño de los movimientos', 10, 9);
insert into movimiento values(115, 'Tornado', 40, 100, 'Causa daño.', 35, 9);
insert into movimiento values(116, 'Transformación', 0, 0, 'Convierte al usuario en el Pokémon objetivo, copiando su tipo, sus movimientos, habilidad, su ratio de captura, sus estadísticas y cambios en las mismas.', 10, 9);
insert into movimiento values(117, 'Triataque', 80, 100, 'Causa daño. Tiene un 20% de provocar quemaduras, paralisis o congelación', 10, 9);
insert into movimiento values(118, 'Venganza', 0, 0, ' Hace que el usuario se mantenga inmóvil durante 2-3 turnos seguidos, sin poder realizar ninguna acción, para después devolver el doble del daño recibido. El movimiento falla si el usuario no resulta dañado por el enemigo.', 10, 9);
insert into movimiento values(119, 'Viento cortante', 80, 75, 'carga en el primer turno que es efectuado, creando un remolino. En el segundo turno, causa daño.', 10, 9);
insert into movimiento values(120, 'Absorber', 20, 100, 'Causa daño y el usuario recupera el 50% de los PS quitados por el movimiento al objetivo', 20, 10);
insert into movimiento values(121, 'Danza pétalo', 70, 100, 'Causa daño entre 3 o 4 turnos seguidos. El usuario termina confundido.', 20, 10);
insert into movimiento values(122, 'Drenadoras', 0, 90, 'Planta tres semillas en el oponente, las cuales le roban 1/16 de sus PS máximos al final de cada turno. El usuario recupera esa misma cantidad de PS. Si el usuario es cambiado, el Pokémon que pase a ocupar su lugar recibirá esos puntos de salud. El efecto se pasa al cambiar el Pokémon infectado por drenadoras. Drenadoras no afecta a Pokémon de tipo planta.', 10, 10);
insert into movimiento values(123, 'Espora', 0, 100, 'Duerme al objetivo.', 15, 10);
insert into movimiento values(124, 'Hoja afilada', 55, 95, 'Causa daño y tiene una alta probabilidad de dar un golpe crítico (12,5%).', 25, 10);
insert into movimiento values(125, 'Látigo cepa', 35, 100, 'Causa daño.', 25, 10);
insert into movimiento values(126, 'Megaagotar', 45, 100, 'Causa daño y el usuario recupera el 50% de los PS quitados por el movimiento al objetivo', 15, 10);
insert into movimiento values(127, 'Paralizador', 0, 75, 'Paraliza al objetivo', 30, 10);
insert into movimiento values(128, 'Rayo solar', 120, 100, 'utiliza este movimiento concentra la energía solar un turno, para liberar un rayo que causa daño en el siguiente turno.', 10, 10);
insert into movimiento values(129, 'Somnífero', 0, 75, 'Duerme al objetivo', 15, 10);
insert into movimiento values(130, 'Agilidad', 0, 0, 'Sube en dos niveles la velocidad del usuario.', 30, 11);
insert into movimiento values(131, 'Amnesia', 0, 0, 'Aumenta en dos niveles el especial del usuario', 20, 11);
insert into movimiento values(132, 'Barrera', 0, 0, 'Aumneta en dos niveles la defensa del usuario.', 30, 11);
insert into movimiento values(133, 'Comesueños', 100, 100, 'Causa daño a un objetivo dormido y el usuario recupera el 50% de los PS quitados por movimiento al objetivo.', 15, 11);
insert into movimiento values(134, 'Confusión', 50, 100, 'Causa daño y tiene una probabilidad del 10% de confundir al objetivo.', 25, 11);
insert into movimiento values(135, 'Descanso', 0, 0, 'hace que el usuario se duerma y recupere la totalidad de los PS, curando en el proceso cualquier problema de estado. El usuario después permanece dormido durante 2 turnos.', 10, 11);
insert into movimiento values(136, 'Hipnosis', 0, 60, 'Duerme al objetivo.', 20, 11);
insert into movimiento values(137, 'Kinético', 0, 80, 'Baja la precisión del objetivo en un nivel.', 15, 11);
insert into movimiento values(138, 'Meditación', 0, 0, 'aumenta un nivel el ataque del usuario.', 40, 11);
insert into movimiento values(139, 'Pantalla de luz', 0, 0, 'Dobla la defensa especial del usuario.', 30, 11);
insert into movimiento values(140, 'Psicoonda', 0, 80, 'Causa un daño variable al oponente, elegido al azar de un número entre 0,5 y 1,5 veces el nivel del usuario.', 15, 11);
insert into movimiento values(141, 'Psicorrayo', 65, 60, 'Causa daño y tiene una probabilidad del 10% de confundir al objetivo.', 20,  11);
insert into movimiento values(142, 'Psíquico', 90, 100, 'Causa daño y tiene una probabilidad del 30% de bajar en un nivel el especial del objetivo.', 20,  11);
insert into movimiento values(143, 'Reflejo', 0, 0, 'Dobla la defensa física del usuario.', 20, 11);
insert into movimiento values(144, 'Teletransporte', 0, 0, 'Permite huir de combates individuales.', 20, 11);
insert into movimiento values(145, 'Avalancha', 75, 90, 'Causa daño.', 10, 12);
insert into movimiento values(146, 'Lanzarocas', 50, 65, 'Causa daño.', 15, 12);
insert into movimiento values(147, 'Excavar', 100, 100, 'Cava en el primer turno y el segundo turno ataca.', 10, 13);
insert into movimiento values(148, 'Fisura', 0, 30, 'Si acierta, provoca un golpe fulminante.', 5, 13);
insert into movimiento values(149, 'Hueso palo', 65, 85, 'Causa daño y tiene una probabilidad del 10% de hacer retroceder al objetivo.', 20, 13);
insert into movimiento values(150, 'Huesomerang', 50, 90, 'Causa daño, golpeando al objetivo en un mismo turno.', 10, 13);
insert into movimiento values(151, 'Terremoto', 100, 100, 'Causa daño.', 10, 13);
insert into movimiento values(152, 'Ácido', 40, 100, 'Causa daño y tiene una probabilidad deñ 10% de bajar un nivel la defensa del objetivo.', 30, 14);
insert into movimiento values(153, 'Armadura ácida', 0, 0, 'Sube en dos niveles la defensa del usuario.', 20, 14);
insert into movimiento values(154, 'Gas venenoso', 0, 55, 'Envenena al objetivo', 40, 14);
insert into movimiento values(155, 'Picotazo venenoso', 15, 100, 'Causa daño y tiene una probabilidad del 30% de envenenar al oponente.', 35, 14);
insert into movimiento values(156, 'Polución', 20, 70, 'Causa daño y tiene una probabilidad del 40% de envenar al objetivo.', 20,  14);
insert into movimiento values(157, 'Polvo veneno', 0, 75, 'Envenena al objetivo', 35, 14);
insert into movimiento values(158, 'Residuos', 65, 100, 'Causa daño y tiene una probabilidad del 30% de envenenar al objetivo.', 20, 14);
insert into movimiento values(159, 'Tóxico', 0, 85, 'provoca un grave envenenamiento que se agrava con el paso de los turnos.', 10, 14);
insert into movimiento values(160, 'Ataque aéreo', 140, 90, 'Se prepara durante el primer turno. En el segundo turno causa daño al objetivo.', 5, 15);
insert into movimiento values(161, 'Ataque ala', 35, 100, 'Causa daño.', 35, 15);
insert into movimiento values(162, 'Movimiento espejo', 0, 0, 'Utiliza el último ataque usado que haya tenido al usuario por objetivo. ', 20, 15);
insert into movimiento values(163, 'Ataque aéreo', 140, 90, 'Se prepara durante el primer turno. En el segundo turno causa daño al objetivo.', 5, 15);
insert into movimiento values(164, 'Pico taladro', 80, 100, 'Causa daño.', 20, 15);
insert into movimiento values(165, 'Picotazo', 35, 100, 'Causa daño.', 35, 15);
insert into movimiento values(166, 'Vuelo', 140, 90, ' emplea dos turnos: en el primero, el Pokémon vuela muy alto, tanto que estará fuera del alcance de la mayoría de los movimientos. En el segundo turno ocurre la caída del vuelo, en la cual el Pokémon golpea al oponente, pero puede ser interrumpida de muchas maneras.', 15, 15);


/* Efectos secundarios */
insert into efecto_secundario values(1, 'Bajar velocidad');
insert into efecto_secundario values(2, 'Probabilidad de critico');
insert into efecto_secundario values(3, 'Imposibilidad de atacar');
insert into efecto_secundario values(4, 'Envenenamiento leve');
insert into efecto_secundario values(5, 'Paralizar');
insert into efecto_secundario values(6, 'Quemar');
insert into efecto_secundario values(7, 'Congelar');
insert into efecto_secundario values(8, 'Bajar ataque');
insert into efecto_secundario values(9, 'Retroceso');
insert into efecto_secundario values(10, 'Confusión');
insert into efecto_secundario values(11, 'Bajar especial');
insert into efecto_secundario values(12, 'Bajar defensa');

/* Efectos secundarios movimientos */

insert into movimiento_efecto_secundario values(3, 1, 10);
insert into movimiento_efecto_secundario values(6, 1, 12.5);
insert into movimiento_efecto_secundario values(8, 1, 10);
insert into movimiento_efecto_secundario values(11, 3, 100);
insert into movimiento_efecto_secundario values(14, 4, 20);
insert into movimiento_efecto_secundario values(17, 5, 10);
insert into movimiento_efecto_secundario values(19, 5, 10);
insert into movimiento_efecto_secundario values(20, 5, 10);
insert into movimiento_efecto_secundario values(21, 5, 10);
insert into movimiento_efecto_secundario values(23, 5, 30);
insert into movimiento_efecto_secundario values(26, 6, 10);
insert into movimiento_efecto_secundario values(27, 3, 100);
insert into movimiento_efecto_secundario values(28, 6, 10);
insert into movimiento_efecto_secundario values(29, 6, 30);
insert into movimiento_efecto_secundario values(30, 6, 10);
insert into movimiento_efecto_secundario values(33, 7, 10);
insert into movimiento_efecto_secundario values(34, 8, 10);
insert into movimiento_efecto_secundario values(35, 8, 10);
insert into movimiento_efecto_secundario values(36, 8, 10);
insert into movimiento_efecto_secundario values(40, 9, 30);
insert into movimiento_efecto_secundario values(41, 9, 30);
insert into movimiento_efecto_secundario values(65, 2, 12.5);
insert into movimiento_efecto_secundario values(81, 9, 30);
insert into movimiento_efecto_secundario values(82, 5, 30);
insert into movimiento_efecto_secundario values(83, 2, 12.5);
insert into movimiento_efecto_secundario values(87, 9, 10);
insert into movimiento_efecto_secundario values(95, 9, 10);
insert into movimiento_efecto_secundario values(98, 9, 30);
insert into movimiento_efecto_secundario values(107, 3, 100);
insert into movimiento_efecto_secundario values(117, 6, 20);
insert into movimiento_efecto_secundario values(117, 5, 20);
insert into movimiento_efecto_secundario values(117, 7, 20);
insert into movimiento_efecto_secundario values(124, 2, 12.5);
insert into movimiento_efecto_secundario values(141, 10, 10);
insert into movimiento_efecto_secundario values(142, 11, 30);
insert into movimiento_efecto_secundario values(149, 12, 10);
insert into movimiento_efecto_secundario values(152, 11, 10);
insert into movimiento_efecto_secundario values(155, 4, 30);
insert into movimiento_efecto_secundario values(156, 4, 40);
insert into movimiento_efecto_secundario values(158, 4, 30);

/*Tipos de aprendizaje*/
insert into tipo_forma_aprendizaje values(1, 'MT');
insert into tipo_forma_aprendizaje values(2, 'MO');
insert into tipo_forma_aprendizaje values(3, 'Nivel');

/*Forma aprendizaje*/
insert into forma_aprendizaje values(1, 1);
insert into forma_aprendizaje values(2, 1);
insert into forma_aprendizaje values(3, 1);
insert into forma_aprendizaje values(4, 1);
insert into forma_aprendizaje values(5, 1);
insert into forma_aprendizaje values(6, 1);
insert into forma_aprendizaje values(7, 1);
insert into forma_aprendizaje values(8, 1);
insert into forma_aprendizaje values(9, 1);
insert into forma_aprendizaje values(10, 1);
insert into forma_aprendizaje values(11, 1);
insert into forma_aprendizaje values(12, 1);
insert into forma_aprendizaje values(13, 1);
insert into forma_aprendizaje values(14, 1);
insert into forma_aprendizaje values(15, 1);
insert into forma_aprendizaje values(16, 1);
insert into forma_aprendizaje values(17, 1);
insert into forma_aprendizaje values(18, 1);
insert into forma_aprendizaje values(19, 1);
insert into forma_aprendizaje values(20, 1);
insert into forma_aprendizaje values(21, 1);
insert into forma_aprendizaje values(22, 1);
insert into forma_aprendizaje values(23, 1);
insert into forma_aprendizaje values(24, 1);
insert into forma_aprendizaje values(25, 1);
insert into forma_aprendizaje values(26, 1);
insert into forma_aprendizaje values(27, 1);
insert into forma_aprendizaje values(28, 1);
insert into forma_aprendizaje values(29, 1);
insert into forma_aprendizaje values(30, 1);
insert into forma_aprendizaje values(31, 1);
insert into forma_aprendizaje values(32, 1);
insert into forma_aprendizaje values(33, 1);
insert into forma_aprendizaje values(34, 1);
insert into forma_aprendizaje values(35, 1);
insert into forma_aprendizaje values(36, 1);
insert into forma_aprendizaje values(37, 1);
insert into forma_aprendizaje values(38, 1);
insert into forma_aprendizaje values(39, 1);
insert into forma_aprendizaje values(40, 1);
insert into forma_aprendizaje values(41, 1);
insert into forma_aprendizaje values(42, 1);
insert into forma_aprendizaje values(43, 1);
insert into forma_aprendizaje values(44, 1);
insert into forma_aprendizaje values(45, 1);
insert into forma_aprendizaje values(46, 1);
insert into forma_aprendizaje values(47, 1);
insert into forma_aprendizaje values(48, 1);
insert into forma_aprendizaje values(49, 1);
insert into forma_aprendizaje values(50, 1);
insert into forma_aprendizaje values(51, 2);
insert into forma_aprendizaje values(52, 2);
insert into forma_aprendizaje values(53, 2);
insert into forma_aprendizaje values(54, 2);
insert into forma_aprendizaje values(55, 2);
insert into forma_aprendizaje values(56, 3);
insert into forma_aprendizaje values(57, 3);
insert into forma_aprendizaje values(58, 3);
insert into forma_aprendizaje values(59, 3);
insert into forma_aprendizaje values(60, 3);
insert into forma_aprendizaje values(61, 3);
insert into forma_aprendizaje values(62, 3);
insert into forma_aprendizaje values(63, 3);
insert into forma_aprendizaje values(64, 3);
insert into forma_aprendizaje values(65, 3);
insert into forma_aprendizaje values(66, 3);
insert into forma_aprendizaje values(67, 3);
insert into forma_aprendizaje values(68, 3);
insert into forma_aprendizaje values(69, 3);
insert into forma_aprendizaje values(70, 3);
insert into forma_aprendizaje values(71, 3);
insert into forma_aprendizaje values(72, 3);
insert into forma_aprendizaje values(73, 3);


/*Nivel*/

insert into nivel_aprendizaje values(56, 1);
insert into nivel_aprendizaje values(57, 7);
insert into nivel_aprendizaje values(58, 13);
insert into nivel_aprendizaje values(59, 20);
insert into nivel_aprendizaje values(60, 27);
insert into nivel_aprendizaje values(61, 34);
insert into nivel_aprendizaje values(62, 41);
insert into nivel_aprendizaje values(63, 48);
insert into nivel_aprendizaje values(64, 22);
insert into nivel_aprendizaje values(65, 30);
insert into nivel_aprendizaje values(66, 38);
insert into nivel_aprendizaje values(67, 46);
insert into nivel_aprendizaje values(68, 54);
insert into nivel_aprendizaje values(69, 43);
insert into nivel_aprendizaje values(70, 55);
insert into nivel_aprendizaje values(71, 65);
insert into nivel_aprendizaje values(72, 9);
insert into nivel_aprendizaje values(73, 15);

/*MT*/

insert into MT values(1, 'MT01');
insert into MT values(2, 'MT02');
insert into MT values(3, 'MT03');
insert into MT values(4, 'MT04');
insert into MT values(5, 'MT05');
insert into MT values(6, 'MT06');
insert into MT values(7, 'MT07');
insert into MT values(8, 'MT08');
insert into MT values(9, 'MT09');
insert into MT values(10, 'MT10');
insert into MT values(11, 'MT11');
insert into MT values(12, 'MT12');
insert into MT values(13, 'MT13');
insert into MT values(14, 'MT14');
insert into MT values(15, 'MT15');
insert into MT values(16, 'MT16');
insert into MT values(17, 'MT17');
insert into MT values(18, 'MT18');
insert into MT values(19, 'MT19');
insert into MT values(20, 'MT20');
insert into MT values(21, 'MT21');
insert into MT values(22, 'MT22');
insert into MT values(23, 'MT23');
insert into MT values(24, 'MT24');
insert into MT values(25, 'MT25');
insert into MT values(26, 'MT26');
insert into MT values(27, 'MT27');
insert into MT values(28, 'MT28');
insert into MT values(29, 'MT29');
insert into MT values(30, 'MT30');
insert into MT values(31, 'MT31');
insert into MT values(32, 'MT32');
insert into MT values(33, 'MT33');
insert into MT values(34, 'MT34');
insert into MT values(35, 'MT35');
insert into MT values(36, 'MT36');
insert into MT values(37, 'MT37');
insert into MT values(38, 'MT38');
insert into MT values(39, 'MT39');
insert into MT values(40, 'MT40');
insert into MT values(41, 'MT41');
insert into MT values(42, 'MT42');
insert into MT values(43, 'MT43');
insert into MT values(44, 'MT44');
insert into MT values(45, 'MT45');
insert into MT values(46, 'MT46');
insert into MT values(47, 'MT47');
insert into MT values(48, 'MT48');
insert into MT values(49, 'MT49');
insert into MT values(50, 'MT50');

/*MO*/
insert into MO values(51, 'MO01');
insert into MO values(52, 'MO02');
insert into MO values(53, 'MO03');
insert into MO values(54, 'MO04');
insert into MO values(55, 'MO05');


/* pokemon aprende movimiento*/

/*Bulbasaur*/
insert into pokemon_movimiento_forma values(1, 1, 56);
insert into pokemon_movimiento_forma values(1, 85, 56);
insert into pokemon_movimiento_forma values(1, 122, 57);
insert into pokemon_movimiento_forma values(1, 125, 58);
insert into pokemon_movimiento_forma values(1, 157, 59);
insert into pokemon_movimiento_forma values(1, 124, 60);
insert into pokemon_movimiento_forma values(1, 67, 61);
insert into pokemon_movimiento_forma values(1, 129, 62);
insert into pokemon_movimiento_forma values(1, 128, 63);
insert into pokemon_movimiento_forma values(1, 2, 3);
insert into pokemon_movimiento_forma values(1, 159, 6);
insert into pokemon_movimiento_forma values(1, 82, 8);
insert into pokemon_movimiento_forma values(1, 66, 9);
insert into pokemon_movimiento_forma values(1, 73, 10);
insert into pokemon_movimiento_forma values(1, 79, 20);
insert into pokemon_movimiento_forma values(1, 126, 21);
insert into pokemon_movimiento_forma values(1, 128, 22);
insert into pokemon_movimiento_forma values(1, 94, 31);
insert into pokemon_movimiento_forma values(1, 72, 32);
insert into pokemon_movimiento_forma values(1, 143, 33);
insert into pokemon_movimiento_forma values(1, 118, 34);
insert into pokemon_movimiento_forma values(1, 135, 44);
insert into pokemon_movimiento_forma values(1, 114, 50);
insert into pokemon_movimiento_forma values(1, 64, 51);

/*Ivisaur*/
insert into pokemon_movimiento_forma values(2, 1, 56);
insert into pokemon_movimiento_forma values(2, 85, 56);
insert into pokemon_movimiento_forma values(2, 122, 56);
insert into pokemon_movimiento_forma values(2, 122, 57);
insert into pokemon_movimiento_forma values(2, 125, 58);
insert into pokemon_movimiento_forma values(2, 157, 64);
insert into pokemon_movimiento_forma values(2, 124, 65);
insert into pokemon_movimiento_forma values(2, 67, 66);
insert into pokemon_movimiento_forma values(2, 129, 67);
insert into pokemon_movimiento_forma values(2, 128, 68);
insert into pokemon_movimiento_forma values(2, 2, 3);
insert into pokemon_movimiento_forma values(2, 159, 6);
insert into pokemon_movimiento_forma values(2, 82, 8);
insert into pokemon_movimiento_forma values(2, 66, 9);
insert into pokemon_movimiento_forma values(2, 73, 10);
insert into pokemon_movimiento_forma values(2, 79, 20);
insert into pokemon_movimiento_forma values(2, 126, 21);
insert into pokemon_movimiento_forma values(2, 128, 22);
insert into pokemon_movimiento_forma values(2, 94, 31);
insert into pokemon_movimiento_forma values(2, 72, 32);
insert into pokemon_movimiento_forma values(2, 143, 33);
insert into pokemon_movimiento_forma values(2, 118, 34);
insert into pokemon_movimiento_forma values(2, 135, 44);
insert into pokemon_movimiento_forma values(2, 114, 50);
insert into pokemon_movimiento_forma values(2, 64, 51);

/*Venasaur*/
insert into pokemon_movimiento_forma values(3, 1, 56);
insert into pokemon_movimiento_forma values(3, 85, 56);
insert into pokemon_movimiento_forma values(3, 122, 56);
insert into pokemon_movimiento_forma values(3, 122, 57);
insert into pokemon_movimiento_forma values(3, 125, 56);
insert into pokemon_movimiento_forma values(3, 125, 58);
insert into pokemon_movimiento_forma values(3, 157, 64);
insert into pokemon_movimiento_forma values(3, 124, 65);
insert into pokemon_movimiento_forma values(3, 67, 69);
insert into pokemon_movimiento_forma values(3, 129, 70);
insert into pokemon_movimiento_forma values(3, 128, 71);
insert into pokemon_movimiento_forma values(3, 2, 3);
insert into pokemon_movimiento_forma values(3, 159, 6);
insert into pokemon_movimiento_forma values(3, 82, 8);
insert into pokemon_movimiento_forma values(3, 66, 9);
insert into pokemon_movimiento_forma values(3, 73, 10);
insert into pokemon_movimiento_forma values(3, 88, 15);
insert into pokemon_movimiento_forma values(3, 79, 20);
insert into pokemon_movimiento_forma values(3, 126, 21);
insert into pokemon_movimiento_forma values(3, 128, 22);
insert into pokemon_movimiento_forma values(3, 94, 31);
insert into pokemon_movimiento_forma values(3, 72, 32);
insert into pokemon_movimiento_forma values(3, 143, 33);
insert into pokemon_movimiento_forma values(3, 118, 34);
insert into pokemon_movimiento_forma values(3, 135, 44);
insert into pokemon_movimiento_forma values(3, 114, 50);
insert into pokemon_movimiento_forma values(3, 64, 51);

insert into pokemon_movimiento_forma values(4, 49, 56);
insert into pokemon_movimiento_forma values(4, 85, 56);
insert into pokemon_movimiento_forma values(4, 26, 72);
insert into pokemon_movimiento_forma values(4, 90, 73);
insert into pokemon_movimiento_forma values(4, 79, 64);
insert into pokemon_movimiento_forma values(4, 65, 65);
insert into pokemon_movimiento_forma values(4, 28, 66);
insert into pokemon_movimiento_forma values(4, 27, 67);
insert into pokemon_movimiento_forma values(4, 92, 1);
insert into pokemon_movimiento_forma values(4, 2, 3);
insert into pokemon_movimiento_forma values(4, 91, 5);
insert into pokemon_movimiento_forma values(4, 159, 6);
insert into pokemon_movimiento_forma values(4, 82, 8);
insert into pokemon_movimiento_forma values(4, 66, 9);
insert into pokemon_movimiento_forma values(4, 73, 10);
insert into pokemon_movimiento_forma values(4, 44, 17);
insert into pokemon_movimiento_forma values(4, 37, 18);
insert into pokemon_movimiento_forma values(4, 39, 19);
insert into pokemon_movimiento_forma values(4, 79, 20);
insert into pokemon_movimiento_forma values(4, 16, 23);
insert into pokemon_movimiento_forma values(4, 147, 28);
insert into pokemon_movimiento_forma values(4, 94, 31);
insert into pokemon_movimiento_forma values(4, 72, 32);
insert into pokemon_movimiento_forma values(4, 143, 33);
insert into pokemon_movimiento_forma values(4, 118, 34);
insert into pokemon_movimiento_forma values(4, 29, 38);
insert into pokemon_movimiento_forma values(4, 103, 39);
insert into pokemon_movimiento_forma values(4, 58, 40);
insert into pokemon_movimiento_forma values(4, 135, 44);
insert into pokemon_movimiento_forma values(4, 18, 45);
insert into pokemon_movimiento_forma values(4, 64, 51);
insert into pokemon_movimiento_forma values(4, 78, 54);


