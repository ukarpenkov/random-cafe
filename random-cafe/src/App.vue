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
            <img
              v-if="restaurant.photo !== ''"
              alt="example"
              :src="restaurant.photo"
              :height="300"
            />
            <img
              v-else="restaurant.photo === ''"
              alt="example"
              src="https://os.alipayobjects.com/rmsportal/QBnOOoLaAfKPirc.png"
              :height="300"
            />
          </template>
          <a-card-meta :title="restaurant.name">
            <template #description>
              <div v-if="restaurant.cuisine !== ''">
                <span class="card-attribute">Кухня:</span> {{ restaurant.cuisine }}
              </div>
              <div v-if="restaurant.address !== ''">
                <span class="card-attribute">Адрес:</span> {{ restaurant.address }}
              </div>
              <div v-if="restaurant.landmark !== ''">
                <span class="card-attribute">Ориентир:</span> {{ restaurant.landmark }}
              </div>
              <div v-if="restaurant.distance > 0">
                <span class="card-attribute">Расстояние:</span> {{ restaurant.distance }} метров
              </div>
              <div v-if="restaurant.time > 0">
                <span class="card-attribute">Время до места:</span> {{ restaurant.time }} минут
              </div>
              <a-tag color="purple" v-if="restaurant.business_lunch === true">
                Бизнес ланч:
                {{ restaurant.price }}₽
              </a-tag>
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

.card-attribute {
  font-weight: bold;
}
</style>
