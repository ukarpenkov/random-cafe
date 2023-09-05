<script>
import axios from "axios";
import CafeCard from "./components/CafeCard.vue";
import { ref } from "vue";

export default {
  data() {
    return {
      modal2Visible: ref(false),
    };
  },
  methods: {
    collaplsePage() {
      console.log("Hi");
    },
    setModalVisible(open) {
      this.modal2Visible.value = open;
    },
  },
  components: { CafeCard },
};
</script>

<template>
  <a-divider orientation="left">Vertical</a-divider>
  <CafeCard />
  <div id="components-modal-demo-position">
    <a-button type="primary" shape="circle" class="search-btn" @click="setModalVisible(true)">
      <span class="material-symbols-outlined dice"> casino </span>
    </a-button>
    <a-modal
      v-model:open="modal2Visible"
      title="Vertically centered modal dialog"
      centered
      @ok="modal2Visible = false"
    >
      <p>some contents...</p>
      <p>some contents...</p>
      <p>some contents...</p>
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
