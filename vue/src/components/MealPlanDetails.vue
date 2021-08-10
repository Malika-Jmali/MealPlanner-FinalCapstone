<template>
    <div class = "meal-plan-body">
        
        <p v-bind="getUserMealsById()"></p>
        <div class = "plan-recipe-box">
            <div class = "image-box">
        <img v-bind:src= result.breakfastRecipe.image />
        </div>
        <h1 class = "recipe-title">Breakfast:</h1>
        <p class = "recipe-details">Recipe Name:  {{result.breakfastRecipe.recipeName}}</p>
        <p class = "recipe-details">Ready In:  {{result.breakfastRecipe.readyInMinutes}} minutes </p>
        <p class = "recipe-details">Servings: {{result.breakfastRecipe.serving}} </p>
        <p class = "recipe-details"> Ingredients: </p>
         <div class = "plan-recipe-box" v-for="ingredient in result.breakfastRecipe.ingredients" v-bind:key="ingredient.id">
             <p>{{ingredient}}</p>
             </div>
        <p class = "recipe-details">Instructions: {{result.breakfastRecipe.instructions}}</p>
        </div>
        
                <div  class = "plan-recipe-box">
            <div class = "image-box">
        <img v-bind:src= result.lunchRecipe.image />
        </div>
        <h1 class = "meal-title">Lunch:</h1>
        <p class = "recipe-details">Recipe Name:  {{result.lunchRecipe.recipeName}} </p>
        <p class = "recipe-details">Ready In:  {{result.lunchRecipe.readyInMinutes}} minutes </p>
        <p class = "recipe-details">Servings: {{result.lunchRecipe.serving}} </p>
        <p class = "recipe-details"> Ingredients: </p>
         <div class = "plan-recipe-box" v-for="ingredient in result.lunchRecipe.ingredients" v-bind:key="ingredient.id">
             <p>{{ingredient}}</p>
             </div>
        <p class = "recipe-details">Instructions: {{result.lunchRecipe.instructions}}</p>
        </div>

          <div class = "plan-recipe-box">
            <div class = "image-box">
        <img v-bind:src= result.dinnerRecipe.image />
        </div>
        <h1 class = "meal-title">Dinner:</h1>
        <p class = "recipe-details">Recipe Name:  {{result.dinnerRecipe.recipeName}} </p>
        <p class = "recipe-details">Ready In:  {{result.dinnerRecipe.readyInMinutes}} minutes </p>
        <p class = "recipe-details">Servings: {{result.dinnerRecipe.serving}} </p>
        <p class = "recipe-details"> Ingredients: </p>
         <div class = "plan-recipe-box" v-for="ingredient in result.dinnerRecipe.ingredients" v-bind:key="ingredient.id">
             <p>{{ingredient}}</p>
             </div>
        <p class = "recipe-details">Instructions: {{result.dinnerRecipe.instructions}}</p>
        </div>

      </div>
    
        
       
      
     
</template>



<script>

import MealService from '../services/MealService';


export default {
    name: "meal-plan-details",
    
    data() {
        return {
            
            result: "",
        
         }
    },
    methods: {
        getUserMealsById() {
                MealService.getMealsById(this.$route.params.id).then((response) =>{
                    this.result = response.data
                    
                });
          
            }
    }
    
}
</script>

<style>

.meal-plan-body {
    margin-top: 100px;
    margin-left: 20px;
}


</style>