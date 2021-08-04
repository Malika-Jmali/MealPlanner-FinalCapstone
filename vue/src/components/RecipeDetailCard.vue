<template>
 <div>
    <!-- <p>{{ result }}</p> -->
    <p>{{recipes.title}}</p>
    <p>{{recipes.readyInMinutes}}</p>
    <p>{{recipes.servings}}</p>
    <p>{{recipes.image}}</p>
    <p>{{recipes.instructions}}</p>
    <div v-for="ingredient in recipes.ingredients" v-bind:key="ingredient.id">
      <p>{{ingredient}}</p>
    </div>
  </div>
</template>

<script>
export default {
    name: 'recipe-detail-card',
    props: {
      recipes: Array
    }
    
}
</script>

<style>

</style>