<script>
import axios from "axios";
import { ref } from "vue";

// var cards_block = document.querySelector(".cards");
// var cards = document.querySelectorAll(".cards > div");

export default {
  data() {
    return {
      modal2Visible: ref(false),
    };
  },
  methods: {
    setModalVisible(open) {
      this.modal2Visible.value = open;
    },
    async fetchRestaurant() {
      try {
        const response = await axios.get(`https://bandaumnikov.ru/api/test/site/get-index`);
        this.restaurants = response.data.data;
      } catch (e) {
        console.log(e);
      }
    },
    start() {
      console.log(this.$refs.cardsBlock);
      var random = Math.floor(Math.random() * 22); // От 0 до 8
      this.$refs.cardsBlock.style.left = -random * 100 + "px";
      // setTimeout(function () {
      //   random++;
      //   this.$refs.cards[random].style.background = "#7B90F7";
      //   this.$refs.cards[random].style.color = "white";
      // }, 5000);
    },
  },
  mounted() {
    this.fetchRestaurant();
  },
};
</script>

<template>
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
      <div class="shadow"></div>
      <div class="random">
        <div ref="cardsBlock">
          <div class="cards" v-for="restaurant in restaurants">
            <a-card hoverable style="width: 240px">
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
                  src="./../images/default-cafe.jpg"
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
      </div>
      <button @click="start()">GHBB</button>
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

.random {
  display: flex;
  overflow: auto;
  width: 1200px;
}

.cards {
  height: 100%;
  transition: 5s ease;
}

:where(.css-dev-only-do-not-override-1ugq3w3).ant-modal .ant-modal-body {
  display: grid;
  justify-items: center;
}

.shadow {
  position: absolute;
  z-index: 2;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  border-radius: 10px;
  border: 2px solid white;
  width: 400px;
  height: 100px;
  box-shadow: inset 0px 0px 20px 0px black;
}

.random {
  position: absolute;
  overflow: hidden;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  border-radius: 10px;
  width: 400px;
  height: 100px;
  background: #161d31;
}

.cards {
  position: absolute;
  left: 0;
  top: 0;
  width: 2000px;
  height: 100%;
  transition: 5s ease;
}

.cards {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  float: left;
  font-family: sans-serif;
  font-weight: bold;
  font-size: 20px;
  margin-top: 5px;
  margin-left: 5px;
  width: 100px;
  height: 90px;
  color: #6a6a6a;
  background: white;
  border-radius: 10px;
}

.result {
  position: absolute;
  z-index: 10;
  left: 50%;
  top: 0;
  transform: translateX(-50%);
  border: 10px solid transparent;
  border-top: 20px solid #425dd8;
  filter: drop-shadow(1px 1px 1px rgba(0, 0, 0, 0.5));
}
</style>
