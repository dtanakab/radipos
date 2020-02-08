<template>
  <div class="pages">
    <div class="page" v-if=""
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
