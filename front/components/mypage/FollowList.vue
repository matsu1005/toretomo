<template>
  <v-list three-line style="padding: 0px">
    <template>
      <v-list-item v-for="user in users" :key="user.id">
        <nuxt-link
          style="text-decoration: none"
          :to="{ path: `/users/${user.id}` }"
        >
          <v-list-item-avatar color="#445CB0">
            <v-img v-if="user.icon.url" :src="user.icon.url"></v-img>
            <v-icon v-else size="25" dark> mdi-account-circle </v-icon>
          </v-list-item-avatar>
        </nuxt-link>

        <v-list-item-content>
          <v-list-item-title v-html="user.name"></v-list-item-title>
          <v-list-item-subtitle
            v-if="user.profile !== 'null' && user.profile"
            class="pr-5"
          >
            {{ user.profile | omittedText }}
          </v-list-item-subtitle>
          <v-list-item-subtitle v-else class="pr-5">
            未設定
          </v-list-item-subtitle>
        </v-list-item-content>
        <follow-btn v-if="route_id == currentUser.id" :user="user" />
      </v-list-item>
    </template>
  </v-list>
</template>

<script>
import { mapGetters } from "vuex"
import FollowBtn from "~/components/mypage/FollowBtn.vue"

export default {
  components: {
    FollowBtn,
  },
  props: {
    users: {
      type: Array,
      default: () => [],
      required: true,
    },
  },
  data() {
    return {
      route_id: this.$route.params.id,
    }
  },
  computed: {
    ...mapGetters({
      currentUser: "currentUser/user",
    }),
  },
  filters: {
    omittedText(text) {
      return text.length > 300 ? text.slice(0, 300) + "..." : text
    },
  },
}
</script>
