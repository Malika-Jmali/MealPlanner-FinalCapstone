<template>
 <div class = "update-plan-body">
   <div class="update-plan-box">
    <p v-bind="getMyRecipes()"></p>
    <p v-bind="getUserMealsById()"></p>
    <form v-on:submit.prevent="submitChanges()">
      <h1 id="update-meal-title">Update Meal Plan</h1>

      <div class="form-element">
        <div class="form-element-select">
        <label for="category"><p class="update-meal-info">Update Your Meal Plan Name:</p></label>
        <input required type="text" class="name-of-meal" :placeholder="currentMealPlan.mealName" v-model="updatedMeal.mealName" />
      </div>

      <div class="form-element-select">
        <p class="update-meal-info">Your current Breakfast recipe: {{currentMealPlan.breakfastRecipe.recipeName}}</p>
        
        <label for="breakfast"><p class="update-meal-info">Breakfast:</p></label>
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

      <div class="form-element-select">
        <p class= "update-meal-info">Your current Lunch recipe: {{currentMealPlan.lunchRecipe.recipeName}}</p>
        
        <label for="lunch"><p class="update-meal-info">Lunch:</p></label>
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

      <div class="form-element-select">
        <p class="update-meal-info">Your current Dinner recipe: {{currentMealPlan.dinnerRecipe.recipeName}}</p>
        <label for="dinner"><p class="update-meal-info">Dinner:</p></label>
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
      </div>

         <div class="button-wrapper-submit">
       <input type="submit" value="Save" class="submit-updated-plan" />
       <input type="button" value="Clear Fields" v-on:click="resetForm()" class="clear-updated-fields" />
      <router-link v-bind:to="{ name: 'userMeals' }" class="back-out-button" button-type="submit">Back To Meal Plans</router-link>
        </div>
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

/* Body Style */

.update-plan-body {
  margin-top: 40px;
  margin-left: 20px;
  box-sizing: border-box;
  line-height: 1.5;
  display: grid;
  place-items: center;
  color: gray;
  font-size: 20px;

}

/* Inside Style */

.update-plan-box {
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  width: 100%;
  max-width: 600px;
  border-radius: 10px;
  background: rgb(243, 241, 241);
  text-align: center;
  padding: 1.5em;
 
}


#update-meal-title {
  text-align: center;
  font-size: 30px;
  margin-top: 5px;
}

.form-element {
  padding: 1rem;
  display: flex;
  flex-direction: column;
  place-items: center;
  justify-content: center;
}

.update-meal-info{
  text-align: left;
  font-weight: 500;
  font-size: 18px;
}

.name-of-meal{
  border: 1px solid plum;
  border-radius: 5px;
  background: #fff;
  width: 100%;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}

.name-of-meal:focus{
  outline: none;
}

.form-element-select, select, input {
  border-radius: 5px;
  padding: 10px 15px;
  width: 100%;
  font-size: 15px;
  font-family: "Poppins";
  
}

select, input {
  border: 1px solid plum;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}

select:focus, input:focus{
  outline: none;
}


/* buttons */

.button-wrapper-submit {
    display:inline-block;
    margin: 0;
    padding-top: 20px;
    
}

.submit-updated-plan {
  
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
  border: 0;
  padding: 15px;
  color: #fff;
  font-size: 14px;
  width: 150px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  text-decoration: none;
  margin-right: 30px;
}

.clear-updated-fields {
  
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
  width: 170px;
  border: 0;
  padding: 15px;
  color: #fff;
  font-size: 14px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  text-decoration: none;
  margin-right: 30px;
}

.back-out-button {
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
  width: 150px;
  border: 0;
  padding: 16px;
  color: #fff;
  font-size: 14px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  text-decoration: none;
  margin-right: 5px;
}

.submit-updated-plan:hover,
.clear-updated-fields:hover,
.back-out-button:hover {
  transition: all 1s ease 0s;
  cursor: pointer;
  background-color: gray;
}


</style>