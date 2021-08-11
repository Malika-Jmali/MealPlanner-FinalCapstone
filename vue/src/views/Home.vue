<template>
<!-- container div -->
<div class = "container-home">
  <!-- welcome banner -->
  <div class="home">
    <div class="text-box">
      <h1 class="forktastic">Welcome to Forktastic</h1>
      <h2 class="header-who-we-are">Customizable meal plans and searchable library of recipes that makes meal planning as easy as possible. </h2>
  
      <router-link v-if="$store.state.token == '' " v-bind:to="{ name: 'register' }" class="signup-button-home" button-type="submit">Click here to sign up</router-link>
     </div>
  </div>
   <!-- app features -->
  <div class="features">
    <h1 class = "headline">Benefits of Forktastic</h1>
    <div class="row">
      <div class="feature-col">
        <h2 class="app-benefits">Save Money</h2>
        <p class = "home-paragraph">Do you want to save your money? Meal planning will help you avoid buying unnecessary items from the grocery store. It will also help you reduce your food waste, that way you get the most bang for your buck!</p>
      </div>
       <div class="feature-col">
        <h2 class= "app-benefits">Save Time</h2>
        <p class = "home-paragraph">Don’t waste your time trying to figure out what you want to eat each day. By planning and buying your groceries for the entire week you will have more time to enjoy your favorite hobbies or watch that movie you’ve been wanting to see.
</p>
      </div>
       <div class="feature-col">
        <h2 class= "app-benefits">Expand your Taste Buds</h2>
        <p class = "home-paragraph">Eating the same old thing week after week can be mundane. Trying new and healthy foods will help you find what you really like. With our wide selection of recipes, you are sure to make a meal plan that will excite your palate.</p>
      </div>
    </div>
    </div>

    <!-- categories -->

    <div class="categories">
      <h1 class = "headline">Meal Plan Categories</h1>
      <p class = "home-paragraph-description">Create your own or choose from our library of meal plans</p>

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
    <p class = "home-paragraph-description">Our most popular recipes</p>
  
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
     <p class = "let-us-know">We want to know what you think! To ask questions or make suggestions, please connect with
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

.container-home {
  margin: 0;
  padding: 0;
}

.home {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  width: 100%;
  background-image:linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ),url('../assets/louis-hansel-restaurant-photographer-cdR6i9i4jwI-unsplash.jpg');
  background-position: center;
  background-size: cover;
  
  
}

.home h1  {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 50px;
}


.forktastic {
  margin-top: 150px;
  color: #fff;
  font-size: 100px;
  text-shadow: 2px 2px #000;
}

.header-who-we-are {
  color: #fff;
  font-size: 22px;
  margin-bottom: 100px;
  text-shadow: 1px 2px #000;
  
}

/* a {
  color: white;
} */

.text-box {
  width: 100%;
  position: absolute;
  text-align: center;
}

.signup-button-home {
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: gray;
  width: auto;
  border: 0;
  padding: 30px 30px;
  color: #fff;
  background-color: purple;
  font-size: 20px;
  box-shadow: 0 10px 20px 0 rgba(0,0,0,0.2), 0 10px 10px 0 rgba(0,0,0,0.24);
  text-decoration: none;
  margin-right: 50px;
 }


.signup-button-home:hover, .signup-button-home:active, .signup-button-home:focus {
  background-color: darkgray;
  transition: all 1s ease 0s;
  cursor: pointer;
  color: black;
}

/* features */

.features {
  width: 90%;
  margin: auto;
  text-align: center;
  padding-top: 40px;
  
}

.headline {
  font-size: 40px;
  color: grey;
  font-weight: 600;
}

.home-paragraph {
  padding: 10px;
  line-height: 20px;
  font-size: 15px;
  text-align: justify;
  font-size: 19px;
  font-weight: 500;
}

.home-paragraph-description {
  padding: 10px;
  line-height: 20px;
  font-size: 25px;
  text-align: center;
  font-weight: bold;
  color: gray;

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
  font-size: 25px;
  
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

.let-us-know {
  font-size: 17px;
  font-weight: 500;
}

#facebook, #instagram, #twitter{
  margin: 10px 10px;
  padding: 10px 10px;
  color: purple;
  font-size: 20px;
}

#facebook:hover, #instagram:hover, #twitter:hover {
  color: black;
  cursor: pointer;
}

</style>