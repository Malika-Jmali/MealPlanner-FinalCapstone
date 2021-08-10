<template>
 <div class = "update-body">
    <p v-bind="getMyRecipes()"></p>
    <p v-bind="getUserMealsById()"></p>
    <form v-on:submit.prevent="submitMeal">
      <div class="form-element">
        <label for="category">Update Your Meal Plan Name:</label>
        <input id="category" type="text" v-model="updatedMeal.mealName" />
      </div>
      <div class="form-element">
        <label for="breakfast">Breakfast:</label>
        <select id="breakfast" v-model="updatedMeal.breakfastID">
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
        <label for="lunch">Lunch:</label>
        <select id="lunch" v-model="updatedMeal.lunchID">
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
        <label for="dinner">Dinner:</label>
        <select id="dinner" v-model="updatedMeal.dinnerID">
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