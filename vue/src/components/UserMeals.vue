<template>
    <div class = "meal-body">
        <h1 class = "your-meal-plans">Your Current Mealplans</h1>
        <router-link class = "new-meal-link" v-bind:to="{ name: 'addMealPlan'}">Click here to add a new mealplan</router-link>
      <div class = "get-meals" v-bind="getMyMeals()">
      <meal-plan-card v-bind:meal="meal" v-for="meal in meals" v-bind:key="meal.id"/>
      
      </div>
  </div>

</template>

<script>

import MealService from '../services/MealService';
import MealPlanCard from '../components/MealPlanCard';


export default {
name: "user-meals",
components: {MealPlanCard},
data() {
    return {
    
    meals: "",
        }
    },
    methods: {
        getMyMeals() {
            MealService.getAllMeals().then((response) => {
                this.meals = response.data;
            })
        },

        
    }
}


</script>

<style>

.meal-body {

    margin-top: 100px;
}


</style>