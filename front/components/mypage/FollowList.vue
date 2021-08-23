<template>
  <v-list three-line>
    <template v-for="(user, index) in users">
      <v-list-item
        :key="index"
      >
        <nuxt-link 
          style="text-decoration: none;" 
          :to="{ path: `/users/${user.id}` }">
          <v-list-item-avatar>
            <v-img :src="user.icon.url"></v-img>
          </v-list-item-avatar>
        </nuxt-link>

        <v-list-item-content>
          <v-list-item-title v-html="user.name"></v-list-item-title>
          <v-list-item-subtitle class="pr-5" v-if="user.profile!=='null'">
            {{user.profile | omittedText}}
          </v-list-item-subtitle>
          <v-list-item-subtitle class="pr-5" v-else>
            未設定
          </v-list-item-subtitle>
        </v-list-item-content>
        <follow-btn :user='user' v-if="route_id == currentUser.id"/> 
      </v-list-item>
    </template>
  </v-list>
</template>

<script>
import { mapGetters } from 'vuex'
import FollowBtn from '~/components/mypage/FollowBtn.vue'

export default {
  components: {
    FollowBtn
  },
  props: {
    users: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      route_id: this.$route.params.id
    }
  },
  computed: {
    ...mapGetters({
      currentUser: 'currentUser/user',
    })
  },
  filters: {
    omittedText(text) {
    return text.length > 300 ? text.slice(0, 300) + "..." : text;
    }
  },
}
</script>