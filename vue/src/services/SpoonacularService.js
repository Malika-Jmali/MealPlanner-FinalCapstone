import axios from 'axios';

//const apiKey = 'da891960fefb4849b98f5e385a24d066';
const apiKey = '6f73ed0c202042c2972dfed9523c4558';


export default {
    retrieveSpoonacularData() {
        return axios.get('https://api.spoonacular.com/recipes/random/?apiKey='+ apiKey);
    },
    retrieveSpoonacularSearch(search) {
        return axios.get('https://api.spoonacular.com/recipes/complexSearch/?apiKey=' + apiKey + '&query='+ search);
    },
    retrieveSearchByType(search) {
        return axios.get('https://api.spoonacular.com/recipes/complexSearch/?apiKey=' + apiKey + '&type='+ search);
    },
    retrieveRecipesByNameAndCategory(search1, search2) {
        return axios.get('https://api.spoonacular.com/recipes/complexSearch/?apiKey=' + apiKey + '&query='+ search1 + '&type=' + search2);
    },
    
}

//https://api.spoonacular.com/recipes/random/?apiKey=da891960fefb4849b98f5e385a24d066


//https://api.spoonacular.com/recipes/complexSearch/?apiKey=da891960fefb4849b98f5e385a24d066&?query=

//https://api.spoonacular.com/recipes/findByIngredients/?apiKey=da891960fefb4849b98f5e385a24d066&ingredients=chicken