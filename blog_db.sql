-- Crea la tabla de usuarios
create table users(
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(100)
);
-- Añade 3 usuarios
insert into users(first_name, last_name, email) values
('Naomi', 'Idalgo', 'naomi@gmail.com'),
('Roberto', 'Sacarias', 'robin@gmail.com'),
('Anais', 'Colan', 'anaiscolan@gmail.com');

-- Crea la tabla de posts
create table posts(
	id serial primary key,
	creator_id int references users(id),
	title varchar(50),
	text text
);

-- Añade 5 posts
insert into posts (creator_id ,title ,text) values
(2, 'leer', 'leer es una forma de adquirir conocimiento mas sencilla posible'),
(1, 'perros', 'los perros son unos animales, amistosos para el hombre. Ciertas rasas no'),
(3, 'Programacion', 'la programacion es muy importante para resolver una cierta cantidad de problemas'),
(3, 'procratinacion', 'es una de las cosas que puede drenarte el tiempo y asi relentizar tu progreso, en cierto caso rendirse'),
(1, 'escusas', 'es una de las peores cosas que puedes hacer, y de hecho que te va a alejar de tu exito');


-- Crea la tabla de likes
create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

-- Añade 5 likes
insert into likes(user_id, post_id) values
(1,1),
(1,3),
(3,1),
(2,3),
(2,2);

-- Traer todos los posts y la informacion del usuario del campo creator_id
select * from posts inner join users on
posts.creator_id = users.id;

-- Trae todos los posts, con la informacion de los usuarios que les dieron like.
-- posts-likes-users
select posts.title, posts.text, users.first_name, users.last_name, users.email  from posts left join likes on
posts.id = likes.post_id left join users on
likes.user_id = users.id;