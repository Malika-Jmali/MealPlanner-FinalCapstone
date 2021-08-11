<template>
 <div class = "update-body">
   <div class="update-plan-body">
    <p v-bind="getMyRecipes()"></p>
    <p v-bind="getUserMealsById()"></p>
    <form v-on:submit.prevent="submitChanges()">
      <div class="form-element">
        <label for="category">Update Your Meal Plan Name:</label>
        <input required type="text" :placeholder="currentMealPlan.mealName" v-model="updatedMeal.mealName" />
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
        <select v-model="updatedMeal.lunchID" required>
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
        <select v-model="updatedMeal.dinnerID" required>
          <option
            v-for="recipe in myRecipes"
            v-bind:key="recipe.id"
            :value="recipe.recipeId"
          >
            {{ recipe.recipeName }}
          </option>
        </select>
      </div>

       <input type="submit" value="Save" class="submit-updated-plan" />
       <input type="button" value="Clear Fields" v-on:click="resetForm()" class="clear-fields" />
      <router-link v-bind:to="{ name: 'userMeals' }" class="back-button" button-type="submit">Back To Meal Plans</router-link>
    </form>
  </div>
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
        this.updatedMeal = {};
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
  margin-top: 50px;
  margin-left: 20px;
  box-sizing: border-box;
  line-height: 1.6;
  display: grid;
  place-items: center;

}

.update-plan-body {
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  width: 80%;
  max-width: 600px;
  border-radius: 10px;
  background: rgb(243, 241, 241);
  text-align: center;
  padding: 2em;
 
}

.submit-updated-plan {
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: gray;
  width: auto;
  border: 0;
  padding: 15px;
  margin: 10px 25px;
  color: #fff;
  font-size: 14px;
  margin-bottom: 10px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  text-decoration: none;
}

.submit-updated-plan:hover {
  transition: all 1s ease 0s;
  cursor: pointer;
  background-color: purple;
}

</style>