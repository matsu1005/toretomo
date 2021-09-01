<template>
  <div v-if="user.id !== currentUser.id">
    <v-btn 
      v-if="isLiked"
      :disabled="!$auth.loggedIn"
      @click="userUnFollow()"
      small 
      color="primary"
      class="mb-3">
      フォロー中
    </v-btn>
    <v-btn 
      v-else 
      outlined 
      :disabled="!$auth.loggedIn"
      @click="userFollow()"
      small 
      class="mb-3">
      フォロー
    </v-btn>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
export default {
  props: {
    user: {
      type: Object,
      required: true,
    },
  },
  computed: {
    ...mapGetters({
      currentUser: 'currentUser/user',
    }),
    isLiked() {
      if (!this.currentUser) return false
      if (this.user.followers) {
        return this.user.followers.find(ele => ele.id === this.currentUser.id)
      }
    }
  },
  methods: {
    ...mapActions ({
      setUser: "user/setUser"
    }),
    async userFollow() {
      let formData = {
        user_id: this.currentUser.id,
        follow_id: this.user.id,
      }
      await this.$axios.post('/api/v1/relationships', formData)
        .then((response) => {
          this.$store.commit("flashMessage/setMessage", "ユーザーをフォローしました。", { root: true })
          this.$store.commit("flashMessage/setType", "success", { root: true })
          this.$store.commit("flashMessage/setStatus", true, { root: true })
          setTimeout(() => {
            this.$store.commit("flashMessage/setStatus", false, { root: true })
          }, 2000)
          this.setUser(this.$route.params.id)
        })
        .catch((error) => {
          console.log(error)
        })
    },
    async userUnFollow() {
      let formData = {
        user_id: this.currentUser.id,
        follow_id: this.user.id,
      }
      console.log(formData)
      await this.$axios.delete('/api/v1/relationships', {params: formData})
        .then((response) => {
          this.$store.commit("flashMessage/setMessage", "フォローを解除しました。", { root: true })
          this.$store.commit("flashMessage/setType", "orange", { root: true })
          this.$store.commit("flashMessage/setStatus", true, { root: true })
          setTimeout(() => {
            this.$store.commit("flashMessage/setStatus", false, { root: true })
          }, 2000)
          this.setUser(this.$route.params.id)
        })
        .catch((error) => {
          console.log(error)
        })
    },
  }
}
</script>