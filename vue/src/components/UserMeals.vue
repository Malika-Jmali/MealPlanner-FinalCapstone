<template>

  <div>
      <p v-bind="getMyMeals()">meals</p>
      <p>{{meals}}</p>
  </div>
</template>

<script>

import MealService from '../services/MealService';

export default {
name: "user-meals",
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
        }
    },
}


</script>