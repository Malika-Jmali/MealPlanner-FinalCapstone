<template>
<!-- container div -->
<div class = "container">
  <!-- welcome banner -->
  <div class="home">
    <div class="text-box">
      <h1 class="forktastic">Welcome to Forktastic</h1>
      <p class="header-paragraph">Customizable meal plans and searchable library of recipes to make meal planning as easy as possible. </p>
      <br>
      <router-link :to="{ name: 'register' }" class="signup-button" button-type="submit">Click here to sign up</router-link>
     </div>
  </div>
   <!-- app features -->
  <div class="features">
    <h1>App Features</h1>
    <div class="row">
      <div class="feature-col">
        <h2>Free Recipe Search</h2>
        <p>Search the database of hundreds of recipes by name and category, even without an account.</p>
      </div>
       <div class="feature-col">
        <h2>Meal Planning</h2>
        <p>Create and customize meal plans that fit your dietary needs.</p>
      </div>
       <div class="feature-col">
        <h2>Weekly Newsletter</h2>
        <p>Be the first to know when new recipes are added or our new meal plans.</p>
      </div>
    </div>
    </div>

    <!-- categories -->

    <div class="categories">
      <h1>Meal Plan Categories</h1>
      <p>Choose from any number of our categories, including:</p>

      <div class="row">
        <div class="categories-col">
          <img src="../assets/vegetarian.jpg" alt="vegetarian">
          <div class="layer">
            <h3>VEGETARIAN</h3>
          </div>
        </div>
        <div class="categories-col">
          <img src="../assets/keto.jpg" alt="keto">
          <div class="layer">
            <h3>KETO</h3>
          </div>
        </div>
        <div class="categories-col">
          <img src="../assets/mediterranean2.jpg" alt="mediterranean">
          <div class="layer">
            <h3>MEDITERRANEAN</h3>
          </div>
        </div>
      </div>
  </div>
  <!-- sample recipes -->

  <div class="recipes">
    <h1>Sample Recipes</h1>
    <p>Some of our most popular recipes:</p>

    <div class="row">
      <div class="recipes-col">
        <img src="../assets/beercanchicken.jpg" alt="beer can chicken">
          <h3>Beer Can Chicken</h3> 
      </div>
            <div class="recipes-col">
        <img src="../assets/couscous.jpg" alt="moroccan couscous">
        <h3>Moroccan Couscous</h3>
        </div>
            <div class="recipes-col">
        <img src="../assets/cookies.jpg" alt="chocolate cookies">
        <h3>Chocolate Cookies</h3>
      </div>
    </div>
  </div>
  <!-- footer -->
  <div class="footer">
    <h4>Contact Us</h4>
    <p>We want to know what you think! To ask questions or make suggestions, please connect with
      us on social media! </p>
      <div class="icons">
        <i class="fab fa-facebook-f"></i>
        <i class="fab fa-twitter"></i>
        <i class="fab fa-instagram"></i>
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

<style scoped>

/* welcome banner */

.home {
  margin: 0;
  min-height: 100vh;
  width: 100%;
  background-image:linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4) ),url('../assets/louis-hansel-restaurant-photographer-cdR6i9i4jwI-unsplash.jpg');
  background-position: center;
  background-size: cover;
  
}

.forktastic {
  margin-top: 150px;
  color: #fff;
  font-size: 100px;
}

.header-paragraph {
  color: white;
  font-size: 20px;
  margin: 10px 0 40px;
}

a {
  color: white;
}

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
}

.signup-button:hover, .signup-button:active, .signup-button:focus {
  background-color: #000;
  transition: all 1s ease 0s;
  cursor: pointer;
}

/* features */

.features {
  width: 90%;
  margin: auto;
  text-align: center;
  padding-top: 40px;
  
}

h1 {
  font-size: 35px;
  color: grey;
}

p {
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

h3 {
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
  padding-top: 50px;
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
  margin-bottom: -50px;
  
}

.footer h4 {
  padding-top: 40px;
  margin: 40px 0 25px 0;
}

.fab{
  margin: 10px 10px;
  padding: 10px 10px;
}

</style>