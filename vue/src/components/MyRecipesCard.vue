<template>
    <div class = "my-single-recipe-card-body">
        <div class="my-single-recipe-card">
        <h1 class = "single-recipe-name">{{myRecipe.recipeName}}</h1>
        <!-- <div v-for="recipe in myRecipes" v-bind:key="recipe.id"></div> -->
        <p v-bind="getMyRecipe()" ></p>
        <img :src="myRecipe.image" class="my-single-recipe-image" />
        <p> <span class="my-recipe-title">Ready In: </span> {{myRecipe.readyInMinutes}} Minutes</p>
        <p> <span class="my-recipe-title">Servings: </span>{{myRecipe.serving}}</p>
        <p><span class="my-recipe-title">Ingredients:</span></p>
        <div class="my-single-recipe-ingredient" v-for="ingredient in myRecipe.ingredients" v-bind:key="ingredient.id" alt = "my-recipe-image">
      <p>{{ingredient}}</p>
      </div>
        <p><span class="my-recipe-title">Instructions:</span> {{myRecipe.instructions}}</p>
        </div>
        <div class="button-wrapper">
             <input
            type="submit"
            value="print this recipe"
            class="print-my-single-recipe"
          />
    <router-link class="back-to-library" v-bind:to="{name: 'myRecipes'}">Back to Recipe Library</router-link>
    </div>
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

.my-single-recipe-card-body {
 margin: 5rem;
 display: grid;
 place-items: center;

}

.my-single-recipe-card {
box-shadow: 0 0 20px rgba(0,0,0,0.2);
width: 60%;
display: flex;
flex-direction: column;
text-align: left;
padding: 2em;
border-radius: 10px;
}

.single-recipe-name {
    text-align: center;
    color: gray;
    text-transform: capitalize;
}

.my-single-recipe-image {
    border-radius: 10px;
  box-shadow: 0 0 20px rgba(0,0,0,0.2);
}

.my-recipe-title {
    font-weight: bold;
    
}

.button-wrapper {
  
  width: 100%;
  text-align: center;
  position: relative;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);

}

.back-to-library, .print-my-single-recipe {

  text-transform: uppercase;
  font-family: "Poppins";
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
  width: auto;
  border: 0;
  padding: 14px;
  margin: 20px 25px;
  color: #fff;
  font-size: 14px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  text-decoration: none;
  cursor: pointer;
}

.back-to-library:hover, .print-my-single-recipe:hover {
    
  transition: all 1s ease 0s;
  cursor: pointer;
  background-color: gray;

}


</style>