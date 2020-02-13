<template>
  <div class="star" v-if="isLiked" v-on:click="deleteLike()">
    <img src="/star.png" />マイリストから削除
  </div>
  <div class="star" v-else v-on:click="registerLike()">
    <img src="/blank_star.png" />マイリストに追加
  </div>
</template>

<script>
import axios from "axios";
import { csrfToken } from "rails-ujs";
axios.defaults.headers.common["X-CSRF-TOKEN"] = csrfToken();

export default {
  props: ["userId", "programId"],
  data() {
    return {
      likeList: []
    };
  },
  computed: {
    isLiked() {
      if (this.likeList.length === 0) {
        return false;
      }
      return Boolean(this.findLikeId());
    }
  },
  created: function() {
    this.fetchLikeByProgramId().then(result => {
      this.likeList = result;
    });
  },
  methods: {
    fetchLikeByProgramId: async function() {
      const res = await axios.get(`/api/likes/?program_id=${this.programId}`);
      if (res.status !== 200) {
        process.exit();
      }
      return res.data;
    },
    registerLike: async function() {
      const res = await axios.post(`/api/likes`, {
        program_id: this.programId
      });
      if (res.status !== 201) {
        process.exit();
      }
      this.fetchLikeByProgramId().then(result => {
        this.likeList = result;
      });
    },
    deleteLike: async function() {
      const likeId = this.findLikeId();
      const res = await axios.delete(`/api/likes/${likeId}`);
      if (res.status !== 200) {
        process.exit();
      }
      this.likeList = this.likeList.filter(n => n.id !== likeId);
    },
    findLikeId: function() {
      const like = this.likeList.find(like => {
        return like.user_id === this.userId;
      });
      if (like) {
        return like.id;
      }
    }
  }
};
</script>
