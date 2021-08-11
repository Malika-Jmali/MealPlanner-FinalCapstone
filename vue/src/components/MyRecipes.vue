<template>
  <div class = "my-recipe-card">
    
      <p v-bind="getMyRecipes()"></p>
      <h1>Your Recipe Library</h1>
      <div v-for="recipe in myRecipes" v-bind:key="recipe.id">
      <p><router-link class="recipe-name-link" v-bind:to="{ name: 'myRecipe', params: { id: recipe.recipeId } }"> {{recipe.recipeName}}</router-link></p>
      <img v-bind:src="recipe.image">
  </div>
  </div>
</template>

<script>
import MealService from "../services/MealService";



export default {
  
  name: "my-recipes",
  data () {
    return {
  myRecipes: "",
 
  getMyRecipes() {
    MealService.getMyRecipes().then((response)=>{
        this.myRecipes= response.data
    })
}
    }
  },
};
</script>

<style>

.my-recipe-card {
  margin-top: 200px;
}


</style>