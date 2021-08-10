<template>
  <div class="container-header">
        <router-link v-if="$store.state.token == '' " v-bind:to="{name: 'home'}" class="logo">FORKTASTIC</router-link>
        <router-link v-if="$store.state.token != '' " v-bind:to="{name: 'userMeals'}" class="logo">Bienvenue dans notre meal planner, {{$store.state.user.username}}!</router-link>
        <nav>
        <router-link class = "header-link" v-bind:to="{name: 'home'}">Home</router-link>
         <router-link class = "header-link" v-bind:to="{name: 'spoonacular'}">Search Recipes</router-link>
          <router-link class = "header-link" v-bind:to="{name:'userMeals'}" v-if="$store.state.token != ''">My Meal Plans</router-link> 
         <router-link class = "header-link" v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''">Login</router-link>
          <router-link class = "header-link" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      </nav>
  </div>
</template>

<script>
export default {
    name: 'the-header',
    data() {
        return {
          
        }
    }

}
</script>

<style scoped>

.container-header {
    box-sizing: border-box;
    top: 0; 
    left: 0;
    height: 4rem;
    position: fixed;
    width: 100%;
    z-index: 10000;
    background: #fff;
    box-shadow: 0 .5rem 1rem rgba(0,0,0,.1);
    padding: 1rem 2%; 
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 1rem;
    color: grey;
    text-decoration: none;
    
}

.logo:hover {
    color: black;
}

.header-link {
    font-family: 'Poppins';
    text-decoration: none;
    color: gray;
    font-size: 1rem;
    margin-left: 2rem;  
}

.header-link:hover {
    color: black;
}

</style>