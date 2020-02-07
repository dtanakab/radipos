<template>
  <div class="star" v-if="isLiked" v-on:click="deleteLike()">
    <img src="/assets/star" />マイリストから削除
  </div>
  <div class="star" v-else v-on:click="registerLike()">
    <img src="/assets/blank_star" />マイリストに追加
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
      likeList: [] // いいね一覧を格納するための変数　{ id: 1, user_id: 1, program_id: 1 } がArrayで入る
    };
  },
  // 算出プロパティ ここではlikeListが変更される度に、isLiked が再構築される
  computed: {
    // ログインユーザが既にいいねしているかを判定する
    isLiked() {
      if (this.likeList.length === 0) {
        return false;
      }
      return Boolean(this.findLikeId());
    }
  },
  // Vueインスタンスの作成・初期化直後に実行される
  created: function() {
    this.fetchLikeByProgramId().then(result => {
      this.likeList = result;
    });
  },
  methods: {
    // rails側のindexアクションにリクエストするメソッド
    fetchLikeByProgramId: async function() {
      const res = await axios.get(`/api/likes/?program_id=${this.programId}`);
      if (res.status !== 200) {
        process.exit();
      }
      return res.data;
    },
    // rails側のcreateアクションにリクエストするメソッド
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
    // rails側のdestroyアクションにリクエストするメソッド
    deleteLike: async function() {
      const likeId = this.findLikeId();
      const res = await axios.delete(`/api/likes/${likeId}`);
      if (res.status !== 200) {
        process.exit();
      }
      this.likeList = this.likeList.filter(n => n.id !== likeId);
    },
    // ログインユーザがいいねしているlikeモデルのidを返す
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
