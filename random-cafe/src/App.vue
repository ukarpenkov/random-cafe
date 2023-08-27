<script setup>
import axios from "axios";
import { reactive } from "vue";
const state = reactive({
  checked1: true,
  checked2: false,
  checked3: false,
});
// export default {
//   data() {
//     return {
//       restaurants: [],
//     };
//   },
//   methods: {
//     async fetchRestaurant() {
//       try {
//         const response = await axios.get(`https://bandaumnikov.ru/api/test/site/get-index`);
//         this.restaurants = response.data.data;
//       } catch (e) {
//         console.log(e);
//       }
//     },
//   },
//   mounted() {
//     this.fetchRestaurant();
//   },
// };
</script>

<template>
  <a-space direction="vertical">
    <a-switch v-model:checked="state.checked1" checked-children="开" un-checked-children="关" />
    <a-switch v-model:checked="state.checked2" checked-children="1" un-checked-children="0" />
    <a-switch v-model:checked="state.checked3">
      <template #checkedChildren><check-outlined /></template>
      <template #unCheckedChildren><close-outlined /></template>
    </a-switch>
  </a-space>
</template>

<style></style>
