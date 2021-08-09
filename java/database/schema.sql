BEGIN TRANSACTION;
DROP TABLE IF EXISTS meal;
DROP TABLE IF EXISTS recipe;
DROP TABLE IF EXISTS users;
--DROP SEQUENCE IF EXISTS seq_meal_id;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

--CREATE SEQUENCE seq_meal_id
--INCREMENT BY 1
--NO MAXVALUE
  --NO MINVALUE
  --CACHE 1;
  



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
	--meal_id int DEFAULT nextval('seq_meal_id'::regclass) NOT NULL,
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

INSERT INTO recipe (recipe_id, user_id, recipe_name, ready_in_minutes, serving, recipe_ingredients, image, instructions) VALUES (DEFAULT, 1, 'Breakfast Vegetable Scramble', '15', '2', '2 tablespoons olive oil,1/2 red onion,1 red bell pepper,4 cups baby kale or spinach,1 tablespoon chopped chives or other fresh herbs,4 eggs or this Tofu Scramble,¼ cup shredded Colby cheese, ¼ teaspoon kosher salt,Fresh ground black pepper, Avocado slices','https://www.acouplecooks.com/wp-content/uploads/2020/09/Veggie-Breakfast-Scramble-012.jpg', 'Prep the vegetables: Thinly slice the red onion. Large dice the bell pepper. Prep the eggs: In a medium bowl, crack the eggs and whisk them together until well-beaten. Stir in the shredded cheese, fresh herbs, kosher salt, and plenty of fresh ground pepper. Or, complete Step 1 of the Tofu Scramble. Cook the vegetables: Heat the olive oil in a large skillet over medium high heat. When hot, add the onion and peppers. Cook 3 to 4 minutes until tender and just starting to brown, stirring occasionally. Reduce heat to low. Add a pinch of salt and the baby greens. Cook for 30 seconds until wilted. Remove and set aside. Cook the eggs: Keep heat on low. Pour in the eggs. Cook for 20 to 30 seconds. When the eggs just start to set, use a flat spatula to scrape sections of eggs, gently stirring constantly until cooked but still soft, about 1 minute. Or, complete Step 2 of the Tofu Scramble. Add the vegetables and serve: Add the veggies back to the pan with the eggs or tofu. Stir for a few seconds until combined and warmed. Serve immediately.');

INSERT INTO recipe (recipe_id, user_id, recipe_name, ready_in_minutes, serving, recipe_ingredients, image, instructions) VALUES (2, 1, 'Garden Fresh Flatbread', '25','4', '8.8 oz pkg naan thaw if frozen,¼ cup prepared basil pesto,1 cup red tomatoes halved,½ red bell pepper stemmed seeded and sliced,¼ medium zucchini thinly sliced,¼ small red onion thinly sliced,2 oz fresh mozzarella cheese shredded*,2 Tbsp balsamic glaze,2 Tbsp chopped fresh basil,','https://fruitsandveggies.org/wp-content/uploads/2021/06/Garden-Fresh-Flatbread-Meghan-Sedivy-407x320.jpg','Preheat oven to 400 degrees F. Place naan on a large baking sheet. Brush with pesto. Top with tomatoes, bell pepper, zucchini, red onion, corn, and cheese. Bake for 10 to 12 minutes or until vegetables are tender and cheese is melted. Drizzle pizza with balsamic glaze and top with basil. Sprinkle with crushed red pepper, if desired.');

