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
  compatConfig: { MODE: 3 },
};
</script>

<template>
  <div>
    <b-button>Button</b-button>
    <b-button variant="danger">Button</b-button>
    <b-button variant="success">Button</b-button>
    <b-button variant="outline-primary">Button</b-button>
  </div>
</template>

<style></style>
