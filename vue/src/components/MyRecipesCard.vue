<template>
    <div class = "my-recipe-card">
        <h1>{{myRecipe.recipeName}}</h1>
        <!-- <div v-for="recipe in myRecipes" v-bind:key="recipe.id"></div> -->
        <p v-bind="getMyRecipe()" ></p>
        <img :src="myRecipe.image" />
        <p>{{myRecipe.recipeName}}</p>
        <p>{{myRecipe.readyInMinutes}}</p>
        <p>{{myRecipe.serving}}</p>
        <div class="ingredient" v-for="ingredient in myRecipe.ingredients" v-bind:key="ingredient.id">
      <p>{{ingredient}}</p>
      </div>
        <p>{{myRecipe.instructions}}</p>
        

    </div>
</template>


<script>
import MealService from '../services/MealService';



export default {
    name: "my-recipes-card",
    data(){
        return{
            myRecipe:"",
            getMyRecipe(){
                MealService.getMyRecipeDetails(this.$route.params.id).then((response)=>{
                    this.myRecipe=response.data;
                })
            }
        }
    }
   
    
}
</script>




<style>




</style>