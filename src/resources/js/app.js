require('./bootstrap');

import { createApp } from 'vue'
import HelloVue from './components/Hello.vue';

const app = createApp({})
app.component('hello-vue', HelloVue);
app.mount('#app')