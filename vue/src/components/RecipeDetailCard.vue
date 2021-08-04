<template>
 <div>
    <!-- <p>{{ result }}</p> -->
    <p>{{recipe.title}}</p>
    <p>{{recipe.readyInMinutes}}</p>
    <p>{{recipe.servings}}</p>
    <p>{{recipe.image}}</p>
    <p>{{recipe.instructions}}</p>
  </div>
</template>

<script>
export default {
    name: 'recipe-detail-card',
    props: {
      recipe: Object
    }
    
}
</script>

<style>

</style>