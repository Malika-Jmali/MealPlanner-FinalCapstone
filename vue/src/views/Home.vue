<template>
<!-- container div -->
<div class = "container-home">
  <!-- welcome banner -->
  <div class="home">
    <div class="text-box">
      <h1 class="forktastic">Welcome to Forktastic</h1>
      <p class="header-paragraph">Customizable meal plans and searchable library of recipes to make meal planning as easy as possible. </p>
      <br>
      <router-link v-if="$store.state.token == '' " v-bind:to="{ name: 'register' }" class="signup-button" button-type="submit">Click here to sign up</router-link>
     </div>
  </div>
   <!-- app features -->
  <div class="features">
    <h1 class = "headline">App Features</h1>
    <div class="row">
      <div class="feature-col">
        <h2 class="app-benefits">Free Recipe Search</h2>
        <p class = "home-paragraph">Search the database of hundreds of recipes by name and category, even without an account.</p>
      </div>
       <div class="feature-col">
        <h2 class= "app-benefits">Meal Planning</h2>
        <p class = "home-paragraph">Create and customize meal plans that fit your dietary needs.</p>
      </div>
       <div class="feature-col">
        <h2 class= "app-benefits">Weekly Newsletter</h2>
        <p class = "home-paragraph">Be the first to know when new recipes are added or our new meal plans.</p>
      </div>
    </div>
    </div>

    <!-- categories -->

    <div class="categories">
      <h1 class = "headline">Meal Plan Categories</h1>
      <p class = "home-paragraph">Choose from any number of our categories, including:</p>

      <div class="row">
        <div class="categories-col">
          <img src="../assets/vegetarian.jpg" alt="vegetarian">
          <div class="layer">
            <h3 class="meal-plan-example">VEGETARIAN</h3>
          </div>
        </div>
        <div class="categories-col">
          <img src="../assets/keto.jpg" alt="keto">
          <div class="layer">
            <h3 class="meal-plan-example">KETO</h3>
          </div>
        </div>
        <div class="categories-col">
          <img src="../assets/mediterranean2.jpg" alt="mediterranean">
          <div class="layer">
            <h3 class="meal-plan-example">MEDITERRANEAN</h3>
          </div>
        </div>
      </div>
  </div>
  <!-- sample recipes -->

  <div class="recipes">
    <h1 class = "headline">Sample Recipes</h1>
    <p class = "home-paragraph">Some of our most popular recipes:</p>
  
    <div class="row">
      <div class="recipes-col">
        <h3 class = "recipe-example">Beer Can Chicken</h3> 
        <img src="../assets/beercanchicken.jpg" alt="beer can chicken">
          
      </div>
            <div class="recipes-col">
              <h3 class = "recipe-example">Moroccan Couscous</h3>
        <img src="../assets/couscous.jpg" alt="moroccan couscous">
        
        </div>
        
            <div class="recipes-col">
              <h3 class = "recipe-example">Chocolate Cookies</h3>
        <img src="../assets/cookies.jpg" alt="chocolate cookies">
        
      </div>
    </div>
  </div>
  <!-- footer -->
  <div class="footer">
    <h4>Contact Us</h4>
     <p class = "home-paragraph">We want to know what you think! To ask questions or make suggestions, please connect with
      us on social media: </p>
      <div class="icons">
        <i class="fab fa-facebook-f" id="facebook"></i>
        <i class="fab fa-twitter" id="twitter"></i>
        <i class="fab fa-instagram" id="instagram"></i>
      </div>
  </div>
    <!-- container div end-->
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>

<style>

/* welcome banner */

.home {
  margin: 0;
  min-height: 100vh;
  width: 100%;
  background-image:linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4) ),url('../assets/louis-hansel-restaurant-photographer-cdR6i9i4jwI-unsplash.jpg');
  background-position: center;
  background-size: cover;
  text-align: center;
  
}

.forktastic {
  margin-top: 150px;
  color: #fff;
  font-size: 100px;
  text-shadow: 1px 1px #000;
}

.header-paragraph {
  color: white;
  font-size: 20px;
  margin: 10px 0 40px;
  text-shadow: 1px 1px #000;
}

/* a {
  color: white;
} */

.text-box {
  width: 100%;
  position: absolute;
  top: 30%;
  left: 30%;
  transform: translate(-30%, -30%);
}

.signup-button {
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: gray;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #fff;
  font-size: 14px;
  margin-bottom: 10px;
  box-shadow: 0 0 20px 0 rgba(0,0,0,0.2), 0 5px 5px 0 rgba(0,0,0,0.24);
  text-decoration: none;
}

.signup-button:hover, .signup-button:active, .signup-button:focus {
  background-color: #000;
  transition: all 1s ease 0s;
  cursor: pointer;
  color: gray;
}

/* features */

.features {
  width: 90%;
  margin: auto;
  text-align: center;
  padding-top: 40px;
  
}

.headline {
  font-size: 35px;
  color: grey;
}

.home-paragraph {
  padding: 10px;
  line-height: 20px;
  font-size: 15px;
}


.row {
  margin-top: 5%;
  display: flex;
  justify-content: space-between;

}

.feature-col {
  flex-basis: 30%;
  background: lightgray;
  opacity: 0.7;
  border-radius: 10px;
  margin-bottom: 5%;
  padding: 40px 20px;
  box-sizing: border-box;
  box-shadow: 0 0 20px 0 rgba(0,0,0,0.2), 0 5px 5px 0 rgba(0,0,0,0.24);
}

.meal-plan-example, .recipe-example  {
  text-align: center;
  color: grey;
  
}

/* categories */

.categories {
  width: 90%;
  margin: auto;
  text-align: center;
  padding-top: 50px;
  box-sizing: border-box;
}

.categories-col {
  flex-basis: 32%;
  margin-bottom: 30px;
  position: relative;
  overflow: hidden;
}

.categories-col img {
   width: 100%;
   height: 100%;
   object-fit: cover;
   border-radius: 10px;
}

.layer {
  background: transparent;
  height: 100%;
  width: 100%;
  position: absolute;
  top: 0;
  left: 0;
  transition: 0.5s;
  border-radius: 10px;
  color: #000;
}

.layer:hover{
  background: rgba(235, 225, 225, 0.7);
}

.layer h3 {
  width: 100%;
  font-weight: 500;
  font-size: 30px;
  left: 50%;
  bottom: 0;
  transform: translateX(-50%);
  position:absolute;
  opacity: 0;
  transition: 0.5s;
  color: black;
}

.layer:hover h3 {
  bottom: 49%;
  opacity: 1;
}

/* recipes */

.recipes {
  width: 90%;
  margin: auto;
  text-align: center;
  padding-top: 40px;
}

.recipes-col {
  flex-basis: 32%;
  margin-bottom: 5%;
  text-align: left;
}

.recipes-col img {
   width: 100%;
   height: 100%;
   object-fit: cover;
   border-radius: 10px;
   box-shadow: 0 0 20px 0 rgba(0,0,0,0.2), 0 5px 5px 0 rgba(0,0,0,0.24);
}



/* Footer */

.footer {
  text-align: center;
  background: lightgray;
  opacity: 0.7;
  margin-top: 200px;
  margin-bottom: -100px;
  width: 100%;
}

.footer h4 {
  padding-top: 30px;
  margin: 40px 0 25px 0;
}

#facebook, #instagram, #twitter{
  margin: 10px 10px;
  padding: 10px 10px;
}

#facebook:hover, #instagram:hover, #twitter:hover {
  color: purple;
  cursor: pointer;
}

</style>