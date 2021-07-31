import axios from 'axios';

const apiKey = 'da891960fefb4849b98f5e385a24d066';

export default {
    retreiveSpoonacularData() {
        return axios.get('https://api.spoonacular.com/food/products/search?query=yogurt&apiKey=' + apiKey);
    }
}