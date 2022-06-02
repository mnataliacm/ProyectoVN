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
(1, 'Admin', 'Admin', 'admin', 'admin@email.com', null, null),
(2, 'Usuario', 'Colaborador', 'usuario', 'usuario@email.com', null, null),
(3, 'veronica', 'González', 'veronica', 'veronica@email.com', 111-111-111, 29),
(4, 'natalia', 'castillo', 'natalia', 'natalia@email.com', 222-222-222, 18);

INSERT INTO categoria values 
(1, 'Teatro', 'https://vectorified.com/images/icon-museum-25.png'),
(2, 'Turismo', 'https://svgsilh.com/png-512/2797818.png'),
(3, 'Deporte', 'https://svgsilh.com/png-512/2768733.png'),
(4, 'Visitar', 'https://i1.wp.com/www.mastermeltgroup.com/wp-content/uploads/2017/08/location-icon.png?fit=512%2C512&ssl=1'),
(5, 'Entretenimiento', 'https://freesvg.org/img/mono-gnome-question.png'),
(6, 'Varios', '');

INSERT INTO empresa values 
(1, 'Alhambra'),
(2, 'Aliatar'),
(3, 'Alcazaba'),
(4, 'Cervantes'),
(5, 'EscapeRoom Solete');

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO actividad VALUES
(1, 1, 18, 'El rey leon', 2, 'J-D de 18:00 a 23:00', 'https://www.tupalacio.org/events/categoria/palacio-de-congresos/'),
(2, 1, 29, 'El rey leon', 4, null, 'https://www.teatrocervantes.com/'),
(3, 3, 29, 'EscapeRoom1', 0, null, null),
(4, 1, 18, 'Fortunata y Jacinta', 0, null, null),
(5, 5, 29, 'Senderismo', 0, null, null);

INSERT INTO reserva VALUES
(1, 3, 1, '21:00:00', '2020-05-20'),
(2, 4, 1, '21:00:00', '2020-05-20'),
(3, 3, 3, '18:00:00', '2023-06-15'),
(4, 4, 5, '10:00:00', '2023-08-05');
