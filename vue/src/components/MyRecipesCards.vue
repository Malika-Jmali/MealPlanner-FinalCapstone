<template>
    <div class = "my-recipe-card">
        <div v-for="recipe in myRecipes" v-bind:key="recipe.id"></div>
        <p>{{recipe.recipeName}}</p>
    </div>
</template>


<script>



export default {
    name: "my-recipes-cards",
    props: ["myRecipes"]
    
}
</script>




<style>

.my-recipe-card {
  margin-top: 300px;
}

</style>