<template>

  <div class="glass">
      <p v-bind="getMyMeals()">meals</p>
      <p>{{meals}}</p>
            <!-- <div class="dashboard">
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
            </div> -->
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

</style>