ALTER TABLE IF EXISTS office
DROP CONSTRAINT teacher_id;

ALTER TABLE IF EXISTS teacher
DROP CONSTRAINT office_id;

DROP TABLE IF EXISTS office;
DROP TABLE IF EXISTS teacher;

--- DELETED PREVIOUS TABLES



CREATE TABLE office(
	id integer PRIMARY KEY NOT NULL,
	name varchar(20) not null,
	teacher_id integer NOT NULL
);

CREATE TABLE teacher(
	id integer PRIMARY KEY NOT NULL,
	name varchar(20) not null,
	office_id integer NOT NULL
);

-- CREATED NEW TABLES



ALTER TABLE office
ADD CONSTRAINT teacher_id 
FOREIGN KEY (teacher_id) REFERENCES teacher(id);

ALTER TABLE teacher
ADD CONSTRAINT office_id 
FOREIGN KEY (office_id) REFERENCES office(id);

--- ADDED CONSTRAINTS
