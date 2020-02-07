import Vue from "vue";

// 作成したコンポーネントファイルをimportします
import LikeButton from "../components/Like/LikeButton.vue";

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#like",
    components: { LikeButton }
  });
});
