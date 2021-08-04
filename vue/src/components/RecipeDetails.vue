<template>
  <div>
    <recipe-detail-card v-bind:recipe="recipe" v-for="recipe in recipes" v-bind:key="recipe.id" />
    <!-- <p v-bind="displayRecipe()">recipe</p> -->
    <p>{{ recipe }}</p>
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
      recipes: [{
        title: "Chicken 65",
        readyInMinutes: "35 minutes",
        servings: "6",
        image: "chick pix",
        instructions: "Heat until done"
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
        }  
      );
    },
    
  },
};
</script>

<style>
</style>