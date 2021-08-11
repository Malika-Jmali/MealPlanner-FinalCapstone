<template>
  <div class = "spoon-body">
    <!--  when we search for a recipe we get the recipe id so we can use that to access the recipe's details and show them
          on a "new" page (a new route) 
          -->
        <div class="spoon-header">
          <div class = "form">
    <h1 class = "search-recipes">Search Recipes for FREE</h1>
    <p class = "popular">Here are our most popular recipes, but search for whatever you like!</p>
    <!-- <button v-on:click="getData">Click Here For A Recipe!</button> -->
    
      <label for="recipe" class = "recipe-name">Search Recipes By Name:</label>
      <input type="text" name="recipe" class="search-field name" v-model="search" />

      <label for="recipe" class = "recipe-category">Search Recipes By Category:</label>
      <input type="text" name="recipe" class="search-field category" v-model="typeKeyword" />
      <button id="submitSearch" v-on:click="getRecipeList" button type="submit">Search</button>
      
      </div>
      
    </div>
    <!-- Spoonacular Data -->
    <div class="cards">
       
    <div v-for="result in resultArr" v-bind:key="result.id">
    <p class = "links"><router-link class = "recipe-details" v-bind:to="{ name: 'recipeDetails', params:{id: result.id}}"> {{ result.title }} </router-link></p>
      <router-link class = "recipe-details" v-bind:to="{ name: 'recipeDetails', params:{id: result.id}}"><img id = "spoonacular-image" v-bind:src="result.image" alt="food image" /></router-link>
     
      </div>
    </div>
  </div>
</template>

<script>
import SpoonacularService from "../services/SpoonacularService.js";

export default {
  name: "Spoonacular-Service",
  data() {
    return {
      info: "",
      search: "",
      typeKeyword: "",
      results: "",
      typeResults: "",
      resultArr: [
        {
          title: "Chocolate Cookies",
          image:"https://www.snixykitchen.com/wp-content/uploads/2020/02/Gluten-Free-Chocolate-Cookies-9-1024x1536.jpg",
          
        },

        {
            title: "Tuna Noodle Casserole",
            image: "https://www.kyleecooks.com/wp-content/uploads/2018/01/Classic-Tuna-Noodle-Casserole-7a.jpg"
        },

        {
              title: "fragrant Somali Rice ",
              image: "http://xawaash.com/wp-content/uploads/2013/01/Somali-Rice-Pilaf-10.jpg"
        },

        {
              title: "Stuffed Eggs ",
              image: "http://xawaash.com/wp-content/uploads/2013/11/Nafaqo-21-Somali-Food-Blog.jpg"
        },

        {
              title: "Braised Lamb Shank ",
              image: "https://images.forwardcdn.com/image/720x/center/images/cropped/w-lambshank-1483637076.jpg"
      },
      {
            title: "Sweet Potato Pancake ",
            image: "https://tupelohoneycafe.com/wp-content/uploads/2017/03/Shoo-Mercy-Sweet-Potato-Pancake-1-e1490207057991.jpg"
      }
      ],
    };
  },
  methods: {
    getData() {
      SpoonacularService.retrieveSpoonacularData().then((response) => {
        this.info = response.data;
      });
    },

    getRecipeList() {
      if (this.search != "" && this.typeKeyword != "") {
        SpoonacularService.retrieveRecipesByNameAndCategory(
          this.search,
          this.typeKeyword
        ).then((response) => {
          this.results = response.data;
          this.resultArr = this.results.results;
          this.search = "";
          this.typeKeyword = "";
        });
      } else if (this.search != "") {
        SpoonacularService.retrieveSpoonacularSearch(this.search).then(
          (response) => {
            this.results = response.data;
            this.resultArr = this.results.results;
            this.search = "";
          }
        );
      } else {
        SpoonacularService.retrieveSearchByType(this.typeKeyword).then(
          (response) => {
            this.results = response.data;
            this.resultArr = this.results.results;
            this.typeKeyword = "";
          }
        );
      }
      
      this.resultArr = [];
    },
  },
};
</script>

<style scoped>

.spoon-body {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.spoon-header {
  margin: 400px 0 0 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.search-recipes {
  margin-top: -300px;
  font-size: 40px;
  color: gray;
  text-align: center;
}

.recipe-name, .recipe-category {
  color: gray;
  
}

.popular {
  text-align: center;
  margin-top: 10px;
  color: gray;
  margin-bottom: 30px;
}

.search-field {
  outline: 0;
  border-radius: 5px;
  background: #f2f2f2;
  border: 0;
  margin: 20px 15px 10px 15px;
  padding: 15px;
  font-size: 14px;
}

.search-field:hover {
  background-color: plum;
  transition: all 1s ease 0s;
  
}

.name {
  width: 300px;
  
}

.category {
  width: 300px;
}

#submitSearch {
  outline: 0;
  text-transform: uppercase;
  font-weight: bold;
  outline: 0;
  border-radius: 5px;
  background: purple;
  border: 0;
  padding: 15px;
  color: #fff;
  font-size: 14px;
  margin-bottom: 10px;
}

#submitSearch:hover, #submitSearch:active, #submitSearch:focus {
  background-color: gray;
  transition: all .5s ease 0s;
  cursor: pointer;
  color: white;
}

.recipe-details {
  text-decoration: none;
  color: gray;
  font-size: 14px;
}

.recipe-details:hover {
  color: black;
}

.cards {
  margin: 0 auto;
  max-width: auto;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  text-align: center;
}

#spoonacular-image {
  width:100%;
  height:300px;
  object-fit:cover;
  object-position:50% 50%;
  border-radius: 10px;
  box-shadow: 0 0 20px 0 rgba(0,0,0,0.2), 0 5px 5px 0 rgba(0,0,0,0.24);
}

.links {
text-transform: capitalize;
}

</style>