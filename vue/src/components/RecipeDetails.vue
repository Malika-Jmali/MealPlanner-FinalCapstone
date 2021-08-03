<template>
  <div>
     <input type="text" name="recipe" v-model="typeKeyword" />
      <button id="submitSearch" v-on:click="displayRecipe">Click</button>
    <p>{{ result }}</p>
  </div>
</template>

<script>
import SpoonacularService from "../services/SpoonacularService";

export default {
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
          this.resultArr = this.results.results;
        }
      );
    },
  },
};
</script>

<style>
</style>