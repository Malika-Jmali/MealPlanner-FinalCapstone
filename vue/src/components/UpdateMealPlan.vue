<template>
 <div class = "update-body">
    <p v-bind="getMyRecipes()"></p>
    <p v-bind="getUserMealsById()"></p>
    <form v-on:submit.prevent="submitChanges()">
      <div class="form-element">
        <label for="category">Update Your Meal Plan Name:</label>
        <input id="category" required type="text" :placeholder="currentMealPlan.mealName" v-model="updatedMeal.mealName" />
      </div>
      <div class="form-element">
        <p>Your current Breakfast recipe: {{currentMealPlan.breakfastRecipe.recipeName}}</p>
        <label for="breakfast">Breakfast:</label>
        <select :id="currentMealPlan.breakfastID"  v-model="updatedMeal.breakfastID" >
          <option
            v-for="recipe in myRecipes"
            v-bind:key="recipe.id"
            :value="recipe.recipeId"
          >
            {{ recipe.recipeName }}
          </option>
        </select>
      </div>
      <div class="form-element">
        <p>Your current Lunch recipe: {{currentMealPlan.lunchRecipe.recipeName}}</p>
        <label for="lunch">Lunch:</label>
        <select id="lunch" v-model="updatedMeal.lunchID" required>
          <option
            v-for="recipe in myRecipes"
            v-bind:key="recipe.id"
            :value="recipe.recipeId"
          >
            {{ recipe.recipeName }}
          </option>
        </select>
      </div>
      <div class="form-element">
        <p>Your current Dinner recipe: {{currentMealPlan.dinnerRecipe.recipeName}}</p>
        <label for="dinner">Dinner:</label>
        <select id="dinner" v-model="updatedMeal.dinnerID" required>
          <option
            v-for="recipe in myRecipes"
            v-bind:key="recipe.id"
            :value="recipe.recipeId"
          >
            {{ recipe.recipeName }}
          </option>
        </select>
      </div>

      <input type="submit" value="Save" />
      <input type="button" value="Cancel" v-on:click="resetForm()" />
    </form>
  </div>
</template>

<script>
import MealService from '../services/MealService';
export default { 
    name: "update-meal-plan",
    data() {
      return {
        updatedMeal:{
          mealId: ''
        },
        currentMealPlan: "",
        myRecipes: "",

         getMyRecipes() {
        MealService.getMyRecipes().then((response) => {
          this.myRecipes = response.data;
        });
         },
       
      
      
       getUserMealsById() {
                MealService.getMealsById(this.$route.params.id).then((response) =>{
                    this.currentMealPlan = response.data
                    
                });
          
            },
      resetForm() {
        this.newMeal = {};
      },
      submitChanges(){
      this.updatedMeal.mealId = this.currentMealPlan.mealId;
      MealService.updateMealPlan(this.updatedMeal);
      this.$router.push("/meals");
    }
      
    
    }
  }

}
</script>

<style>

.update-body {
 
    margin-top: 100px;
    margin-left: 20px;

}

</style>