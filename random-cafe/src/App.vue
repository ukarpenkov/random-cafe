<script>
import axios from "axios";

export default {
  data() {
    return {
      restaurants: [],
    };
  },
  methods: {
    async fetchRestaurant() {
      try {
        const response = await axios.get(`https://bandaumnikov.ru/api/test/site/get-index`);
        this.restaurants = response.data.data;
      } catch (e) {
        console.log(e);
      }
    },
  },
  mounted() {
    this.fetchRestaurant();
  },
};
</script>

<template>
  <div v-if="restaurants" v-for="restaurant in restaurants">{{ restaurant.name }}</div>
</template>

<style></style>
