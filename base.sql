CREATE DATABASE "Films"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


-- DROP TABLE IF EXISTS film_starring CASCADE;
-- DROP TABLE IF EXISTS film_roles_dubbed CASCADE;
-- DROP TABLE IF EXISTS film CASCADE;
-- DROP TABLE IF EXISTS starring CASCADE;
-- DROP TABLE IF EXISTS roles_dubbed CASCADE;
-- DROP TABLE IF EXISTS person CASCADE;
-- DROP TABLE IF EXISTS genre CASCADE;
-- DROP TABLE IF EXISTS spectators CASCADE;

create table film
(
	film_id integer primary key,
	film_name varchar(128) not null,
	film_date_year smallint not null,
	us_fees_dollar money not null,
	world_fees_dollar money not null,
	russia_premiere date not null,
	world_premiere date not null,
	age varchar(3) not null,
	mpaa_raiting varchar(3) not null,
	duration interval not null
);

create table starring
(
	starring_id integer primary key,
	starring_name varchar(128) not null
);

create table roles_dubbed
(
	roles_dubbed_id integer primary key,
	roles_dubbed_name varchar(128) not null
);

-- один ко многим
create table person
(
	person_id integer primary key,
	person_name varchar(128) not null,
	profession text not null,
	fk_film_id integer references film (film_id) NOT NULL
);

-- один ко многим
create table genre              
(
	genre_id integer primary key,
	genre_name text not null,
	fk_film_id integer references film (film_id) NOT NULL
);

-- один ко многим
create table spectators
(
	spectators_id integer primary key,
	country_name text not null,
	count_spectators bigint not null,
	fk_film_id integer references film (film_id) NOT NULL
);

--многие ко многим
create table film_starring
(
	film_id integer REFERENCES film(film_id),
	starring_id integer REFERENCES starring(starring_id),
	CONSTRAINT film_starring_pkey PRIMARY KEY (film_id, starring_id)--composite key
);

--многие ко многим
create table film_roles_dubbed
(
	film_id integer REFERENCES film(film_id),
	roles_dubbed_id integer REFERENCES roles_dubbed(roles_dubbed_id),
	CONSTRAINT film_roles_dubbed_pkey PRIMARY KEY (film_id, roles_dubbed_id)--composite key
);


-- INSERT INTO film (film_id,film_name,film_date_year,us_fees_dollar,world_fees_dollar,russia_premiere, 
-- 				  world_premiere,age,mpaa_raiting,duration)
-- VALUES
-- (1, 'Зеленая миля', 1999, 1000, 2500, '1961-06-16', '1961-06-16', '16+', 'R', '82 minutes'),
-- (2, 'Форрест Гамп', 1999, 1000, 2500, '1961-06-16', '1961-06-16', '16+', 'R', '82 minutes'),
-- (3, 'Поймай меня, если сможешь', 1999, 1000, 2500, '1961-06-16', '1961-06-16', '16+', 'R', '82 minutes'),
-- (4, 'Изгой', 1999, 1000, 2500, '1961-06-16', '1961-06-16', '16+', 'R', '82 minutes'),
-- (5, 'Спасти рядового Райана', 1999, 1000, 2500, '1961-06-16', '1961-06-16', '16+', 'R', '82 minutes');


-- INSERT INTO starring (starring_id,starring_name)
-- VALUES
-- (1, 'Том Хэнкс'),
-- (2,'Дэвид Морс'),
-- (3,'Бонни Хант'),
-- (4,'Джеймс Кромуэлл'),
-- (5,'Майкл Джитер');

-- INSERT INTO roles_dubbed (roles_dubbed_id,roles_dubbed_name)
-- VALUES
-- (1, 'Всеволод Кузнецов'),
-- (2,'Владимир Антоник'),
-- (3,'Любовь Германова'),
-- (4,'Валентин Голубенко'),
-- (5,'Александр Белявский');

-- INSERT INTO person (person_id,person_name,profession,fk_film_id)
-- VALUES
-- (1, 'Стивен Кинг', 'Сценарий',1),
-- (2, 'Дэвид Тэттерсолл', 'Оператор',1),
-- (3, 'Томас Ньюман', 'Композитор',1),
-- (4, 'Стивен Кинг', 'Сценарий',2),
-- (5, 'Стивен Кинг', 'Сценарий',3);

-- INSERT INTO genre (genre_id,genre_name,fk_film_id)
-- VALUES
-- (1, 'драма',1),
-- (2, 'фэнтези',1),
-- (3, 'криминал',1),
-- (4, 'комедия',2),
-- (5, 'ужасы',3);

-- INSERT INTO spectators (spectators_id,country_name,count_spectators,fk_film_id)
-- VALUES
-- (1, 'Россия',1000,1),
-- (2, 'США',10000,1),
-- (3, 'Германия',500,1),
-- (4, 'Россия',900,2),
-- (5, 'США',5000,2),
-- (6, 'Германия',700,2);

-- INSERT INTO film_starring (film_id, starring_id)
-- VALUES
-- (1,1),
-- (1,2),
-- (2,3),
-- (3,3),
-- (4,3),
-- (5,4),
-- (5,5);

-- INSERT INTO film_roles_dubbed (film_id, roles_dubbed_id)
-- VALUES
-- (1,1),
-- (2,1),
-- (3,2),
-- (4,3),
-- (5,4),
-- (5,5);


-- SELECT *
-- FROM film
-- JOIN film_starring ON film.film_id = film_starring.film_id
-- JOIN starring ON film_starring.starring_id = starring.starring_id
-- WHERE starring_name='Бонни Хант';



