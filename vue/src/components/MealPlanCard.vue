<template>
  <div class = "meal-body">
      <div class = "meal-main">
        
        <router-link v-bind:meal="meal" v-bind:to="{ name: 'mealPlanDetails', params: {id: meal.mealId} }">{{meal.mealName}}</router-link>
      <p> {{meal.breakfastRecipe.recipeName}}</p>
        
        <p>{{meal.lunchRecipe.recipeName}}</p>
        <p>{{meal.dinnerRecipe.recipeName}}</p>
        <router-link v-bind:to="{ name: 'addMealPlan'}">Click here to add a new mealplan</router-link>
        </div>
  </div>
</template>



<script>


export default {
  
    name: "meal-plan-card",
    props: ["meal"]  
}
</script>

<style>
.meal-body {
   margin-top: 100px;

}

.meal-main a {
  color: gray;
  text-decoration: none;
}

.meal-main a:hover {
  color: black;
}



</style>