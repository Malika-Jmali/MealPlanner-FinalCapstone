package com.techelevator.model;

public class Meal {

    int mealId;
    String mealName;
    int breakFastID;
    int lunchID;
    int dinnerID;
    Recipe breakfastRecipe= new Recipe();
    Recipe lunchRecipe= new Recipe();
    Recipe dinnerRecipe= new Recipe();

    public int getMealId() {
        return mealId;
    }

    public void setMealId(int mealId) {
        this.mealId = mealId;
    }

    public String getMealName() {
        return mealName;
    }

    public void setMealName(String mealName) {
        this.mealName = mealName;
    }

    public Recipe getBreakfastRecipe() {
        return breakfastRecipe;
    }

    public void setBreakfastRecipe(Recipe breakfastRecipe) {
        this.breakfastRecipe = breakfastRecipe;
    }

    public Recipe getLunchRecipe() {
        return lunchRecipe;
    }

    public void setLunchRecipe(Recipe lunchRecipe) {
        this.lunchRecipe = lunchRecipe;
    }

    public Recipe getDinnerRecipe() {
        return dinnerRecipe;
    }

    public void setDinnerRecipe(Recipe dinnerRecipe) {
        this.dinnerRecipe = dinnerRecipe;
    }

    public int getBreakFastID() {
        return breakFastID;
    }

    public void setBreakFastID(int breakFastID) {
        this.breakFastID = breakFastID;
    }

    public int getLunchID() {
        return lunchID;
    }

    public void setLunchID(int lunchID) {
        this.lunchID = lunchID;
    }

    public int getDinnerID() {
        return dinnerID;
    }

    public void setDinnerID(int dinnerID) {
        this.dinnerID = dinnerID;
    }
}
