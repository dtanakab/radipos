<template>
  <div class="tabs">
    <div v-bind:class="isSelected[0]" v-on:click="displayItem(0)">
      <img src="/assets/user_icon" />
    </div>
    <div v-bind:class="isSelected[1]" v-on:click="displayItem(1)">
      <img src="/assets/blank_star_icon" />
    </div>
    <div v-bind:class="isSelected[2]" v-on:click="displayItem(2)">
      <img src="/assets/mail_icon" />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tab: ["selected", "unselected", "unselected"]
    };
  },
  computed: {
    isSelected() {
      return this.tab;
    }
  },
  methods: {
    displayItem: function(num) {
      this.tab = ["unselected", "unselected", "unselected"];
      this.tab[num] = "selected";
    }
  }
};
</script>
