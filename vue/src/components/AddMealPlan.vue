<template>
    <form>
    <div class="form-element">
        <label for="category">Name Your New Meal Plan:</label>
        <input id="category" type="text"/>
    </div>
    <div class="form-element">
        <label for="breakfast">Breakfast:</label>
        <select id="breakfast">
            <option value="1">Breakfast Vegetable Scramble</option>
            <option value="2">Garden Fresh Flatbread</option>
            <option value="3">Sesame Garlic Ramen Noodles</option>
            <option value="4">Vegetarian stew</option>
            <option value="5">Baked Fish with Garlic and Basil</option>
            <option value="6">Shakshuka</option>
            <option value="7">Baked Fish with Garlic and Basil</option>
            <option value="8">Mediterranean Lentil Salad Recipe</option>
            <option value="9">Keto taco meatza</option>
            <option value="10">Keto chicken zoodle al limone</option>
        </select>
    </div>
      <div class="form-element">
        <label for="lunch">Lunch:</label>
        <select id="lunch">
            <option value="1">Breakfast Vegetable Scramble</option>
            <option value="2">Garden Fresh Flatbread</option>
            <option value="3">Sesame Garlic Ramen Noodles</option>
            <option value="4">Vegetarian stew</option>
            <option value="5">Baked Fish with Garlic and Basil</option>
            <option value="6">Shakshuka</option>
            <option value="7">Baked Fish with Garlic and Basil</option>
            <option value="8">Mediterranean Lentil Salad Recipe</option>
            <option value="9">Keto taco meatza</option>
            <option value="10">Keto chicken zoodle al limone</option>
        </select>
    </div>
      <div class="form-element">
        <label for="dinner">Dinner:</label>
        <select id="dinner">
            <option value="1">Breakfast Vegetable Scramble</option>
            <option value="2">Garden Fresh Flatbread</option>
            <option value="3">Sesame Garlic Ramen Noodles</option>
            <option value="4">Vegetarian stew</option>
            <option value="5">Baked Fish with Garlic and Basil</option>
            <option value="6">Shakshuka</option>
            <option value="7">Baked Fish with Garlic and Basil</option>
            <option value="8">Mediterranean Lentil Salad Recipe</option>
            <option value="9">Keto taco meatza</option>
            <option value="10">Keto chicken zoodle al limone</option>
        </select>
    </div>
   
    <input type="submit" value="Save">
    <input type="button" value="Cancel">
</form>
    

</template>




<script>
export default {
    name: 'add-meal-plan'
}
</script>

<style>

.form-element {

margin-top: 200px;

}

</style>