<template>
  <div>
    <user-profile :user="user"/>
    <mypage-tabs :user="user"/>
  </div>
</template>

<script>
import { mapActions, mapGetters} from 'vuex'

import UserProfile from '~/components/mypage/UserProfile.vue'
import MypageTabs from '~/components/mypage/MypageTabs.vue'

export default {
  components: {
    UserProfile,
    MypageTabs
  },
  computed: {
    ...mapGetters({
      user: "user/user",
      currentUser: "currentUser/user",
    }),
  },
  methods: {
    ...mapActions ({
      setUser: "user/setUser"
    })
  },
  created() {
    this.setUser(this.$route.params.id)
  }

}
</script>