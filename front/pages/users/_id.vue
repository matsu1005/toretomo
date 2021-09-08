<template>
  <div>
    <user-profile :user="user" />
    <mypage-tabs :user="user" />
  </div>
</template>

<script>
import { mapGetters } from "vuex"

import UserProfile from "~/components/mypage/UserProfile.vue"
import MypageTabs from "~/components/mypage/MypageTabs.vue"

export default {
  components: {
    UserProfile,
    MypageTabs,
  },
  computed: {
    ...mapGetters({
      user: "user/user",
      currentUser: "currentUser/user",
    }),
  },
  created() {
    this.$axios
      .get(`api/v1/users/${this.$route.params.id}`)
      .then((response) => {
        this.$store.commit("user/setUser", response.data, { root: true })
      })
  },
}
</script>
