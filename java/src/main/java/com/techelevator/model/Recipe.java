package com.techelevator.model;

import java.util.ArrayList;
import java.util.Arrays;


public class Recipe {
    int recipeId;
    int userId;
    String recipeName;
    String readyInMinutes;
    String serving;
    ArrayList<String> ingredients;
    String image;
    String instructions;

    public int getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(int recipeId) {

        this.recipeId = recipeId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRecipeName() {
        return recipeName;
    }

    public void setRecipeName(String recipeName) {
        this.recipeName = recipeName;
    }

    public String getReadyInMinutes() {
        return readyInMinutes;
    }

    public void setReadyInMinutes(String readyInMinutes) {
        this.readyInMinutes = readyInMinutes;
    }

    public String getServing() {
        return serving;
    }

    public void setServing(String serving) {
        this.serving = serving;
    }

    public ArrayList<String> getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        String[] ingredientSplit = ingredients.split(",");

        ArrayList<String> ingredientList = new ArrayList<String>(
                Arrays.asList(ingredientSplit));

        this.ingredients = ingredientList;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }
}
