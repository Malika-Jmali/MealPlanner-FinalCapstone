<template>
<div class ="hero">
  <div class="container">
    <div class="main-message">
      <h1>Welcome To Forktastic</h1>
      <p>Welcome to the app that makes meal planning easier than it's ever been. You can search our library
        of recipes for free, and sign up for an account to save recipes to your own customizable meal plans.
        </p>
        <router-link v-bind:to="{ name: 'register' }" v-if="$store.state.token == ''">Sign up for Free</router-link>
      </div>
     </div>
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>

<style scoped>

div {
  min-height: 100vh;
  padding: 0 10%;
}

.home {
  background: url("../assets/louis-hansel-restaurant-photographer-cdR6i9i4jwI-unsplash.jpg")no-repeat;
  background-size: cover;
  background-position: center;
}


</style>