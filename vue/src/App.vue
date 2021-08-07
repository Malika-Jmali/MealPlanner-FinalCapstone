<template>
  <div id="app">
    <nav>
    </nav>
    <the-header />
    <router-view />
    </div>
  
</template>

<script>
import TheHeader from './components/TheHeader.vue'

export default {

  name: 'App',
  components: {
    TheHeader,
  }
}
</script>

<style scoped>

#app {
  font-family: 'Poppins';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>