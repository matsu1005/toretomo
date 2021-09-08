<template>
  <v-carousel height="400" class="ma-5">
    <v-carousel-item
      v-for="(item, i) in items"
      :key="i"
      :src="item.src"
      reverse-transition="fade-transition"
      transition="fade-transition"
      style="position: relative"
    >
      <v-btn
        v-if="!$auth.loggedIn"
        x-large
        color="orange"
        class="kantan-login-btn"
        @click="kantanLogin()"
      >
        <v-icon> mdi-login </v-icon>
        簡単ログイン
      </v-btn>
    </v-carousel-item>
  </v-carousel>
</template>

<script>
import { mapActions } from "vuex"

export default {
  data() {
    return {
      items: [
        {
          src: require("@/assets/img/run.jpg"),
        },
        {
          src: require("@/assets/img/swim.jpg"),
        },
      ],
      guest: {
        email: "guest-user123@example.com",
        password: "guest_password",
      },
    }
  },
  methods: {
    ...mapActions({
      setCurrentUser: "currentUser/setCurrentUser",
    }),
    async kantanLogin() {
      await this.$auth
        .loginWith("local", {
          data: this.guest,
        })
        .then(
          (response) => {
            this.setCurrentUser(response.data.data)
            this.$store.dispatch("flashMessage/showMessage", {
              message: "ゲストとしてログインしました",
              type: "success",
              status: true,
            })
            return response
          },
          (error) => {
            return error
          }
        )
    },
  },
}
</script>

<style>
.kantan-login-btn {
  z-index: 1;
  width: 300px;
  font-weight: bold;
  position: absolute;
  top: 70%;
  left: 50%;
  transform: translate(-50%, -50%);
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
}
</style>
