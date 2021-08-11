<template>
<div class = "body-recipe-card">
<div class = "spoon-recipe-card">
   <div class="image-sidebar">
   <img class = "recipe-detail-img" v-bind:src="recipes[0].image" alt="food image" />
   </div>
   <div class="recipe-main">
    <p><span class="title">Recipe Name:</span> {{recipes[0].title}}</p>
    <p><span class="title">Ready In:</span> {{recipes[0].readyInMinutes}} minutes</p>
    <p><span class="title">Servings:</span> {{recipes[0].servings}}</p>
       <p><span class="title">Ingredients:</span></p>
    <div class="ingredient" v-for="ingredient in recipes[0].ingredients" v-bind:key="ingredient.id">
      <p>{{ingredient.original}}</p>
      </div>
    <p><span class="title">Instructions:</span> {{recipes[0].instructions}}</p>   
    </div>
    </div>
  
            <p>{{message}}</p>
            <button v-if ="$store.state.token != ''" button type="submit" class = "save-this-recipe" v-on:click="changeTitle()"  >Save this Recipe</button>
            <p>Print This Recipe or Share on Social Media:</p>
          <ul class="social-links">
            <li class="social-item">
              <a id="social-link" href="#"><i class="fas fa-print"></i></a>
            </li>
            <li class="social-item">
              <a id="social-link" href="#"><i class="fab fa-facebook-f"></i></a>
            </li>
            <li class="social-item">
              <a id="social-link" href="#"><i class="fab fa-twitter"></i></a>
            </li>
            <li class="social-item">
              <a id="social-link" href="#"><i class="fab fa-instagram"></i></a>
            </li>
          </ul>
  <router-link class="back-to-search" v-bind:to="{name: 'spoonacular'}">Back to Search</router-link>
  </div>
  
</template>

<script>
export default {
    name: 'recipe-detail-card',
    props: ["recipes"],
    
   data() {
     return{
       message: 'Log in or sign up to save this recipe'
     }
   },
   methods: {
     changeTitle() {
       this.message = this.message.replace("Log in or sign up to save this recipe", "Saved!");
       
     }
   }
    
}
</script>

<style>

.back-to-search {
  color: gray;
  text-decoration: none;
  padding-top: 15px;
}

.back-to-search:hover{
  color: black;
}

.recipe-detail-img {
  border-radius: 10px;
  box-shadow: 0 0 20px rgba(0,0,0,0.2);

}

.image-sidebar {
  text-align: center;
}

.social-links {
  list-style: none;
  display: flex;
  margin: 0;
  padding: 0;
  justify-content: space-around;
  width: 150px;
  margin: 0 auto;
}

#social-link {
  color: gray;
}

#social-link:hover,
#social-link:focus {
  color: purple;
  opacity: 1;
}

.save-this-recipe {
  text-transform: uppercase;
  font-family: "Poppins";
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
  width: auto;
  border: 0;
  padding: 14px;
  color: #fff;
  font-size: 14px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  text-decoration: none;
  cursor: pointer;
}

.save-this-recipe:hover {
  transition: all 1s ease 0s;
  cursor: pointer;
  background-color: gray;
}

</style>