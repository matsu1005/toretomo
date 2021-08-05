<template>
  <div>
    <v-card class="mx-auto" max-width="600">
      <v-form ref="form"  lazy-validation>
        <v-container>
          <v-btn icon large 
          @click="signUpDialog(false), clearMessages()"
          style="position: fixed">
            <v-icon>mdi-close</v-icon>
          </v-btn>  
          <v-row justify="center">
            <p cols="12" class="mt-3 display-1 grey--text">
              サインアップ
            </p>
          </v-row>
          <server-alert/> 
          <v-row justify="center">
            <v-col cols="12" md="10" sm="10">
              <v-text-field
                v-model="user.name"
                label="ユーザー名"
              />
              <p class="caption mb-0" />
            </v-col>
          </v-row>
          <v-row justify="center">
            <v-col cols="12" md="10" sm="10">
              <v-text-field
                v-model="user.email"
                label="Eメールアドレス"
              />
              <p class="caption mb-0" />
            </v-col>
          </v-row>
          <v-row justify="center">
            <v-col cols="12" md="10" sm="10">
              <v-text-field
                v-model="user.password"
                type="password"
                label="パスワード"
              />
            </v-col>
          </v-row>
          <v-row justify="center">
            <v-col cols="12" md="10" sm="10">
              <v-text-field
                v-model="user.password_confirmation"
                type="password"
                label="パスワード確認用"
              />
            </v-col>
          </v-row>
          <v-row justify="center">
            <v-col cols="12" md="10" sm="10">
              <v-btn
                block
                class="mr-4 blue white--text"
                @click="signUp"
              >
                会員登録
              </v-btn>
            </v-col>
          </v-row>
        </v-container>
      </v-form>
    </v-card>
  </div>
</template>

<script>
import { mapActions } from "vuex" 
import ServerAlert from '~/components/ServerAlert.vue'

export default {
  components: {
    ServerAlert
  },
  data () {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        password_confirmation: ''
      }
    }
  },
  methods: {
    ...mapActions ({
      signUpDialog: "modal/signUpUser",
      clearMessages: "errorMessage/clearMessages",
      setCurrentUser: "currentUser/setCurrentUser"
    }),
    async signUp () {
      await this.$axios.post(
        '/api/v1/auth', this.user)
        .then((response) => {
          this.$auth.loginWith('local', {
            data: this.user})
          this.signUpDialog(false)
          this.setCurrentUser(response.data.data)
          this.$store.dispatch(
            "flashMessage/showMessage",
            {
              message: "ユーザー登録が完了しました",
              type: "success",
              status: true,
            },
          )
          return response
        },
        (error) => {
          return error
        })
    }
  }
}
</script>