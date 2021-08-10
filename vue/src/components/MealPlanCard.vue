<template>

      <div class = "meal-plan-card">
        <router-link v-bind:meal="meal" v-bind:to="{ name: 'mealPlanDetails', params: {id: meal.mealId} }">{{meal.mealName}}</router-link>
      <p> {{meal.breakfastRecipe.recipeName}}</p>
        <p>{{meal.lunchRecipe.recipeName}}</p>
        <p>{{meal.dinnerRecipe.recipeName}}</p>
      
     </div>
  

</template>



<script>


export default {
  
    name: "meal-plan-card",
    props: ["meal"]  
}
</script>

<style>
.meal-plan-card {
   margin-top: 100px;

}

.your-meal-plans {
  text-align: center;
  color: gray;
}

.meal-body a {
  color: gray;
  text-decoration: none;
}

.meal-body a:hover {
  color: black;
}



</style>