ALTER TABLE recipe
ADD COLUMN IF NOT EXISTS recipe_name varchar(100);

CREATE TABLE categories(
category_id SERIAL NOT NULL,
category_name varchar(50) NOT NULL,
CONSTRAINT pk_category_id PRIMARY KEY (category_id)
);

CREATE TABLE recipe (
recipe_id SERIAL NOT NULL,
recipe_name varchar(100),
instructions varchar(1000),
CONSTRAINT pk_recipe_id PRIMARY KEY (recipe_id)
);

CREATE TABLE recipe_category(
category_id INT,
recipe_id INT,
constraint fk_category_id foreign key (category_id) references categories(category_id),
constraint fk_recipe_id foreign key (recipe_id) references recipe(recipe_id)
);

CREATE TABLE ingredient(
ingredient_id SERIAL NOT NULL,
ingredient_name varchar(50) NOT NULL,
ingredient_measurement varchar(50) NOT NULL,
CONSTRAINT pk_ingredient_id PRIMARY KEY (ingredient_id)
);

CREATE TABLE recipe_ingredient(
ingredient_id INT,
recipe_id INT,
constraint fk_ingredient_id foreign key (ingredient_id) references ingredient(ingredient_id),
constraint fk_recipe_id foreign key (recipe_id) references recipe(recipe_id)
);

INSERT INTO categories (category_id, category_name) VALUES (1, 'Breakfast');
INSERT INTO categories (category_id, category_name) VALUES (2, 'Lunch');
INSERT INTO categories (category_id, category_name) VALUES (3, 'Dinner');

INSERT INTO recipe (recipe_id, instructions, recipe_name) VALUES (1, 'Cook until done', 'Fishsticks');
INSERT INTO recipe (recipe_id, instructions, recipe_name) VALUES (2, 'Open bag', 'Chips');
INSERT INTO recipe (recipe_id, instructions, recipe_name) VALUES (3, 'Drive to McDonalds, order, leave', 'Black Coffee');

INSERT INTO ingredient (ingredient_id, ingredient_name, ingredient_measurement) VALUES (1, 'fishsticks', 'As many as you want');
INSERT INTO ingredient (ingredient_id, ingredient_name, ingredient_measurement) VALUES (2, 'potato chips', 'Whole bag');
INSERT INTO ingredient (ingredient_id, ingredient_name, ingredient_measurement) VALUES (3, 'McDonalds', 'Small');

INSERT INTO recipe_category (category_id, recipe_id) VALUES (1,1);
INSERT INTO recipe_category (category_id, recipe_id) VALUES (2,2);
INSERT INTO recipe_category (category_id, recipe_id) VALUES (3,3);

INSERT INTO recipe_ingredient (ingredient_id, recipe_id) VALUES (1,1);
INSERT INTO recipe_ingredient (ingredient_id, recipe_id) VALUES (2,2);
INSERT INTO recipe_ingredient (ingredient_id, recipe_id) VALUES (3,3);