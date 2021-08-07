<template>
  <div class="home">
    <div class="cotent">
    <!-- <h1 v-if="$store.state.token == '' ">Welcome to Forktastic</h1> -->
     <!-- <h1 v-if="$store.state.token != '' ">Welcome {{$store.state.user.username}}!</h1> -->
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
  padding: 0 9%;
}

.home {
  background: url("../assets/louis-hansel-restaurant-photographer-cdR6i9i4jwI-unsplash.jpg")no-repeat;
  background-size: cover;
  background-position: center;
}

h1 {
  font-size: 5rem;
  padding: 50px;
  
}

</style>