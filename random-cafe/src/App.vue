<script>
import axios from "axios";
import CafeCard from "./components/CafeCard.vue";
import { ref } from "vue";

export default {
  data() {
    return {
      modal2Visible: ref(false),
      restaurants: [],
    };
  },
  methods: {
    collaplsePage() {
      console.log("Hi");
    },
    setModalVisible(open) {
      this.modal2Visible.value = open;
    },
    async fetchRestaurant() {
      try {
        const response = await axios.get(`https://bandaumnikov.ru/api/test/site/get-index`);
        this.restaurants = response.data.data;
      } catch (e) {
        console.log(e);
        console.log("t11t");
      }
    },
  },
  mounted() {
    this.fetchRestaurant();
  },
  components: { CafeCard },
};
</script>

<template>
  <a-divider orientation="left">Vertical</a-divider>
  <CafeCard />
  <div id="components-modal-demo-position">
    <a-button type="primary" shape="circle" class="search-btn" @click="modal2Visible = true">
      <span class="material-symbols-outlined dice"> casino </span>
    </a-button>
    <a-modal
      v-model:open="modal2Visible"
      title="Vertically centered modal dialog"
      centered
      :footer="null"
      width="1500px"
      @ok="modal2Visible = false"
    >
      <div class="random">
        <div class="result"></div>
        <div class="cards" v-for="restaurant in restaurants">
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
                src="./images/default-cafe.jpg"
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
      </div>
    </a-modal>
  </div>
</template>

<style scoped>
.search-btn {
  display: grid;
  width: 100px;
  height: 100px;
  position: fixed;
  right: 3em;
  bottom: 3em;
  z-index: 2;
  align-items: center;
  justify-items: center;
  transform: rotate(0deg);
  transition: all 1s;
}
.dice {
  transform: scale(2);
}
.search-btn:hover {
  transform: rotate(360deg);
  transition: all 1.5s;
}
</style>
