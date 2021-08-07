<template>
  <div class = "body">
    <!--  when we search for a recipe we get the recipe id so we can use that to access the recipe's details and show them
          on a "new" page (a new route) 
          -->
        <div class="header">
          <div class = "form">
    <h1>Search Our Recipes for FREE</h1>
    <!-- <button v-on:click="getData">Click Here For A Recipe!</button> -->

      <label for="recipe">Search Recipes By Name:</label>
      <input type="text" name="recipe" class="search-field name" v-model="search" />

      <label for="recipe">Search Recipes By Category:</label>
      <input type="text" name="recipe" class="search-field category" v-model="typeKeyword" />
      <button id="submitSearch" v-on:click="getRecipeList" button type="submit">Search</button>
      </div>
    </div>
    
    <div class="cards">
    <div v-for="result in resultArr" v-bind:key="result.id">
    <p class = "links"><router-link v-bind:to="{ name: 'recipeDetails', params:{id: result.id}}"> {{ result.title }} </router-link></p>
      <img v-bind:src="result.image" alt="food image" />
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
      resultArr: [],
      categories: [
        "main course",
        "side dish",
        "dessert",
        "appetizer",
        "salad",
        "bread",
        "breakfast",
        "soup",
        "beverage",
        "sauce",
        "marinade",
        "fingerfood",
        "snack",
        "drink",
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

.body {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.header {
  margin: 400px 0 0 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

h1 {
  margin-top: -300px;
  font-size: 40px;
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
  background-color:#fcbaf3;
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
  background: gray;
  border: 0;
  padding: 15px;
  color: #fff;
  font-size: 14px;
  margin-bottom: 10px;
}

#submitSearch:hover, #submitSearch:active, #submitSearch:focus {
  background-color: #000;
  transition: all 1s ease 0s;
  cursor: pointer;
}

a {
  text-decoration: none;
  color: gray;
}

a:hover {
  color: black;
}

.cards {
  margin: 0 auto;
  max-width: 1000px;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  
}

.links {
text-transform: capitalize;
}

</style>