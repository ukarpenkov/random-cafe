<script>
import axios from "axios";
import CafeCard from "./components/CafeCard.vue";
import RandomButton from "./components/RandomButton.vue";
import { ref } from "vue";

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
  components: { CafeCard, RandomButton },
};
</script>

<template>
  <a-divider orientation="left">Vertical</a-divider>
  <CafeCard />
  <RandomButton />
</template>

<style scoped></style>
