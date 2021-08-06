<template>

  <div class="glass">
      <p v-bind="getMyMeals()">meals</p>
      <p>{{meals}}</p>
            <div class="dashboard">
                <div class="user">
                    <h2>Your Meal Plans</h2>
                    <div class="links">
                        <div class="link">
                            <a href="#">Vegetarian</a>
                        </div>
                        <div class="link">
                            <a href="#">Keto</a>
                        </div>
                        <div class="link">
                            <a href="#">Mediterranean</a>
                        </div>
                    </div>
                    <a href="#" class="search-btn">Search Recipes</a>  
                </div>
            </div>
            
            <div class="meal-plans">
                <div class="plan-view">
                    <h1>Vegetarian</h1>
                </div>
                <div class="cards">
                    <div class="meal-card">
                        <div class="meal-info">
                            <h2>Breakfast</h2>
                            <a href="#">Tofu Scramble</a>
                        </div>
                    </div>
                    <div class="meal-card">
                        <div class="meal-info">
                            <h2>Lunch</h2>
                            <a href="#">Roasted Beet Salad</a>
                        </div>
                    </div>
                    <div class="meal-card">
                        <div class="meal-info">
                            <h2>Dinner</h2>
                            <a href="#">Eggplant Pizza</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</template>

<script>

import MealService from '../services/MealService';

export default {
name: "user-meals",
data() {
    return {
    meals: "",
    }
    },
    methods: {
        getMyMeals() {
            MealService.getMeals().then((response) => {
                this.meals = response.data;
            })
        }
    },
}


</script>
<style  scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;900&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins';
    
}

main {
    min-height: 100vh;
    background: url('/assets/ella-olsson-sosOqjx31Go-unsplash.jpg');
    display: flex;
    align-items: center;
    justify-content: center;
    background-size: contain;
}

.glass {
    background: #fff;
    min-height: 80vh;
    width: 90%;
    background: linear-gradient(to right bottom, rgba(255, 255, 255, 0.7), rgba(226, 226, 226, 0.3));
    border-radius: 2rem;
    backdrop-filter: blur(10rem);
    display: flex;
    border: 1px solid rgba(171, 161, 164, 1);
}

.dashboard {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-evenly;
    text-align: center;
    background: linear-gradient(to right bottom, rgba(255, 255, 255, 0.7), rgba(226, 226, 226, 0.3));
    border-radius: 2rem;  
}

.link {
    display: flex;
    margin: 2rem 0rem;
    padding: 1rem 5rem;
    align-items: center;
    
}

.link a, h1, h2{
    padding: 0rem 2rem;
    text-decoration: none;
    color: rgba(171, 161, 164, 1);
    text-transform: uppercase;
    font-weight: bold;
}

.link a:hover {
    color: #000;
    
}

.meal-plans {
    flex: 2;
}

.search-btn {
    color:#fff;
    background: #ABA1A4;
    text-decoration: none;
    font-weight: 700;
    letter-spacing: 2px;
    border-radius: 5px;
    padding: 10px 20px;
    justify-content: center;
    transition: 0.3s;
    transition-property: background;
}

.search-btn:hover{
    background-color: #000;
}

.meal-info a{
    text-decoration: none;
    color: #ABA1A4;
}

.meal-info a:hover {
    color: #000;
}

.meal-info {
    margin: 5rem;
}

</style>