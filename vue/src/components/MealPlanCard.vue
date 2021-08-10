<template>

      <div class = "meal-plan-card">
        <router-link v-bind:meal="meal" v-bind:to="{ name: 'mealPlanDetails', params: {id: meal.mealId} }">{{meal.mealName}}</router-link>
        
      <p> {{meal.breakfastRecipe.recipeName}}</p>
        <p>{{meal.lunchRecipe.recipeName}}</p>
        <p>{{meal.dinnerRecipe.recipeName}}</p>
      
      <input type="submit" value="Delete" class="delete-button" v-on:click="deleteThisMeal()" />
     
      
      <router-link v-bind:to="{ name: 'updateMealPlan', params: {id: meal.mealId} }" class="update-button" button-type="submit">Update This Meal Plan</router-link>
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

.update-button, .delete-button {
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background:lightgray;
  width: auto;
  border: 0;
  padding: 15px 15px 15px 15px; 
  color: #fff;
  font-size: 14px;
  margin-top: 20px;
  box-shadow: 0 0 20px 0 rgba(0,0,0,0.2), 0 5px 5px 0 rgba(0,0,0,0.24);
  text-decoration: none;
}



</style>