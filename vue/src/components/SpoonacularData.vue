<template>
  <div>
    <!--  when we search for a recipe we get the recipe id so we can use that to access the recipe's details and show them
          on a "new" page (a new route) 
          -->

    <!-- <button v-on:click="getData">Click Here For A Recipe!</button> -->
    <div>
      <label for="recipe">Search for Recipes</label>
      <input type="text" name="recipe" v-model="search" />
       <label for="recipe">Search for Recipes By Category</label>
      <input type="text" name="recipe" v-model="typeKeyword" />

      <!-- <div>
        <label for="recipe">Select a Category</label>
        <select v-model="typeSearch">Choose a Category
          <option value="dessert">Dessert</option>
        </select>
      </div> -->

      <button id="submitSearch" v-on:click="getRecipeList">Search</button>
     
    </div>
    <!-- <div>
      <label for="recipe">Search for Recipes By Category</label>
      <input type="text" name="recipe" v-model="typeKeyword" />
      <button id="submitSearch" v-on:click="getRecipeByType">Search</button>
    </div> -->

    <div id="result-list" v-for="result in resultArr" v-bind:key="result.id">
    <p><router-link v-bind:to="{name: 'recipeDetails', params:{reci}}" >{{result.title}}</p>
    <img v-bind:src="result.image" alt="food image">
    </div>
    
    <div id="result-array" v-for="type in typeArry" v-bind:key="type.id">
    <p>{{type.title}}</p>
    <img v-bind:src="type.image" alt="food image">
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
      typeKeyword:"",
      results: "",
      typeResults: "",
      resultArr: [],
      typeArry: [],
      categories: ['main course', 'side dish', 'dessert', 'appetizer', 'salad', 'bread', 'breakfast', 'soup', 'beverage', 'sauce', 'marinade', 'fingerfood', 'snack', 'drink']
    };
  },
  methods: {
    getData() {
      SpoonacularService.retrieveSpoonacularData().then((response) => {
        this.info = response.data;
      });
    },
    
    getRecipeList() {
      if (this.search != "" && this.typeKeyword != ""){
        SpoonacularService.retrieveRecipesByNameAndCategory(this.search, this.typeKeyword).then((response) => {
          this.results = response.data;
          this.resultArr = this.results.results;
          this.search = "";
          this.typeKeyword= "";
          
        })
      }
      else if(this.search != ""){
        SpoonacularService.retrieveSpoonacularSearch(this.search).then(
        (response) => {
          this.results = response.data;
          this.resultArr = this.results.results;
          this.search = "";
          
          
        })
      }
      else {
        SpoonacularService.retrieveSearchByType(this.typeKeyword).then(
        (response) => {
          this.typeResults = response.data;
          this.typeArry = this.typeResults.results;
          this.typeKeyword= "";
         
        }
      );
      }
      this.typeArry= [];
      this.resultArr = [];
    },


  }
};
</script>

<style>
</style>