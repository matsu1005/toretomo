<template>
  <v-app-bar
    color="#445CB0" 
    dark 
    app 
    fixed
  >
    <v-toolbar-title>
      <nuxt-link to="/" class="header-link">
        <h2 class="app-title">toretomo</h2>
      </nuxt-link>
    </v-toolbar-title>
    <v-spacer />
    <v-btn color="#445CB0" to="#" class="header-link">
      <span>toretomoについて</span>
    </v-btn>
    <v-btn v-if="$auth.loggedIn" :to="{ path: `/users/${currentUser.id}` }" class="header-link" plain>
      <span>マイページ</span>
    </v-btn>
    <template v-if="!$auth.loggedIn">
      <v-btn 
        color="primary"
        @click.stop="loginDialog(true)"
        to="/" 
        class="header-link" 
        plain>
        <span style="color:white;">login</span>
      </v-btn>
      <v-dialog
        v-model="loginModal"
        max-width="600px"
        persistent
      >
        <user-login/>
      </v-dialog>
    </template>

    <template v-if="!$auth.loggedIn">
      <v-btn 
        color="primary"
        @click.stop="signUpDialog(true)"
        to="/" 
        class="header-link" 
        plain>
        <span style="color:white;">signup</span>
      </v-btn>
      <v-dialog
        v-model="signUpModal"
        max-width="600px"
        persistent
      >
        <user-signup/>
      </v-dialog>
    </template>
    
    <template v-if="$auth.loggedIn">
      <v-btn
        color="primary"
        @click="$auth.logout(), logoutUser()"
        to="/" 
        class="header-link" 
        plain>
        <span style="color:white;">logout</span>
      </v-btn>
    </template>
  </v-app-bar>
</template>

<script>
import { mapGetters, mapActions } from "vuex"

import UserLogin from '~/components/UserLogin.vue'
import UserSignup from '~/components/UserSignup.vue'

export default {
  components: {
    UserLogin,
    UserSignup
  },
  data() {
    return {
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
      clearCurrentUser: "currentUser/clearCurrentUser"
    }),
    logoutUser() {
      this.flashMessage({message: 'ログアウトしました',type: 'orange',status: true})
      this.clearCurrentUser()
    }
  }
}
</script>


<style lang="scss">
.header-link {
  font-size: 24px;
  text-decoration:none;
  margin: 5px;
  background-color: #445CB0;
}

.v-application a {
  color:white;
}
</style>