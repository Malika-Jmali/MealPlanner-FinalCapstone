BEGIN TRANSACTION;
DROP TABLE IF EXISTS meal;
DROP TABLE IF EXISTS recipe;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE recipe (
	recipe_id serial NOT NULL,
	user_id int NOT NULL,
	recipe_name varchar(50) NOT NULL,
	ready_in_minutes varchar(10) NOT NULL,
	serving varchar(50) NOT NULL,
	recipe_ingredients varchar(300) NOT NULL,
	image varchar (100),
	instructions varchar(2000) NOT NULL,
	CONSTRAINT PK_recipe_id PRIMARY KEY (recipe_id),
	CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);


CREATE TABLE meal (
	meal_id serial NOT NULL,
	user_id int NOT NULL,
	meal_name varchar(50) NOT NULL,
        breakfast_id int NOT NULL,
	lunch_id int NOT NULL,
        dinner_id int NOT NULL,
	CONSTRAINT PK_meal_id PRIMARY KEY (meal_id),
	CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
        CONSTRAINT FK_breakfast_id FOREIGN KEY (breakfast_id) REFERENCES recipe(recipe_id),
        CONSTRAINT FK_lunch_id FOREIGN KEY (lunch_id) REFERENCES recipe(recipe_id),
        CONSTRAINT FK_dinner_id FOREIGN KEY (dinner_id) REFERENCES recipe(recipe_id)
);


INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO recipe () VALUES ();



COMMIT TRANSACTION;
