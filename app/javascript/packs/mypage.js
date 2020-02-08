import Vue from "vue";

import TabButton from "../components/Tab/TabButton.vue";

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#tab",
    components: { TabButton }
  });
});
