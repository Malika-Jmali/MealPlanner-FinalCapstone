<template>
  <div>
      <p v-bind="getMyRecipes()"></p>
      <p>
         {{myRecipes}}
      </p>
  </div>
</template>

<script>
import MealService from "../services/MealService";

export default {
  name: "my-recipes",
  myRecipes: "",
  getMyRecipes() {
    MealService.getMyRecipes().then((response)=>{
        this.myRecipes= response.data
    })

  },
};
</script>

<style>
</style>