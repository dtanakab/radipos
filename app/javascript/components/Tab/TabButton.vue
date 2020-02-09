<template>
  <div class="tab_area">
    <div class="tabs">
      <div
        class="unselected"
        v-bind:class="{ selected: isActive == '0' }"
        v-on:click="displayItem(0)"
      >
        <img src="/assets/user_icon" />
      </div>
      <div
        class="unselected"
        v-bind:class="{ selected: isActive == '1' }"
        v-on:click="displayItem(1)"
      >
        <img src="/assets/blank_star_icon" />
      </div>
      <div
        class="unselected"
        v-bind:class="{ selected: isActive == '2' }"
        v-on:click="displayItem(2)"
      >
        <img src="/assets/mail_icon" />
      </div>
    </div>
    <div class="page">
      <div class="myprofile" v-if="isActive == '0'">
        <h2>プロフィール</h2>
      </div>
      <div class="mylist" v-else-if="isActive == '1'">
        <h2>マイリスト</h2>
      </div>
      <div class="mypost" v-else-if="isActive == '2'">
        <h2>過去の投稿</h2>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isActive: "0"
    };
  },
  methods: {
    displayItem: function(num) {
      this.isActive = num;
    }
  }
};
</script>
