<template>
    <div class = "my-recipe-card">
        <div v-for="recipe in myRecipes" v-bind:key="recipe.id"></div>
        <p>{{recipe.recipeName}}</p>
    </div>
</template>


<script>



export default {
    name: "my-recipes-card",
   
    
}
</script>




<style>




</style>