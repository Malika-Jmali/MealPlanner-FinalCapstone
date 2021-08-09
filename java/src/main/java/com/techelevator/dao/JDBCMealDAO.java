package com.techelevator.dao;

import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component

public class JDBCMealDAO implements MealDAO{

    private JdbcTemplate jdbcTemplate;

    public JDBCMealDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Meal> getMeals(int userId) {
        List<Meal> myMeals = new ArrayList<>();
        String sql= "SELECT meal_id, meal_name, breakfastrecipe.*, lunchrecipe.recipe_id as lunch_id, lunchrecipe.user_id as lunch_user_id, lunchrecipe.recipe_name as lunch_recipe_name, lunchrecipe.ready_in_minutes as lunch_ready_in_minutes, lunchrecipe.serving as lunch_serving, lunchrecipe.recipe_ingredients as lunch_recipe_ingredients, lunchrecipe.image as lunch_image, lunchrecipe.instructions as lunch_instructions, dinnerrecipe.recipe_id as dinner_id, dinnerrecipe.user_id as dinner_user_id, dinnerrecipe.recipe_name as dinner_recipe_name, dinnerrecipe.ready_in_minutes as dinner_ready_in_minutes, dinnerrecipe.serving as dinner_serving, dinnerrecipe.recipe_ingredients as dinner_recipe_ingredients, dinnerrecipe.image as dinner_image, dinnerrecipe.instructions as dinner_instructions " +
                "FROM meal " +
                "JOIN recipe AS breakfastrecipe ON breakfast_id = breakfastrecipe.recipe_id " +
                "JOIN recipe AS lunchrecipe ON lunch_id = lunchrecipe.recipe_id " +
                "JOIN recipe AS dinnerrecipe ON dinner_id = dinnerrecipe.recipe_id " +
                "WHERE meal.user_id = ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);



        while (results.next()) {

            Meal meal = mapRowToMeal(results);
            myMeals.add(meal);

        }

        return myMeals;
    }

    @Override
    public List<Recipe> getRecipes(int userId) {
        List<Recipe> myRecipes = new ArrayList<>();{
            String sql= "SELECT * FROM recipe WHERE user_id =?";

            SqlRowSet results= jdbcTemplate.queryForRowSet(sql,userId);

            while (results.next()){

                Recipe recipe= mapRowToRecipe(results);
                myRecipes.add(recipe);

            }
        }


        return myRecipes;
    }

