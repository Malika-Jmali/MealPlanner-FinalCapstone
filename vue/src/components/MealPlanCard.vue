<template>
  <div class="meal-plan-card-body">
    <div class="meal-plan-card">
      <div class="side-bar">
        <img class="plan-image" src="../assets/fork.png" alt="calendar" />

        <div class="card-text">
          <router-link
            class="meal-plan-name"
            v-bind:meal="meal"
            v-bind:to="{ name: 'mealPlanDetails', params: { id: meal.mealId } }"
            >{{ meal.mealName }}</router-link
          >
          <p class="recipe-name"> <span >Breakfast:</span> {{ meal.breakfastRecipe.recipeName }}</p>
          <p class="recipe-name"> <span>Lunch: </span>{{ meal.lunchRecipe.recipeName }}</p>
          <p  class="recipe-name"> <span>Dinner: </span> {{ meal.dinnerRecipe.recipeName }}</p>
          <input
            type="submit"
            value="delete this meal plan"
            v-bind:class="'delete-button'"
            v-on:click="
              deleteThisMeal();
              say('Plan Deleted!');
            "
          />

          <router-link
            v-bind:to="{ name: 'updateMealPlan', params: { id: meal.mealId } }"
            id="update-button"
            button-type="submit"
            >Update This Meal Plan</router-link
          >
          <input
            type="submit"
            value="print this meal plan"
            class="print-meal"
          />
        </div>
        
      </div>
    </div>
    
  </div>
</template>



<script>
import MealService from "../services/MealService";

export default {
  name: "meal-plan-card",
  props: ["meal"],
  data() {
    return {
      deleteThisMeal() {
        MealService.deleteMealPlan(this.meal.mealId);
        this.$router.push("meals");
      },
      say: function (message) {
        alert(message);
      },
    };
  },
};
</script>

<style>
.meal-plan-card-body {
  margin-top: 50px;
  margin-left: 20px;
  box-sizing: border-box;
  line-height: 1.6;
  display: grid;
  place-items: center;
}

.meal-plan-card {
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  width: 80%;
  max-width: 600px;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
  background: rgb(243, 241, 241);
  text-align: center;
  padding: 2em;
}

.recipe-name {
  padding: 10px;
  text-align: left;
  font-size: 18px;
}

span {
  font-weight: bold;
}

.social-links {
  list-style: none;
  display: flex;
  margin: 0;
  padding: 0;
  justify-content: space-around;
  width: 150px;
  margin: 0 auto;
}

#social-link {
  color: purple;
}

#social-link:hover,
#social-link:focus {
  color: gray;
  opacity: 1;
}

.plan-image {
  height: 50px;
  width: 50px;
  margin-bottom: 20px;
}

.meal-plan-name {
  font-size: 2rem;
  line-height: 1;
  letter-spacing: 1px;
  font-weight: bold;
}

.meal-plan-name:hover {
  color: black;
}

.your-meal-plans {
  text-align: center;
  color: gray;
}

.new-meal-link {
  color: gray;
  text-decoration: none;
}

.meal-body a {
  color: gray;
  text-decoration: none;
}

#update-button {
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
  width: auto;
  border: 0;
  padding: 15px;
  color: #fff;
  font-size: 14px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  text-decoration: none;
  margin-left: 10px;
}

.delete-button {
  text-transform: uppercase;
  font-family: "Poppins";
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
  width: auto;
  border: 0;
  padding: 14px;
  color: #fff;
  font-size: 14px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  text-decoration: none;
  cursor: pointer;
}

.print-meal {
  text-transform: uppercase;
  font-family: "Poppins";
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
  width: auto;
  border: 0;
  padding: 14px;
  margin-left: 10px;
  color: #fff;
  font-size: 14px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  text-decoration: none;
  cursor: pointer;
}

#update-button:hover,
.delete-button:hover,
.print-meal:hover {
  transition: all 1s ease 0s;
  cursor: pointer;
  background-color: gray;
}
</style>