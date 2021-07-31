<template>
  <div>
    <v-card class="mx-auto" max-width="600">
      <v-form ref="form"  lazy-validation>
        <v-container>
          <v-btn icon large 
          @click="loginDialog(false)"
          style="position: fixed">
            <v-icon>mdi-close</v-icon>
          </v-btn>
          <v-row justify="center">
            <p cols="12" class="mt-3 display-1 grey--text">
              ログイン
            </p>
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
                placeholder=''
              />
            </v-col>
          </v-row>
          <v-row justify="center">
            <v-col cols="12" md="10" sm="10">
              <v-btn
                block
                class="mr-4 blue white--text"
                @click="loginWithAuthModule"
              >
                ログイン
              </v-btn>
            </v-col>
          </v-row>
        </v-container>
      </v-form>
    </v-card>
  </div>
</template>

<script>
import { mapActions　} from "vuex" 

export default {
  data () {
    return {
      user: {
        password: '',
        email: ''
      }
    }
  },
  methods: {
    ...mapActions ({
      loginDialog: "modal/loginUser",
    }),
    async loginWithAuthModule () {
      await this.$auth.loginWith('local', {
        data: this.user
      })
        .then((response) => {
          this.loginDialog(false)
          return response
        },
        (error) => {
          return error
        })
    }
  }
}
</script>