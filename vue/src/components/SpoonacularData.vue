<template>
  <div>
    <!--  {{info}} -->

      <button v-on:click="getData"> Click Here For A Recipe! </button>

  <!-- /*    <h2>{{info.title}}</h2>
      <p>
          <img v-bind:src="info.url" v-bind:alt="info.explanation" >
      </p> -->
      
  </div>
</template>

<script>

import SpoonacularService from '../services/SpoonacularService.js';

export default {
  name: 'SpoonacularService',
  data() {
      return {
          info: ''
      }
  },
  methods: {
      getData() {
           
        SpoonacularService.retrieveSpoonacularData().then(response => {

            this.info = response.data;
        })

      }
  }

}

</script>

<style>

</style>