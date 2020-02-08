import Vue from "vue";

import TabButton from "../components/Tab/TabPage.vue";

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "#page",
    components: { TabPage }
  });
});
