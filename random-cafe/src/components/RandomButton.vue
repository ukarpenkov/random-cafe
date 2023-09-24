<script>
import axios from "axios";
import { ref } from "vue";

export default {
  data() {
    return {
      modal2Visible: ref(false),
    };
  },
  methods: {
    setModalVisible() {
      this.modal2Visible = true;
      setTimeout(() => {
        let cardsCount = this.$refs.card.length;
        let random = Math.floor(Math.random() * cardsCount);
        this.$refs.cards.style.left = -random * 252 + "px";
        setTimeout(() => {
          random++;
          this.$refs.card[random].style.background = "#7B90F7";
          this.$refs.card[random].style.color = "white";
        }, 2500);
      }, 300);
    },
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
  <div id="components-modal-demo-position">
    <a-button type="primary" shape="circle" class="search-btn" @click="setModalVisible()">
      <span class="material-symbols-outlined dice"> casino </span>
    </a-button>
    <a-modal
      v-model:open="modal2Visible"
      centered
      :footer="null"
      width="900px"
      @ok="modal2Visible = false"
    >
      <div class="shadow"></div>
      <div class="random">
        <div ref="cards" class="cards">
          <div ref="card" class="card" v-for="restaurant in restaurants">
            <div>
              <img
                v-if="restaurant.photo !== ''"
                alt="example"
                :src="restaurant.photo"
                class="card-image"
              />
              <img
                v-else="restaurant.photo === ''"
                alt="example"
                src="./../images/default-cafe.jpg"
                class="card-image"
              />
            </div>
            <div>{{ restaurant.name }}</div>
          </div>
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

.cards {
  height: 100%;
  transition: 2s ease;
}

.shadow {
  position: absolute;
  z-index: 2;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  border-radius: 10px;
  border: 2px solid white;
  width: 904px;
  height: 351px;
  box-shadow: inset 0px 0px 20px 0px black;
}

.random {
  display: flex;
  overflow: auto;
  width: 900px;
  position: absolute;
  overflow: hidden;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  border-radius: 10px;
  height: 345px;
  background: #161d31;
}

.cards {
  position: absolute;
  left: 0;
  top: 0;
  width: 1000%;
  height: 100%;
  transition: 5s ease;
}

.card-image {
  height: 250px;
  width: 250px;
}

.card {
  position: relative;
  justify-content: center;
  align-items: center;
  float: left;
  font-family: sans-serif;
  font-weight: bold;
  font-size: 20px;
  margin-top: 5px;
  margin-left: 5px;
  width: 250px;
  height: 335px;
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
