<template>
    <div>
        <p>{{meal.breakfastRecipe.instructions}}</p>
        <p>{{meal.lunchRecipe.instructions}}</p>
        <p v-bind="showStuff()"></p>
    </div>
</template>



<script>

export default {
    name: "meal-plan-details",
    props: ["meal"],

    data() {
        return {
            
            showStuff() {
                console.log(this.meal);
            }
        }
    }
    
}
</script>