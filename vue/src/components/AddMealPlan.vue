<template>
  <div class="add-plan-body">
    <div class="add-plan-box">
      <p v-bind="getMyRecipes()"></p>
      <form v-on:submit.prevent="submitMeal">
        <h1 id="add-meal-title">Create Meal Plan</h1>

        <div class="form-element">
          <div class="form-element-select">
            <label for="category" class="label"><p class="new-meal-info">Meal Plan Name:</p></label>
            <input type="text" class="name-of-meal" required v-model="newMeal.mealName" />
          </div>

          <div class="form-element-select">
            <p class="new-meal-info"><label for="breakfast" class="label">Breakfast:</label></p>
            <select required v-model="newMeal.breakfastID">
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
            <p class="new-meal-info"><label for="lunch" class="label">Lunch:</label></p>
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
        
          <div class="form-element-select">
            <p class="new-meal-info"><label for="dinner" class="label">Dinner:</label></p>
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
        </div>

        <div class="button-wrapper-submit">
          <input type="submit" value="Save" class="submit-new-plan" />
          <input
            type="submit"
            value="Clear Fields"
            v-on:click="resetForm()"
            class="clear-fields"
          />
          
          <router-link
            v-bind:to="{ name: 'userMeals' }"
            class="back-button"
            input-type="submit"
            >Back To Meal Plans</router-link
          >
        </div>
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
  margin-top: 40px;
  margin-left: 20px;
  box-sizing: border-box;
  line-height: 1.5;
  display: grid;
  place-items: center;
  color: gray;
  font-size: 20px;

}

/* Inside Form Styling */

.add-plan-box {
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
  width: 100%;
  max-width: 600px;
  border-radius: 10px;
  background: rgb(243, 241, 241);
  text-align: center;
  padding: 1.5em;
}

#add-meal-title {
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

.label {
  font-weight: 500;
  font-size: 18px;
}

.new-meal-info {
  text-align: left;
}

/* Inputs */

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

.submit-new-plan {
  
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

.clear-fields {
  
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

.back-button {
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

.submit-new-plan:hover,
.clear-fields:hover,
.back-button:hover {
  transition: all 1s ease 0s;
  cursor: pointer;
  background-color: gray;
}
</style>