INSERT INTO recipe (recipe_id, user_id, recipe_name, ready_in_minutes, serving, recipe_ingredients, image, instructions) VALUES (3, 1, 'Sesame Garlic Ramen Noodles', '25', '4','3 (3 oz) packages instant ramen noodles, flavor packets discarded,¼ cup low sodium soy sauce,¼ cup oyster sauce,1 tbsp rice vinegar,1 tbsp brown sugar (optional),½ -1 tsp chili sauce like sambal or sriracha,¼ cup water,2 tbsp toasted sesame oil,4 cloves garlic minced about 2 tsp,1 tsp freshly grated ginger,4-6 green onions thinly sliced,1 tsp sesame seeds', 'https://images.themodernproper.com/billowy-turkey/production/posts/2020/Sesame-Garlic-Ramen-Noodles-15.jpg?w=595&auto=compress%2Cformat&fit=crop&fp-x=0.5&fp-y=0.5&dm=1600182904&s=d161637af60ff7841f9c8ae07618fe1b', 'In a large pot of boiling water, cook ramen according to package, about 3-4 minutes; drain well. In a small bowl, whisk together soy sauce, oyster sauce, rice vinegar, brown sugar, chili sauce and water. Heat sesame oil in a large skillet set over medium heat. Stir in garlic and ginger until fragrant, about 1 minute. Pour in the bowl of sauce and simmer for 3-4 minutes. Stir in cooked ramen noodles until heated through and evenly coated in sauce, about 3 minutes. Garnish with green onions and sesame seeds.');

INSERT INTO recipe (recipe_id, user_id, recipe_name, ready_in_minutes, serving, recipe_ingredients, image, instructions) VALUES (4,1, 'Vegeterian stew', '27', '5',
'¼ Cup(s) (59 mL) Olive oil,1 Onion (sliced),1 Potato (diced),3 Small carrots (diced),2 Garlic cloves (minced),2 tsp (10 mL) Vegeta powder – 1 1/3 bouillon cubes (Knorr/Maggi) can be used instead,1 Cup (237 mL) Water (hot),3 Tomatoes (blended),2 Cups (260 g) Brussels sprouts – Cabbage can be used instead,1 Cup (237 mL) Vegetable stock – Optional if serving the stew with grits or couscous,5 Packed Cups (375 g) Fresh spinach leaves (chopped),½ Cup(s) (50 g) Fresh parsley (chopped)',
'http://xawaash.com/wp-content/uploads/2012/11/Vegetable-Stew-10.jpg',
'Cut the stem. Remove the outer leaves. Cut into quaters. Using medium heat, saute the onions in the oil for 2 minutes. Add the diced potatoes and carrots. Add the Vegeta seasoning and the garlic. Stir well then cover and cook for 5 minutes. During that period, stir twice to prevent the vegetables from sticking to the pan. Add the hot water, then cover and cook for another 5 minutes. Add the tomatoes, stir well. Adding the tomatoes in the beginning would make the potatoes take longer to soften. Cover and cook for 5 minutes. Add the brussels sprout, then cover and cook for 5 minutes. Add the vegetable stock if serving the stew with grits. Add the spinach. Cover and cook for another 5 minutes. Add the parsley, stir well, and serve hot.');

INSERT INTO recipe (recipe_id, user_id, recipe_name, ready_in_minutes, serving, recipe_ingredients, image, instructions) VALUES (5, 1, 'Baked Fish with Garlic and Basil', '25', '6',
'2 lb fish fillet like halibut or choice of fish,1 ½ tsp dry oregano,1 tsp ground coriander,1 tsp sweet paprika,10 garlic cloves minced,15 basil leaves sliced into ribbons,6 tbsp extra virgin olive oil,Juice of 1 lemon,2 bell peppers any color sliced,2 shallots peeled and sliced,Salt and pepper to taste,',
'https://www.themediterraneandish.com/wp-content/uploads/2020/03/baked-fish-recipe-3.jpg,',
'Pat fish fillet dry and season with salt and pepper on both sides. Place the  fish in a large zip-top bag. Add the oregano, coriander, paprika, minced garlic, basil, extra virgin olive oil and lemon juice. Zip the bag shut and massage to be sure the fish is evenly coated in the marinade. Marinated for 30 minutes or up to 1 hour in the fridge. Heat oven to 425 degrees F.Arrange bell peppers and shallots in the bottom of a 9 x 13 baking dish. Place the fish on top and pour the marinade over it. Bake in heated oven for 15 minutes or until fish is done and flakes easily.');

