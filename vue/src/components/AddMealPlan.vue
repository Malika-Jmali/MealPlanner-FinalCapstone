<template>
  <div>
    <p v-bind="getMyRecipes()"></p>
    <form v-on:submit.prevent="submitMeal">
      <div class="form-element">
        <label for="category">Name Your New Meal Plan:</label>
        <input id="category" type="text" v-model="newMeal.mealName" />
      </div>
      <div class="form-element">
        <label for="breakfast">Breakfast:</label>
        <select id="breakfast" v-model="newMeal.breakfastID">
          <option
            v-for="recipe in myRecipes"
            v-bind:key="recipe.id"
            :value="recipe.recipeId"
          >
            {{ recipe.recipeName }}
          </option>
        </select>
      </div>
      <div class="form-element">
        <label for="lunch">Lunch:</label>
        <select id="lunch" v-model="newMeal.lunchID">
          <option
            v-for="recipe in myRecipes"
            v-bind:key="recipe.id"
            :value="recipe.recipeId"
          >
            {{ recipe.recipeName }}
          </option>
        </select>
      </div>
      <div class="form-element">
        <label for="dinner">Dinner:</label>
        <select id="dinner" v-model="newMeal.dinnerID">
          <option
            v-for="recipe in myRecipes"
            v-bind:key="recipe.id"
            :value="recipe.recipeId"
          >
            {{ recipe.recipeName }}
          </option>
        </select>
      </div>

      <input type="submit" value="Save" />
      <input type="button" value="Cancel" v-on:click="resetForm()" />
    </form>
  </div>
</template>




<script>
import MealService from "../services/MealService";
export default {
  name: "add-meal-plan",

  data() {
    return {
      newMeal: {},
      myRecipes: "",

      submitMeal() {
        MealService.addMeal(this.newMeal);

        this.$router.push("meals");
      },
      getMyRecipes() {
        MealService.getMyRecipes().then((response) => {
          this.myRecipes = response.data;
        });
      },
      resetForm() {
        this.newMeal = {};
      },
    };
  },
};
</script>

<style>
.form-element {
  margin-top: 100px;
}
</style>