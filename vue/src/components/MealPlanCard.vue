<template>
    <div>
        <meal-plan-details/>
        <router-link v-bind:meal="meal" v-bind:to="{ name: 'mealPlanDetails', params: {id: meal.mealId} }">{{meal.mealName}}</router-link>
        <p>{{meal.breakfastRecipe.recipeName}}</p>
        <p>{{meal.lunchRecipe.recipeName}}</p>
        <p>{{meal.dinnerRecipe.recipeName}}</p>
        </div>
</template>



<script>


import MealPlanDetails from '../views/MealPlanDetails.vue';

export default {
  components: { MealPlanDetails },
    name: "meal-plan-card",
    props: ["meal"]  
}
</script>