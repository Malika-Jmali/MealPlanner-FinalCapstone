<template>
<div class = "recipe-library-container">
  <div class="recipe-library-header">
  <h1>Your Recipe Library</h1>
  </div>
  <div class="recipe-row">
      <div v-bind="getMyRecipes()"></div>
            <div class="recipe-card" v-for="recipe in myRecipes" v-bind:key="recipe.id">
      <img v-bind:src="recipe.image" class = "my-recipe-image" alt = "recipe-image">
      <div class="recipe-header">
      <router-link  class="recipe-button" v-bind:to="{ name: 'myRecipe', params: { id: recipe.recipeId } }" button-type = "submit"> {{recipe.recipeName}}</router-link>
        </div>
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

.recipe-family-container {
  width: 90%;
  margin: 50px auto;
}

.recipe-library-header {
  text-align: center;
  font-size: 20px;
  color: gray;
  margin-bottom: 40px;
}

.recipe-row {
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  gap: 3px;
  flex-flow: wrap;
  
}

.recipe-card {
  width: 20%;
  margin-bottom: 50px;
}

.recipe-header {
  text-align: center;
  padding: 50px 10px;
  
}

.recipe-button {
  display: block;
  text-align: center;
  outline: 0;
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
  border: 0;
  padding: 10px;
  color: #fff;
  font-size: 13px;
  margin-bottom: 10px;
  text-decoration: none;
}

.recipe-button:hover {
  background-color: gray;
}

.my-recipe-image {
  width:100%;
  height:250px;
  object-fit:cover;
  object-position:50% 50%;
  border-radius: 10px;
  box-shadow: 0 0 20px 0 rgba(0,0,0,0.2), 0 5px 5px 0 rgba(0,0,0,0.24);
}


</style>