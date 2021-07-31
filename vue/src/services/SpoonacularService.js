import axios from 'axios';

const apiKey = 'da891960fefb4849b98f5e385a24d066';

export default {
    retrieveSpoonacularData() {
        return axios.get('https://api.spoonacular.com/recipes/complexSearch?api_key= '+ apiKey);
    }
}