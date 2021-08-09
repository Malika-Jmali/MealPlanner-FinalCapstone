<template>
<div class = "body-recipe-card">
 <div class = "recipe-card">
   <div class="image-sidebar">
   <img class = "recipe-detail-img" v-bind:src="recipes[0].image" alt="food image" />
   </div>
   <div class="recipe-main">
    <p><span class="title">Recipe Name:</span> {{recipes[0].title}}</p>
    <p><span class="title">Ready In:</span> {{recipes[0].readyInMinutes}} minutes</p>
    <p><span class="title">Servings:</span> {{recipes[0].servings}}</p>
       <p><span class="title">Ingredients:</span></p>
    <div class="ingredient" v-for="ingredient in recipes[0].ingredients" v-bind:key="ingredient.id">
      <p>{{ingredient.original}}</p>
      </div>
    <p><span class="title">Instructions:</span> {{recipes[0].instructions}}</p>   
    </div>
  </div>
  <router-link class="back-to-search" v-bind:to="{name: 'spoonacular'}">Back to Search</router-link>
  </div>
</template>

<script>
export default {
    name: 'recipe-detail-card',
    props: ["recipes"]
    
}
</script>

<style>

.back-to-search {
  color: gray;
  text-decoration: none;
}

.recipe-detail-img {
  border-radius: 10px;
  box-shadow: 0 0 20px rgba(0,0,0,0.2);

}

.image-sidebar {
  text-align: center;
}


</style>