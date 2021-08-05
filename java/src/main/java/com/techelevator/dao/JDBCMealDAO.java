package com.techelevator.dao;

import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component

public class JDBCMealDAO implements MealDAO{
    private JdbcTemplate jdbcTemplate;
    public JDBCMealDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Meal> getAllMeals(int userID) {
        List<Meal> myMeals = new ArrayList<>();
        String sql= "SELECT meal_id, meal_name, breakfastrecipe.*, lunchrecipe.*, dinnerrecipe.* " +
                "FROM meal " +
                "JOIN recipe AS breakfastrecipe ON breakfast_id = breakfastrecipe.recipe_id " +
                "JOIN recipe AS lunchrecipe ON lunch_id = lunchrecipe.recipe_id " +
                "JOIN recipe AS dinnerrecipe ON dinner_id = dinnerrecipe.recipe_id " +
                "WHERE meal.user_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);


        while (results.next()) {

            Meal meal = mapRowToMeal(results);
            myMeals.add(meal);

        }

        return myMeals;
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

     lunchRecipe.setRecipeId(results.getInt("recipe_id"));
     lunchRecipe.setUserId(results.getInt("user_id"));
     lunchRecipe.setRecipeName(results.getString("recipe_name"));
     lunchRecipe.setReadyInMinutes(results.getString("ready_in_minutes"));
     lunchRecipe.setServing(results.getString("serving"));
     lunchRecipe.setIngredients(results.getString("recipe_ingredients"));
     lunchRecipe.setImage(results.getString("image"));
     lunchRecipe.setInstructions(results.getString("instructions"));

     dinnerRecipe.setRecipeId(results.getInt("recipe_id"));
     dinnerRecipe.setUserId(results.getInt("user_id"));
     dinnerRecipe.setRecipeName(results.getString("recipe_name"));
     dinnerRecipe.setReadyInMinutes(results.getString("ready_in_minutes"));
     dinnerRecipe.setServing(results.getString("serving"));
     dinnerRecipe.setIngredients(results.getString("recipe_ingredients"));
     dinnerRecipe.setImage(results.getString("image"));
     dinnerRecipe.setInstructions(results.getString("instructions"));

    newMeal.setBreakfastRecipe(breakfastRecipe);
    newMeal.setLunchRecipe(lunchRecipe);
    newMeal.setDinnerRecipe(dinnerRecipe);

        return newMeal;
    };


}
