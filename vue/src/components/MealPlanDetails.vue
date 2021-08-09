<template>
    <div class = "meal-plan-body">
        <div>
            <div>
        <p v-bind="getUserMealsById()"></p>
        <img v-bind:src= result.breakfastRecipe.image />
        </div>
        <div>
        <p>Recipe Name:  {{result.breakfastRecipe.recipeName}} </p>
        <p>Ready In:  {{result.breakfastRecipe.readyInMinutes}} minutes </p>
        <p>Servings: {{result.breakfastRecipe.recipeName}} </p>
        <p> Ingredients: </p>
         <div v-for="ingredient in result.breakfastRecipe.ingredients" v-bind:key="ingredient.id">
             <p>{{ingredient}}</p>
             </div>
        <p>Instructions: {{result.breakfastRecipe.instructions}}</p>
        </div>
                <div>
            <div>
        <img v-bind:src= result.lunchRecipe.image />
        </div>
        <div>
        <p>Recipe Name:  {{result.lunchRecipe.recipeName}} </p>
        <p>Ready In:  {{result.lunchRecipe.readyInMinutes}} minutes </p>
        <p>Servings: {{result.lunchRecipe.recipeName}} </p>
        <p> Ingredients: </p>
         <div v-for="ingredient in result.lunchRecipe.ingredients" v-bind:key="ingredient.id">
             <p>{{ingredient}}</p>
             </div>
        <p>Instructions: {{result.lunchRecipe.instructions}}</p>
        </div>
        
        </div>
      </div>
       <div>
            <div>
        <img v-bind:src= result.dinnerRecipe.image />
        </div>
        <div>
        <p>Recipe Name:  {{result.dinnerRecipe.recipeName}} </p>
        <p>Ready In:  {{result.dinnerRecipe.readyInMinutes}} minutes </p>
        <p>Servings: {{result.dinnerRecipe.recipeName}} </p>
        <p> Ingredients: </p>
         <div v-for="ingredient in result.dinnerRecipe.ingredients" v-bind:key="ingredient.id">
             <p>{{ingredient}}</p>
             </div>
        <p>Instructions: {{result.dinnerRecipe.instructions}}</p>
        </div>
        
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
 margin: 5rem;
 display: grid;
 place-items: center;
}


</style>