<template>
  <div class="meal-plan-body-card">
    <p v-bind="getUserMealsById()"></p>
    <div class="meal-plan-recipe-card">
      <img
        class="meal-recipe-image"
        alt="recipe-image"
        v-bind:src="result.breakfastRecipe.image"
      />

      <h1 class="recipe-title">Breakfast:</h1>
      <p>
        <span class="recipe-details">Recipe Name:</span
        >{{ result.breakfastRecipe.recipeName }}
      </p>
      <p>
        <span class="recipe-details">Ready In:</span>
        {{ result.breakfastRecipe.readyInMinutes }} minutes
      </p>
      <p>
        <span class="recipe-details">Servings:</span>
        {{ result.breakfastRecipe.serving }}
      </p>
      <p><span class="recipe-details"> Ingredients:</span></p>
      <div
        class="plan-recipe-box"
        v-for="ingredient in result.breakfastRecipe.ingredients"
        v-bind:key="ingredient.id"
      >
        <p>{{ ingredient }}</p>
      </div>
      <p>
        <span class="recipe-details">Instructions:</span>
        {{ result.breakfastRecipe.instructions }}
      </p>
    </div>

    <div class="meal-plan-recipe-card">
      <img class="meal-recipe-image" v-bind:src="result.lunchRecipe.image" />

      <h1 class="recipe-title">Lunch:</h1>
      <p>
        <span class="recipe-details">Recipe Name:</span>
        {{ result.lunchRecipe.recipeName }}
      </p>
      <p>
        <span class="recipe-details">Ready In: </span>
        {{ result.lunchRecipe.readyInMinutes }} minutes
      </p>
      <p>
        <span class="recipe-details">Servings: </span>
        {{ result.lunchRecipe.serving }}
      </p>
      <p class="recipe-details">Ingredients:</p>
      <div
        class="plan-recipe-box"
        v-for="ingredient in result.lunchRecipe.ingredients"
        v-bind:key="ingredient.id"
      >
        <p>{{ ingredient }}</p>
      </div>
      <p>
        <span class="recipe-details">Instructions: </span>
        {{ result.lunchRecipe.instructions }}
      </p>
    </div>

    <div class="meal-plan-recipe-card">
      <img class="meal-recipe-image" v-bind:src="result.dinnerRecipe.image" />

      <h1 class="recipe-title">Dinner:</h1>
      <p>
        <span class="recipe-details">Recipe Name: </span>
        {{ result.dinnerRecipe.recipeName }}
      </p>
      <p>
        <span class="recipe-details">Ready In: </span>
        {{ result.dinnerRecipe.readyInMinutes }} minutes
      </p>
      <p>
        <span class="recipe-details">Servings: </span>
        {{ result.dinnerRecipe.serving }}
      </p>
      <p><span class="recipe-details"> Ingredients: </span></p>
      <div
        class="plan-recipe-box"
        v-for="ingredient in result.dinnerRecipe.ingredients"
        v-bind:key="ingredient.id"
      >
        <p>{{ ingredient }}</p>
      </div>
      <p>
        <span class="recipe-details">Instructions: </span>
        {{ result.dinnerRecipe.instructions }}
      </p>
    </div>
    <div class="button-wrapper">
      <input
        type="submit"
        value="print this meal plan"
        class="print-my-meal-plan"
      />
      <router-link class="back-to-library" v-bind:to="{ name: 'userMeals' }"
        >Back to Meal Plans</router-link
      >
    </div>
  </div>
</template>



<script>
import MealService from "../services/MealService";

export default {
  name: "meal-plan-details",

  data() {
    return {
      result: "",
    };
  },
  methods: {
    getUserMealsById() {
      MealService.getMealsById(this.$route.params.id).then((response) => {
        this.result = response.data;
      });
    },
  },
};
</script>

<style>
.meal-plan-body-card {
  margin: 5rem;
  display: grid;
  place-items: center;
  grid-gap: 20px;
}

.meal-plan-recipe-card {
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  width: 60%;
  display: flex;
  flex-direction: column;
  text-align: left;
  padding: 2em;
  border-radius: 10px;
}

.recipe-title {
  font-weight: bold;
  color: gray;
}

.recipe-details {
  font-weight: bold;
}

.meal-recipe-image {
  border-radius: 10px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  text-align: center;
  object-fit: cover;
  object-position: 50% 50%;
  width: 100%;
  height: 600px;
}

/* Buttons */

.button-wrapper {
  width: 100%;
  text-align: center;
  position: relative;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.back-to-library,
.print-my-meal-plan {
  text-transform: uppercase;
  font-family: "Poppins";
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
  width: auto;
  border: 0;
  padding: 14px;
  margin: 20px 25px;
  color: #fff;
  font-size: 14px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  text-decoration: none;
  cursor: pointer;
}

.back-to-library:hover,
.print-my-meal-plan:hover {
  transition: all 1s ease 0s;
  cursor: pointer;
  background-color: gray;
}
</style>