<template>
<div class = "body">
 <div class = "recipe-card">
   <div class="image-sidebar">
   <img v-bind:src="recipes[0].image" alt="food image" />
   </div>
   <div class="recipe-main">
    <p><span class="title">Recipe Name:</span> {{recipes[0].title}}</p>
    <p><span class="title">Ready In:</span> {{recipes[0].readyInMinutes}} minutes</p>
    <p><span class="title">Servings:</span> {{recipes[0].servings}}</p>
    <p><span class="title">Instructions:</span> {{recipes[0].instructions}}</p>
    <p><span class="title">Ingredients:</span></p>
    <div v-for="ingredient in recipes[0].ingredients" v-bind:key="ingredient.id">
      <p>{{ingredient.original}}</p>
      </div>
    </div>
  </div>
  <router-link v-bind:to="{name: 'spoonacular'}">Back to Search</router-link>
  </div>
</template>

<script>
export default {
    name: 'recipe-detail-card',
    props: ["recipes"]
    
}
</script>

<style>

a {
  color: gray;
  text-decoration: none;
}

</style>