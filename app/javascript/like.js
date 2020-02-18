import Vue from 'vue/dist/vue.esm'
import LikeButton from './components/Like/LikeButton.vue'

document.addEventListener('DOMContentLoaded', () => {
  // eslint-disable-next-line no-new
  new Vue({
    el: '#like',
    components: { LikeButton }
  })
})
