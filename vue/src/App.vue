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

<style>

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap');

#app {
  font-family: 'Poppins';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #000;
}

a:hover {
  color: black;
}

</style>