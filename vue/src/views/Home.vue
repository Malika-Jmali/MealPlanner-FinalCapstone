<template>
  <div class="home">
    <h1>Home</h1>
    <p>Welcome!</p>
  <router-link v-bind:to="{name:'userMeals'}">My Meals</router-link>
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>
