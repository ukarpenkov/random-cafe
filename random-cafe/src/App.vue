<script>
import axios from "axios";
import { reactive } from "vue";

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
  <a-divider orientation="left">Vertical</a-divider>
  <a-row :gutter="[16, 24]">
    <a-col class="gutter-row" v-for="restaurant in restaurants" :span="6">
      <div class="gutter-box">
        <a-card hoverable>
          <template #cover>
            <img v-if="restaurant.photo !== ''" alt="example" :src="restaurant.photo" />
            <img
              v-else="restaurant.photo === ''"
              alt="example"
              src="https://os.alipayobjects.com/rmsportal/QBnOOoLaAfKPirc.png"
            />
          </template>
          <a-card-meta :title="restaurant.name">
            <template #description>
              <div>{{ restaurant.name }}</div>
              <div>{{ restaurant.cuisine }}</div>
              <div>{{ restaurant.distance }}</div>
            </template>
          </a-card-meta>
        </a-card>
      </div>
    </a-col>
  </a-row>
</template>

<style scoped>
.gutter-box {
  padding: 8px 0;
  margin: 5px;
}
</style>
