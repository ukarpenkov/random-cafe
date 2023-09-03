import { createApp } from 'vue';
import Antd from 'ant-design-vue';
import App from './App';
import CafeCard from './components/CafeCard.vue'

import 'ant-design-vue/dist/reset.css';
import 'material-icons/iconfont/material-icons.css';


const app = createApp(App);

app.component('CafeCard', CafeCard)

app.use(Antd).mount('#app');