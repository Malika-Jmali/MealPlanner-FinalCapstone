<template>
    <div class = "my-recipe-card">
        <!-- <div v-for="recipe in myRecipes" v-bind:key="recipe.id"></div> -->
        <p v-bind="getMyRecipe()" ></p>
        <p>{{myRecipe}}</p>
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