INSERT INTO recipe (recipe_id, user_id, recipe_name, ready_in_minutes, serving, recipe_ingredients, image, instructions) VALUES (6, 1, 'Shakshuka', '30', '6',
'Extra virgin olive oil,1 large yellow onion chopped,2 green peppers chopped,2 garlic cloves peeled and chopped,1 tsp ground coriander,1 tsp sweet paprika,½ tsp ground cumin,Pinch red pepper flakes (optional),Salt and pepper to taste,6 Vine-ripe tomatoes chopped (about 6 cups chopped tomatoes),½ cup tomato sauce,6 large eggs,¼ cup chopped fresh parsley leaves (about 0.2 ounces or 5 grams),¼ cup chopped fresh mint leaves (about 0.2 ounces or 5 grams)',
'https://www.themediterraneandish.com/wp-content/uploads/2017/01/Shakshuka-Recipe-The-Mediterranean-Dish-101-768x1152.jpg',
'Heat 3 tbsp olive oil in a large cast iron skillet. Add the onions, green peppers, garlic, spices, pinch salt and pepper. Cook, stirring occasionally, until the vegetables have softened, about 5 minutes. Add the tomatoes and tomato sauce. Cover and let simmer for about 15 minutes. Uncover and cook a bit longer to allow the mixture to reduce and thicken. Taste and adjust the seasoning to your liking. Using a wooden spoon, make 6 indentations, or "wells," in the tomato mixture (make sure the indentations are spaced out). Gently crack an egg into each indention. Reduce the heat, cover the skillet, and cook on low until the egg whites are set. Uncover and add the fresh parsley and mint. You can add more black pepper or crushed red pepper, if you like. Serve with warm pita, challah bread, or your choice of crusty bread.');

INSERT INTO recipe (recipe_id, user_id, recipe_name, ready_in_minutes, serving, recipe_ingredients, image, instructions) VALUES (7, 1, 'Mediterranean Lentil Salad Recipe', '30', '6',
'1 cup dry green lentils or black lentils,Seeds of 1 pomegranate,Water,Kosher salt,1 small red onion chopped,¾ English cucumber small diced or chopped (about 2 ½ cups),2 to 3 cups baby spinach or other leafy green of choice,1 cup chopped fresh parsley,Crumbled feta cheese for garnish,Lime Dressing:,¼ cup fresh lime juice,? cup extra virgin olive oil,2 tsp honey,1 tsp ground cumin,½ tsp ground allspice,Salt and pepper',
'https://www.themediterraneandish.com/wp-content/uploads/2019/10/Power-Lentil-Salad-Recipe-4.jpg,',
'Cook the lentils. In a saucepan, combine lentils with 3 cups of water and pinch of kosher salt. Bring to a boil. Cover, and lower heat to medium-low. Let simmer until the lentils are fully tender (anywhere from 25 to 45 minutes depending on the kind of lentils used). Be sure to check and add water if lentils seem too dry during the cooking process (they should absorb a lot of the water. Drain and set aside to cool. In a large mixing bowl, combine cooked lentils with chopped onions, cucumbers, baby spinach, parsley, and pomegranate seeds (arils.) Give everything a gentle toss. Make the dressing. In a small bowl or measuring cup, whisk together the lime dressing ingredients. Pour the dressing over the lentil salad and toss to combine. Add a sprinkle of feta cheese to finish. Allow a few minutes for the flavors to meld before serving.');

INSERT INTO recipe (recipe_id, user_id, recipe_name, ready_in_minutes, serving, recipe_ingredients, image, instructions) VALUES (8, 1, 'Keto Italian breakfast casserole', '40', '4',
'7 oz of cauliflower chopped into bite-sized pieces,1 oz of butter,12 oz of fresh italian sausage,8 eggs,1 cup heavy whipping cream,1 cup (4 oz.) shredded cheddar cheese,¼ cup (1?3 oz.) fresh basil chopped,salt and pepper',
'https://i.dietdoctor.com/wp-content/uploads/2017/11/DD-549-keteoBreakfastcasserolewithsausage.jpg?auto=compress%2Cformat&w=400&h=225&fit=crop,',
'Preheat the oven to 375°F (175°C). Grease an 8 x 8" (20 x 20 cm) baking dish. In a large skillet, melt butter over medium-high heat. Add the cauliflower and cook until it begins to soften. Set aside in a bowl. Add sausage to the pan and use a spoon or spatula to break up into crumbles. Fry the sausage until thoroughly cooked. Season with salt and pepper. Move the sausage and the cauliflower to the baking dish. In a large bowl, whisk together the eggs, heavy cream, cheddar cheese until combined, and season with salt and pepper. Pour the egg mixture over the sausage and sprinkle the basil on top. Bake for 30–40 minutes, or until golden brown, and completely set in the middle. If the casserole is at risk of getting burned before it’s cooked through, cover with aluminum foil.');
 
