<template>

      <div class = "meal-plan-card">
        <router-link v-bind:meal="meal" v-bind:to="{ name: 'mealPlanDetails', params: {id: meal.mealId} }">{{meal.mealName}}</router-link>
        
      <p> {{meal.breakfastRecipe.recipeName}}</p>
        <p>{{meal.lunchRecipe.recipeName}}</p>
        <p>{{meal.dinnerRecipe.recipeName}}</p>
      
      <input type="submit" value="Delete" v-on:click="deleteThisMeal()" />

     </div>
  

</template>



<script>
import MealService from '../services/MealService';

export default {
  
    name: "meal-plan-card",
    props: ["meal"],
    data (){
      return{
        deleteThisMeal(){
          MealService.deleteMealPlan(this.meal.mealId);
          this.$router.push("meals");

        }
      }

    }
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