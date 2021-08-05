acular


CREATE TABLE categories(
category_id SERIAL NOT NULL,
category_name varchar(50) NOT NULL,
CONSTRAINT pk_category_id PRIMARY KEY (category_id)
);

CREATE TABLE recipe (
recipe_id SERIAL NOT NULL,

instructions varchar(1000),

CONSTRAINT pk_recipe_id PRIMARY KEY (recipe_id)

);

CREATE TABLE recipe_category(
category_id INT,
recipe_id INT,

constraint fk_category_id foreign key (category_id) references categories(category_id),
constraint fk_recipe_id foreign key (recipe_id) references recipe(recipe_id)


);