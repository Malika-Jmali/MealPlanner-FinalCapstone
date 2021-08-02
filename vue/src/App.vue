<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link> 
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      
    </div>
    <router-view />
  </div>
</template>
// <script>
// import SpoonacularData from '../components/SpoonacularData.vue'
// export default {
//   components:
//     SpoonacularData
// }
// </script>