    @Override
    public Meal addMeal(int userID, Meal meal) {
//        Meal myMeal = new Meal();

        int mealID = getNextMealId();
    public void addMeal(int userID, Meal meal) {
        //int mealID = getNextMealId();
        meal.setMealId(getNextMealId());


        String sql = "INSERT INTO meal (meal_id, user_id, meal_name, breakfast_id, lunch_id, dinner_id) VALUES (?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql, meal.getMealId(), userID, meal.getMealName(), meal.getBreakfastID(), meal.getLunchID(), meal.getDinnerID());


    }

    @Override
    public Meal retrieveMealByID(int mealId) {
        Meal theMeal = new Meal();

        String sql = "SELECT meal_id, meal_name, breakfastrecipe.*, lunchrecipe.recipe_id as lunch_id, lunchrecipe.user_id as lunch_user_id, lunchrecipe.recipe_name as lunch_recipe_name, lunchrecipe.ready_in_minutes as lunch_ready_in_minutes, lunchrecipe.serving as lunch_serving, lunchrecipe.recipe_ingredients as lunch_recipe_ingredients, lunchrecipe.image as lunch_image, lunchrecipe.instructions as lunch_instructions, dinnerrecipe.recipe_id as dinner_id, dinnerrecipe.user_id as dinner_user_id, dinnerrecipe.recipe_name as dinner_recipe_name, dinnerrecipe.ready_in_minutes as dinner_ready_in_minutes, dinnerrecipe.serving as dinner_serving, dinnerrecipe.recipe_ingredients as dinner_recipe_ingredients, dinnerrecipe.image as dinner_image, dinnerrecipe.instructions as dinner_instructions " +
                "FROM meal " +
                "JOIN recipe AS breakfastrecipe ON breakfast_id = breakfastrecipe.recipe_id " +
                "JOIN recipe AS lunchrecipe ON lunch_id = lunchrecipe.recipe_id " +
                "JOIN recipe AS dinnerrecipe ON dinner_id = dinnerrecipe.recipe_id " +
                "WHERE meal.meal_id = ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, mealId);

        while(results.next()){
            theMeal = mapRowToMeal(results);
        }


        return theMeal;
    }

    private Meal mapRowToMeal(SqlRowSet results){

        Meal newMeal = new Meal();
        Recipe breakfastRecipe = new Recipe();
        Recipe lunchRecipe = new Recipe();
        Recipe dinnerRecipe = new Recipe();
     newMeal.setMealId(results.getInt("meal_id"));
     newMeal.setMealName(results.getString("meal_name"));
     breakfastRecipe.setRecipeId(results.getInt("recipe_id"));
     breakfastRecipe.setUserId(results.getInt("user_id"));
     breakfastRecipe.setRecipeName(results.getString("recipe_name"));
     breakfastRecipe.setReadyInMinutes(results.getString("ready_in_minutes"));
     breakfastRecipe.setServing(results.getString("serving"));
     breakfastRecipe.setIngredients(results.getString("recipe_ingredients"));
     breakfastRecipe.setImage(results.getString("image"));
     breakfastRecipe.setInstructions(results.getString("instructions"));

     lunchRecipe.setRecipeId(results.getInt("lunch_id"));
     lunchRecipe.setUserId(results.getInt("lunch_user_id"));
     lunchRecipe.setRecipeName(results.getString("lunch_recipe_name"));
     lunchRecipe.setReadyInMinutes(results.getString("lunch_ready_in_minutes"));
     lunchRecipe.setServing(results.getString("lunch_serving"));
     lunchRecipe.setIngredients(results.getString("lunch_recipe_ingredients"));
     lunchRecipe.setImage(results.getString("lunch_image"));
     lunchRecipe.setInstructions(results.getString("lunch_instructions"));

     dinnerRecipe.setRecipeId(results.getInt("dinner_id"));
     dinnerRecipe.setUserId(results.getInt("dinner_user_id"));
     dinnerRecipe.setRecipeName(results.getString("dinner_recipe_name"));
     dinnerRecipe.setReadyInMinutes(results.getString("dinner_ready_in_minutes"));
     dinnerRecipe.setServing(results.getString("dinner_serving"));
     dinnerRecipe.setIngredients(results.getString("dinner_recipe_ingredients"));
     dinnerRecipe.setImage(results.getString("dinner_image"));
     dinnerRecipe.setInstructions(results.getString("dinner_instructions"));

     newMeal.setBreakfastID(breakfastRecipe.getRecipeId());
        newMeal.setLunchID(lunchRecipe.getRecipeId());
        newMeal.setDinnerID(dinnerRecipe.getRecipeId());

    newMeal.setBreakfastRecipe(breakfastRecipe);
    newMeal.setLunchRecipe(lunchRecipe);
    newMeal.setDinnerRecipe(dinnerRecipe);

        return newMeal;
    };

    private  Recipe mapRowToRecipe(SqlRowSet results){

        Recipe newRecipe= new Recipe();
        newRecipe.setRecipeId(results.getInt("recipe_id"));

        newRecipe.setUserId(results.getInt("user_id"));
        newRecipe.setRecipeName(results.getString("recipe_name"));
        newRecipe.setReadyInMinutes(results.getString("ready_in_minutes"));
        newRecipe.setServing(results.getString("serving"));
        newRecipe.setIngredients(results.getString("recipe_ingredients"));
        newRecipe.setImage(results.getString("image"));
        newRecipe.setInstructions(results.getString("instructions"));

        return  newRecipe;


    };
    private int getNextMealId() {
        SqlRowSet nextIdResult = jdbcTemplate.queryForRowSet("SELECT nextval('meal_meal_id_seq')");
        if(nextIdResult.next()) {
            return nextIdResult.getInt(1);
        } else {
            throw new RuntimeException("Something went wrong while getting an id for the new address");
        }
    }



}
