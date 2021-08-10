<template>
  <div>
    <user-profile/>
    <mypage-tabs/>
  </div>
</template>

<script>
import UserProfile from '~/components/mypage/UserProfile.vue'
import MypageTabs from '~/components/mypage/MypageTabs.vue'

export default {
  components: {
    UserProfile,
    MypageTabs
  }
}
</script>