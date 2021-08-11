<template>
  <div class="add-plan-body">
    <div class="add-plan-box">
    <p v-bind="getMyRecipes()"></p>
    <form v-on:submit.prevent="submitMeal">
      <h1 id="add-meal-title">Add a Meal Plan</h1>
      <div class="form-element">
        <div class="form-element-select">
        <label for="category" class="label" ><p>Meal Plan Name:</p></label>
        <input type="text" required v-model="newMeal.mealName" />
      </div>
      <!-- </div> -->
      <!-- <div class="form-element"> -->
        <div class="form-element-select">
        <p><label for="breakfast" class="label">Breakfast:</label></p>
        <select  required v-model="newMeal.breakfastID">
          <option
            v-for="recipe in myRecipes"
            v-bind:key="recipe.id"
            :value="recipe.recipeId"
          >
            {{ recipe.recipeName }}
          </option>
        </select>
      </div>
      <!-- </div> -->
      <!-- <div class="form-element"> -->
        <div class="form-element-select">
        <p><label for="lunch" class="label">Lunch:</label></p>
        <select required v-model="newMeal.lunchID">
          <option
            v-for="recipe in myRecipes"
            v-bind:key="recipe.id"
            :value="recipe.recipeId"
          >
            {{ recipe.recipeName }}
          </option>
        </select>
      </div>
      <!-- </div> -->
      <!-- <div class="form-element"> -->
        <div class="form-element-select">
        <p><label for="dinner" class="label">Dinner:</label></p>
        <select required v-model="newMeal.dinnerID">
          <option
            v-for="recipe in myRecipes"
            v-bind:key="recipe.id"
            :value="recipe.recipeId"
          >
            {{ recipe.recipeName }}
          </option>
        </select>
      </div>
      <!-- </div> -->
      </div>

      <input type="submit" value="Save" class="submit-new-plan" />
      <input type="button" value="Clear Fields" v-on:click="resetForm()" class="clear-fields" />
      <!-- add cancel to a router link -->
       <router-link v-bind:to="{ name: 'userMeals' }" class="back-button" button-type="submit">Back To Meal Plans</router-link>
    </form>
    
    </div>
  </div>

</template>




<script>
import MealService from "../services/MealService";
export default {
  name: "add-meal-plan",

  data() {
    return {
      newMeal: {},
      myRecipes: "",

      submitMeal() {
        MealService.addMeal(this.newMeal);

        this.$router.push("meals");
      },
      getMyRecipes() {
        MealService.getMyRecipes().then((response) => {
          this.myRecipes = response.data;
        });
      },
      resetForm() {
        this.newMeal = {};
      },
    };
  },
};
</script>

<style>

/* Body Styling */
.add-plan-body {
  margin-top: 50px;
  margin-left: 20px;
  box-sizing: border-box;
  line-height: 1.6;
  display: grid;
  place-items: center;
}

/* Inside Form Styling */

.add-plan-box {
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  width: 80%;
  max-width: 600px;
  border-radius: 10px;
  background: rgb(243, 241, 241);
  text-align: center;
  padding: 2em;
 
}

.add-plan-body h1,label {
  color: gray;
}

#add-meal-title {
  text-align: center;
}

.form-element {
  padding: 1rem;
  display: flex;
  flex-direction: column;
  place-items: center;
  
 
}

/* Inputs */

select, input {
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}

.form-element-select, select, input {
  border-radius: 5px;
  padding: 10px 15px;
  width: auto;
  font-size: 15px;
  font-family: 'Poppins';
  border: 0;
}







/* buttons */
.submit-new-plan {
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
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

.clear-fields, .back-button {
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
  margin: auto;
  width: auto;
  border: 0;
  padding: 15px;
  margin: 10px 20px;
  color: #fff;
  font-size: 14px;
  margin-bottom: 10px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  text-decoration: none;
}
.submit-new-plan:hover, .clear-fields:hover, .back-button:hover {
  transition: all 1s ease 0s;
  cursor: pointer;
  background-color: gray;
}
</style>