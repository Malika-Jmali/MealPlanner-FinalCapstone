<template>

  <div>
      <p v-bind="getMyMeals()"></p>
      <!-- <p>{{meals}}</p> -->
      <!-- <p>{{meal}}</p> -->
      <meal-plan-card v-bind:meal="meal" v-for="meal in meals" v-bind:key="meal.id"/>
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
            MealService.getMeals().then((response) => {
                this.meals = response.data;
            })
        },

        
    }
}


</script>

<style>

</style>