<template>
  <div>
    <p v-bind="displayRecipe()">recipe</p>
    <recipe-detail-card v-bind:recipe="recipe" v-for="recipe in recipes" v-bind:key="recipe.id" />
  </div>
</template>

<script>
import SpoonacularService from "../services/SpoonacularService";
import RecipeDetailCard from  "../components/RecipeDetailCard";

export default {
  components: {RecipeDetailCard },
  name: "recipe-details",
  data() {
    return {
      result: "",
      ingredientList: [],
      recipes: [{
        title: "",
        readyInMinutes: "",
        servings: "",
        image: "",
        instructions: "",
        ingredients: []
      }], 
    };
  },
  methods: {
    displayRecipe() {
      SpoonacularService.retrieveRecipeDetails(this.$route.params.id).then(
        (response) => {
          this.result = response.data;

          this.recipe[0].title = this.result.title;
          this.recipe[0].readyInMinutes = this.result.readyInMinutes;
          this.recipe[0].servings = this.result.servings;
          this.recipe[0].image = this.result.image;
          this.recipe[0].instructions = this.result.instructions;

          this.ingredientList = this.result.extendedIngredients;
          for(let ingredient in this.ingredientList){
            this.recipes[0].ingredients.push(ingredient.original);
          }
        }  
      );
    },
    
  },
};
</script>

<style>
</style>