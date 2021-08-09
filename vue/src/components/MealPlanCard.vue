<template>
  <div class = "meal-body">
      <div class = "meal-main">
        
        <router-link v-bind:meal="meal" v-bind:to="{ name: 'mealPlanDetails', params: {id: meal.mealId} }">{{meal.mealName}}</router-link>
      <p> {{meal.breakfastRecipe.recipeName}}</p>
        
        <p>{{meal.lunchRecipe.recipeName}}</p>
        <p>{{meal.dinnerRecipe.recipeName}}</p>
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



</style>