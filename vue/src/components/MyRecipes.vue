<template>
  <div class = "my-recipe-card">
    
    <div class="card-body">
      <p v-bind="getMyRecipes()"></p>
      
      <h1>Your Recipe Library</h1>
      <div class = "card-body" v-for="recipe in myRecipes" v-bind:key="recipe.id">
      <img v-bind:src="recipe.image" class = "my-recipe-image" alt = "recipe-image">
      <br>
      <router-link  class="recipe-name-link" v-bind:to="{ name: 'myRecipe', params: { id: recipe.recipeId } }" button-type = "submit"> {{recipe.recipeName}}</router-link>
  </div>
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

  justify-content: center;
 
  
}

.my-recipe-image {
  width: 350px;
   height:300px;
   object-fit:cover;
   object-position:50% 50%;
   border-radius: 10px;
  box-shadow: 0 0 20px 0 rgba(0,0,0,0.2), 0 5px 5px 0 rgba(0,0,0,0.24);
}

</style>