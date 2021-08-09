<template>

      <div class = "get-meals" v-bind="getMyMeals()">
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
            MealService.getAllMeals().then((response) => {
                this.meals = response.data;
            })
        },

        
    }
}


</script>

<style>




</style>