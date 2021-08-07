<template>

    <div v-bind="displayRecipe()">
    <recipe-detail-card v-bind:recipes="recipes" v-for="recipe in recipes" v-bind:key="recipe.id" />
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
      recipes: [
        {
        title: "",
        readyInMinutes: "",
        servings: "",
        image: "",
        instructions: "",
        ingredients: []
      }
      ], 
    };
  },
  methods: {
    displayRecipe() {
      SpoonacularService.retrieveRecipeDetails(this.$route.params.id).then(
        (response) => {
          this.result = response.data

          this.recipes[0].title = this.result.title;
          this.recipes[0].readyInMinutes = this.result.readyInMinutes
          this.recipes[0].servings = this.result.servings;
          this.recipes[0].image = this.result.image;

          this.recipes[0].instructions = this.result.instructions

          this.recipes[0].ingredients = response.data.extendedIngredients;
        
        }  
      );
    },
    
  },
};
</script>

<style>

.body {
 margin: 5rem;
 display: grid;
 place-items: center;
}

.recipe-card {
  box-shadow: 0 0 20px rgba(0,0,0,0.2);
  width: 60%;
  display: flex;
  flex-direction: column;
  text-align: left;
  padding: 2em;
}

.title {
  font-weight: bold;
}

</style>