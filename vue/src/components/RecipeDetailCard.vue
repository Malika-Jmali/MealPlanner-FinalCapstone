<template>
 <div>
    <!-- <p>{{ result }}</p> -->
    <p>Title: {{recipes[0].title}}</p>
    <p>Ready In Minutes: {{recipes[0].readyInMinutes}}</p>
    <p>Servings: {{recipes[0].servings}}</p>
    <!-- <p>{{recipes[0].image}}</p> -->
     <img v-bind:src="recipes[0].image" alt="food image" />
    <p>Instructions: {{recipes[0].instructions}}</p>
    <div v-for="ingredient in recipes[0].ingredients" v-bind:key="ingredient.id">
      <p>{{ingredient.original}}</p>
    </div>
  </div>
</template>

<script>
export default {
    name: 'recipe-detail-card',
    props: ["recipes"]
    
}
</script>

<style>

</style>