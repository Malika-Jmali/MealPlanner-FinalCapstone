<template>
  <div>
    <recipe-detail-card />
    <p v-bind="displayRecipe()">recipe</p>
    <p>{{ resultArr }}</p>
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
      resultArr: [],
    };
  },
  methods: {
    displayRecipe() {
      SpoonacularService.retrieveRecipeDetails(this.$route.params.id).then(
        (response) => {
          this.result = response.data;

          this.resultArr.push(this.result.title);
          this.resultArr.push(this.result.readyInMinutes);
          this.resultArr.push(this.result.servings);
          this.resultArr.push(this.result.image);
          this.resultArr.push(this.result.instructions);
          this.result="";
        }  
      );
    },
    
  },
};
</script>

<style>
</style>