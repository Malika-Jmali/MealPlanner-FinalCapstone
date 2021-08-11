<template>
  <div class="meal-body">
    <h1 class="your-meal-plans">Your Current Meal Plans</h1>
    <div class="add-meal-plan">
    <router-link
      intput
      type="submit"
      id="add-meal-plan-btn"
      v-bind:to="{ name: 'addMealPlan' }"
      >Click here to add a new meal plan</router-link
    >
    </div>

    <div v-bind="getMyMeals()">
      <meal-plan-card
        v-bind:meal="meal"
        v-for="meal in meals"
        v-bind:key="meal.id"
      />
    </div>
  </div>
</template>

<script>
import MealService from "../services/MealService";
import MealPlanCard from "../components/MealPlanCard";

export default {
  name: "user-meals",
  components: { MealPlanCard },
  data() {
    return {
      meals: "",
    };
  },
  methods: {
    getMyMeals() {
      MealService.getAllMeals().then((response) => {
        this.meals = response.data;
      });
    },
  },
};
</script>

<style>
.your-meal-plans {
  margin-top: 70px;
  display: flex;
  justify-content: center;
  
}

.add-meal-plan {
    align-items: flex-start;
    display: flex; 
    padding: 20px;
}

#add-meal-plan-btn {
 /* display: flex;
 justify-content: center; */
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
  margin: auto;
  width: auto;
  border: 0;
  padding: 15px;
  color: #fff;
  font-size: 14px;
  margin-bottom: 10px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  text-decoration: none;
}

#add-meal-plan-btn:hover {
  transition: all 1s ease 0s;
  cursor: pointer;
  background-color: gray;
}
</style>