<template>
    <div>
        <p v-bind="getMyRecipes()"></p>
    <form v-on:submit.prevent="submitMeal">
    <div class="form-element">
        <label for="category">Name Your New Meal Plan:</label>
        <input id="category" type="text" v-model="newMeal.mealName">
    </div>
    <div class="form-element">
        <label for="breakfast">Breakfast:</label>
        <select id="breakfast" v-model="newMeal.breakfastID">
            <option value="1">Breakfast Vegetable Scramble</option>
            <option value="2">Garden Fresh Flatbread</option>
            <option value="3">Sesame Garlic Ramen Noodles</option>
            <option value="4">Vegetarian stew</option>
            <option value="5">Baked Fish with Garlic and Basil</option>
            <option value="6">Shakshuka</option>
            <option value="7">Mediterranean Lentil Salad Recipe</option>
            <option value="8">Keto Italian breakfast casserole</option>
            <option value="9">Keto taco meatza</option>
            <option value="10">Keto chicken zoodle al limone</option>
        </select>
    </div>
      <div class="form-element">
        <label for="lunch">Lunch:</label>
        <select id="lunch" v-model="newMeal.lunchID">
            <option value="1">Breakfast Vegetable Scramble</option>
            <option value="2">Garden Fresh Flatbread</option>
            <option value="3">Sesame Garlic Ramen Noodles</option>
            <option value="4">Vegetarian stew</option>
            <option value="5">Baked Fish with Garlic and Basil</option>
            <option value="6">Shakshuka</option>
            <option value="7">Mediterranean Lentil Salad Recipe</option>
            <option value="8">Keto Italian breakfast casserole</option>
            <option value="9">Keto taco meatza</option>
            <option value="10">Keto chicken zoodle al limone</option>
        </select>
    </div>
      <div class="form-element">
        <label for="dinner">Dinner:</label>
        <select id="dinner"  v-model="newMeal.dinnerID">
            <option v-for="recipe in myRecipes" v-bind:key="recipe.id" :value="recipe.recipeId">{{recipe.recipeName}}</option>
            <!-- <option value="2">Garden Fresh Flatbread</option>
            <option value="3">Sesame Garlic Ramen Noodles</option>
            <option value="4">Vegetarian stew</option>
            <option value="5">Baked Fish with Garlic and Basil</option>
            <option value="6">Shakshuka</option>
            <option value="7">Mediterranean Lentil Salad Recipe</option>
            <option value="8">Keto Italian breakfast casserole</option>
            <option value="9">Keto taco meatza</option>
            <option value="10">Keto chicken zoodle al limone</option> -->
        </select>
    </div>
   
    <input type="submit" value="Save">
    <input type="button" value="Cancel">
</form>
</div>
</template>




<script>
import MealService from '../services/MealService'
export default {
    name: 'test-add-meal',

    data() {
        return{
            newMeal: {},
            myRecipes: "",
 
            submitMeal(){
                MealService.addMeal(this.newMeal)
            
                  this.$router.push('meals');
              },
            getMyRecipes(){
                MealService.getMyRecipes().then((response) => {
                    this.myRecipes = response.data;
                })
            }
         
        }
            
        }
    }


</script>

<style>

.form-element {

margin-top: 100px;

}

</style>