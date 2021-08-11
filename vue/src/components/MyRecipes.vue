<template>
  <div class = "my-recipe-card">
    
      <p v-bind="getMyRecipes()"></p>
      <div v-for="recipe in myRecipes" v-bind:key="recipe.id">
      <p>
         {{recipe.recipeName}}
      </p>
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