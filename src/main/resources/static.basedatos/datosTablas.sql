INSERT INTO ciudad values 
(04, 'Almeria'),
(18, 'Granada'),
(29, 'Málaga'),
(11, 'Cádiz'),
(21, 'Huelva'),
(41, 'Sevilla'),
(14, 'Córdoba'),
(23, 'Jaén');

INSERT INTO usuario values 
(1, 'admin@email.com', 'admin', 'Admin', 'Admin', null),
(2, 'usuario@email.com', 'usuario', 'Usuario', 'Colaborador', null),
(3, 'veronica@email.com', 'veronica', 'veronica', 'González', 111-111-111),
(4, 'natalia@email.com', 'natalia', 'natalia', 'castillo', 222-222-222);

INSERT INTO categoria values 
(1, 'Exposición', 'https://vectorified.com/images/icon-museum-25.png'),
(2, 'Turismo', 'https://svgsilh.com/png-512/2797818.png'),
(3, 'Deporte', 'https://svgsilh.com/png-512/2768733.png'),
(4, 'Visitar', 'https://i1.wp.com/www.mastermeltgroup.com/wp-content/uploads/2017/08/location-icon.png?fit=512%2C512&ssl=1'),
(5, 'Entretenimiento', 'https://freesvg.org/img/mono-gnome-question.png'),
(6, 'Varios', '');

INSERT INTO subcategoria values 
(1, 'teatro', 1),
(2, 'musical', 1),
(3, 'variedades', 1),
(4, 'museo', 2),
(5, 'escaperoom', 3),
(6, 'paintball', 3),
(7, 'surf', 4),
(8, 'senderismo', 4),
(9, 'caminitodelrey', 5),
(10, 'alcazaba', 5);

INSERT INTO empresa values 
(1, 'Alhambra', 18),
(2, 'Aliatar', 18),
(3, 'Alcazaba', 29),
(4, 'Cervantes', 29),
(5, 'EscapeRoom Solete', 29);

INSERT INTO actividad values  /*falta horario añadir cuando averiguemos*/
(1, 'El rey leon', 1, 1, null, 18),
(3, 'El rey leon', 2, 1, null, 29),
(4, 'EscapeRoom1', 3, 3, null, 29),
(5, 'Fortunata y Jacinta', 2, 1, null, 18);

INSERT INTO favoritos values 
(3, 3),
(3, 2),
(4, 5);

INSERT INTO reservas values 
(3, 3, '2022/7/15', '5/7/22,19:00:00'),
(4, 1, '2022/6/22', '2022/6/22,21:00:00');