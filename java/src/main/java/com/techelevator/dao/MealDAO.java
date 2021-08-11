package com.techelevator.dao;

import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;

import java.util.List;

public interface MealDAO {
    List <Meal> getMeals (int userId);

    List <Recipe> getRecipes (int userId);

    void addMeal(int userID, Meal meal);

    Meal retrieveMealByID (int mealId);

    void deleteMealPlanById(int id);

    void updateMealPlanById(Meal meal);

    Recipe retrieveRecipeByRecipeId(int id);

}