INSERT INTO recipe (recipe_id, user_id, recipe_name, ready_in_minutes, serving, recipe_ingredients, image, instructions) VALUES (9, 1, 'Keto taco meatza', '30', '2',
'Crust:,11 oz. ground chicken or any ground meat,1 egg,1 tbsp Tex-Mex seasoning-sugar-free,¾ tsp salt if seasoning is not salted,1 tbsp olive oil,Topping:,3 tbsp salsa,11?5 cups (4¾ oz.) Mexican cheese shredded,2 tbsp pickled jalapeños,For Serving:,1 (7 oz.) avocado in thin slices,¼ (1 oz.) red onion in thin slices,½ cup sour cream or crème fraîche,2 tbsp fresh cilantro (optional),½ lime (optional),1 tsp red chili peppers (optional)',
'https://i.dietdoctor.com/wp-content/uploads/2018/03/Taco_Meatza_H.jpg?auto=compress%2Cformat&w=800&h=450&fit=crop,',
'Preheat the oven to 400°F (200°C). Mix ground meat with egg and spices and olive oil, until thoroughly combined. Spread the meat in thin flat circles (around 6 inches or 15 cm in diameter) in a baking tray lined with parchment paper. Bake for 10 minutes in the oven. Remove from oven and top with salsa sauce, cheese, and jalapeños. Bake for another 10-15 minutes or until the cheese has melted and got a nice golden color. Remove from the oven. Spread the onion and avocado on top. Sprinkle with cilantro, lime, sour cream, and possibly some red chili for additional color and spice.'); 

INSERT INTO recipe (recipe_id, user_id, recipe_name, ready_in_minutes, serving, recipe_ingredients, image, instructions) VALUES (10, 1, 'Keto chicken zoodle al limone', '30', '6',
'2¼ lbs zucchini, spiralized,6 garlic cloves, finely chopped,3 tbsp butter,1½ tbsp fresh thyme,2½ lbs boneless chicken thighs cut into bite-sized pieces,1½ tsp salt,¾ tsp ground black pepper,1½ lemons juice and zest,1¼ cups heavy whipping cream,¾ cup (2 oz.) shredded Parmesan cheese, finely grated',
'https://i.dietdoctor.com/wp-content/uploads/2020/08/Keto-Chicken-Al-Limone-h.jpg?auto=compress%2Cformat&w=800&h=450&fit=crop,',
'Spiralize your zucchini and put them in a colander over the sink to drain. If you don’t have a spiralizer you can use a vegetable peeler. Heat the butter in a frying pan over medium-high heat. Add the finely chopped garlic and the thyme and cook for a minute or so, stirring constantly to avoid burning, until fragrant. Add the chicken and cook until browned all over, approx 10 minutes (you may need to cook the chicken in batches, depending on the size of your pan). Add the cream, the lemon zest, and stir to combine. Simmer for a further 3 minutes. Add the lemon juice and half of the grated parmesan cheese, stir through and simmer for 2 more minutes. Add the zoodles and toss through to coat. Just cook until the zoodles are warm. You still want them to have some “bite” between your teeth and don’t want them to become watery. Serve garnished with remaining grated parmesan and black pepper.');
  





INSERT INTO meal (meal_id, user_id, meal_name, breakfast_id, lunch_id, dinner_id) VALUES (1, 1, 'Vegetarian', 1, 2, 3);
INSERT INTO meal (meal_id, user_id, meal_name, breakfast_id, lunch_id, dinner_id) VALUES (2, 1, 'Mediterranean', 5, 6, 7);
INSERT INTO meal (meal_id, user_id, meal_name, breakfast_id, lunch_id, dinner_id) VALUES (3, 1, 'Keto', 8, 9, 10);



--GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO final_capstone_appuser;
ALTER SEQUENCE meal_meal_id_seq RESTART 1000;

COMMIT TRANSACTION;

