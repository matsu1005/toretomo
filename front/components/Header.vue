<template>
  <v-app-bar color="#445CB0" dark app fixed>
    <v-toolbar-title>
      <nuxt-link to="/" class="header-link">
        <h2 class="app-title" style="color: white">toretomo</h2>
      </nuxt-link>
    </v-toolbar-title>
    <v-spacer />
    <v-btn color="#445CB0" class="header-link" @click="aboutDialog = true">
      <span>toretomoについて</span>
    </v-btn>
    <v-btn
      v-if="$auth.loggedIn"
      :to="{ path: `/users/${currentUser.id}` }"
      class="header-link"
      plain
    >
      <span>マイページ</span>
    </v-btn>
    <template v-if="!$auth.loggedIn">
      <v-btn
        color="primary"
        to="/"
        class="header-link"
        plain
        @click.stop="loginDialog(true)"
      >
        <span style="color: white">login</span>
      </v-btn>
      <v-dialog v-model="loginModal" max-width="600px" persistent>
        <user-login />
      </v-dialog>
    </template>

    <template v-if="!$auth.loggedIn">
      <v-btn
        color="primary"
        to="/"
        class="header-link"
        plain
        @click.stop="signUpDialog(true)"
      >
        <span style="color: white">signup</span>
      </v-btn>
      <v-dialog v-model="signUpModal" max-width="600px" persistent>
        <user-signup />
      </v-dialog>
    </template>

    <template v-if="$auth.loggedIn">
      <v-btn
        color="primary"
        to="/"
        class="header-link"
        plain
        @click="$auth.logout(), logoutUser()"
      >
        <span style="color: white">logout</span>
      </v-btn>
      <about-dialog v-if="aboutDialog" @close="closeDialog" />
    </template>
  </v-app-bar>
</template>

<script>
import { mapGetters, mapActions } from "vuex"

import UserLogin from "~/components/UserLogin.vue"
import UserSignup from "~/components/UserSignup.vue"
import AboutDialog from "~/components/AboutDialog.vue"

export default {
  components: {
    UserLogin,
    UserSignup,
    AboutDialog,
  },
  data() {
    return {
      aboutDialog: false,
    }
  },
  computed: {
    ...mapGetters({
      loginModal: "modal/loginModal",
      signUpModal: "modal/signUpModal",
      currentUser: "currentUser/user",
    }),
  },
  methods: {
    ...mapActions({
      loginDialog: "modal/loginUser",
      signUpDialog: "modal/signUpUser",
      flashMessage: "flashMessage/showMessage",
      clearCurrentUser: "currentUser/clearCurrentUser",
    }),
    logoutUser() {
      this.flashMessage({
        message: "ログアウトしました",
        type: "orange",
        status: true,
      })
      this.clearCurrentUser()
    },
    closeDialog() {
      this.aboutDialog = false
    },
  },
}
</script>

<style lang="scss">
.header-link {
  font-size: 24px;
  text-decoration: none;
  margin: 5px;
  background-color: #445cb0;
}

.v-application a {
  color: white;
}
</style>
