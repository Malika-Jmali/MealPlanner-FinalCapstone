package com.techelevator.dao;

import com.techelevator.model.Meal;

import java.util.List;

public interface MealDAO {
    List <Meal> getAllMeals (int userId);
}
