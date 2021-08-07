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
	recipe_ingredients varchar(3000) NOT NULL,
	image varchar (1000),
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

INSERT INTO recipe (recipe_id, user_id, recipe_name, ready_in_minutes, serving, recipe_ingredients, image, instructions) VALUES (1,1, 'Breakfast Vegetable Scramble', '15', '2', 
'2 tablespoons olive oil,1/2 red onion,1 red bell pepper,4 cups baby kale or spinach,1 tablespoon chopped chives or other fresh herbs,4 eggs or this Tofu Scramble,¼ cup shredded Colby cheese, ¼ teaspoon kosher salt,Fresh ground black pepper,
Avocado slices',
'https://www.acouplecooks.com/wp-content/uploads/2020/09/Veggie-Breakfast-Scramble-012.jpg', 'Prep the vegetables: Thinly slice the red onion. Large dice the bell pepper. Prep the eggs: In a medium bowl, crack the eggs and whisk them 
together until well-beaten. Stir in the shredded cheese, fresh herbs, kosher salt, and plenty of fresh ground pepper. Or, complete Step 1 of the Tofu Scramble. Cook the 
vegetables: Heat the olive oil in a large skillet over medium high heat. When hot, add the onion and peppers. Cook 3 to 4 minutes until tender and just starting to brown, 
stirring occasionally. Reduce heat to low. Add a pinch of salt and the baby greens. Cook for 30 seconds until wilted. Remove and set aside. Cook the eggs: Keep heat on low. 
Pour in the eggs. Cook for 20 to 30 seconds. When the eggs just start to set, use a flat spatula to scrape sections of eggs, gently stirring constantly until cooked but still 
soft, about 1 minute. Or, complete Step 2 of the Tofu Scramble. Add the vegetables and serve: Add the veggies back to the pan with the eggs or tofu. Stir for a few seconds until
 combined and warmed. Serve immediately.');

INSERT INTO recipe (recipe_id, user_id, recipe_name, ready_in_minutes, serving, recipe_ingredients, image, instructions) VALUES (2, 1, 'Garden Fresh Flatbread', '25','4', 
'8.8 oz pkg naan thaw if frozen,¼ cup prepared basil pesto,1 cup red tomatoes halved,½ red bell pepper stemmed seeded and sliced,¼ medium zucchini thinly sliced,¼ small red onion thinly sliced,2 oz fresh mozzarella cheese shredded*,2 Tbsp balsamic glaze,2 Tbsp chopped fresh basil,',
'https://fruitsandveggies.org/wp-content/uploads/2021/06/Garden-Fresh-Flatbread-Meghan-Sedivy-407x320.jpg',
'Preheat oven to 400 degrees F. Place naan on a large baking sheet. Brush with pesto. Top with tomatoes, bell pepper, zucchini, red onion, corn, and cheese.
Bake for 10 to 12 minutes or until vegetables are tender and cheese is melted.
Drizzle pizza with balsamic glaze and top with basil. Sprinkle with crushed red pepper, if desired.');

INSERT INTO recipe (recipe_id, user_id, recipe_name, ready_in_minutes, serving, recipe_ingredients, image, instructions) VALUES (3, 1, 'Sesame Garlic Ramen Noodles', '25', '4',
'3 (3 oz) packages instant ramen noodles, flavor packets discarded,¼ cup low sodium soy sauce,¼ cup oyster sauce,1 tbsp rice vinegar,1 tbsp brown sugar (optional),½ -1 tsp chili sauce like sambal or sriracha,¼ cup water,2 tbsp toasted sesame oil,4 cloves garlic minced about 2 tsp,1 tsp freshly grated ginger,4-6 green onions thinly sliced,1 tsp sesame seeds',
'https://images.themodernproper.com/billowy-turkey/production/posts/2020/Sesame-Garlic-Ramen-Noodles-15.jpg?w=595&auto=compress%2Cformat&fit=crop&fp-x=0.5&fp-y=0.5&dm=1600182904&s=d161637af60ff7841f9c8ae07618fe1b',
'In a large pot of boiling water, cook ramen according to package, about 3-4 minutes; drain well. 
In a small bowl, whisk together soy sauce, oyster sauce, rice vinegar, brown sugar, chili sauce and water. 
Heat sesame oil in a large skillet set over medium heat. 
Stir in garlic and ginger until fragrant, about 1 minute. 
Pour in the bowl of sauce and simmer for 3-4 minutes. Stir in cooked ramen noodles until heated through and evenly coated in sauce, about 3 minutes. 
Garnish with green onions and sesame seeds.');

INSERT INTO meal (meal_id, user_id, meal_name, breakfast_id, lunch_id, dinner_id) VALUES (1, 1, 'Vegetarian', 1, 2, 3);

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO final_capstone_appuser;
COMMIT TRANSACTION;

