<template>
  <v-form ref="form">
  <div>
    <v-row justify="center" v-show="show || user.name =='ゲストユーザー1'">
      <p cols="12" class="mt-3 display-1">
        {{user.name}}さんのマイページ
      </p>
    </v-row>
    <server-alert/> 
    <v-row justify="center" v-show="!show && user.name !=='ゲストユーザー1'">
      <v-col
        cols="6"
        sm="3"
        md="2"
      >
        <v-text-field
          label="ユーザー名"
          v-model="userInfo.name"
        ></v-text-field>
      </v-col>
      <p cols="12" class="mt-3 display-1">
        さんのマイページ!
      </p>
    </v-row>
    <v-row justify="center">
      <v-card outlined class="pa-5" style="display:flex; border:none;">
        <div class="mr-10" style="text-align:center;">
          <follow-btn :user='user'/>
          <v-spacer></v-spacer>
          <v-avatar
            color="#445CB0"
            size="100"
            style="margin:0;"
            v-if="user.icon"
          >
            <template v-if="user.icon.url !== null">
              <v-img v-if="input_image !== null" :src="input_image" />
              <v-img v-else :src="user.icon.url"/>
            </template>
            <template v-else>
              <v-img v-if="input_image !== null" :src="input_image" />
              <v-icon v-else dark size="70">
                mdi-account-circle
              </v-icon>
            </template>
          </v-avatar>
          <v-file-input
            v-model="editImage"
            v-show="!show && user.name !== 'ゲストユーザー1'"
            accept="image/png, image/jpeg, image/bmp"
            prepend-icon="mdi-image"
            label="画像を選択してください"
            class="pt-14"
            @change="setImage"
          />
          <div style="text-align:center" v-show="show">
            <p class="mb-0"><small>生年月日 : </small></p>
            <p class="mb-0" v-if="user.birth_year && user.birth_year !== 'null'">
              <small>{{user.birth_year}}年{{user.birth_month}}月{{user.birth_day}}日</small>
            </p>
            <p class="mb-0" v-else><small>未設定</small></p>
            <p class="mb-0"><small>性別 : {{user.sex && user.sex !== 'null' ? user.sex: "未設定"}}</small></p>
          </div>
          <div style="width:250px" v-show="!show">
            <p class="mb-0"><small>生年月日 :</small></p>
            <div style="display:flex;">
              <v-col>
                <v-select
                  v-model="userInfo.birth_year"
                  :items="years"
                  label="年"
                  small
                ></v-select>
              </v-col>
              <v-col>
              <v-select
                v-model="userInfo.birth_month"
                :items="months"
                label="月"
              ></v-select>

              </v-col>
              <v-col>
              <v-select
                v-model="userInfo.birth_day"
                :items="days"
                label="日"
              ></v-select>
              </v-col>
            </div>
            <v-col class="mb-0" v-show="!show">
              <v-select
                v-model="userInfo.sex"
                :items="['', '男性', '女性']"
                label="性別"
                small
              ></v-select>
            </v-col>
          </div>
          <v-spacer></v-spacer>
          <v-btn
            outlined
            class="mx-4 my-5"
            @click="show = !show, clearMessages()"
            v-if="user.id === id"
          >
            {{ show? "編集": "閉じる"}}
          </v-btn>
          <v-btn
            class="mx-4 my-5"
            v-if="!show"
            color="error"
            @click="changeUserProfile()"
          >
            更新
          </v-btn>
        </div>
        <div style="max-width: 600px" v-if="show">
          <p><strong>プロフィール</strong></p>
          <v-card-text class="text--primary" style="white-space:pre-line; word-wrap:break-word;">
            {{user.profile && user.profile !== 'null' ? user.profile: "プロフィールを設定してみましょう！！"}}
          </v-card-text>
        </div>
        <v-card-text style="min-width:600px" v-if="!show">
          <p><strong>プロフィール</strong></p>
          <v-textarea
            v-model="userInfo.profile"
            filled
            auto-grow
            class="ml-5"
          ></v-textarea>
        </v-card-text>
      </v-card>
    </v-row>
  </div>
  </v-form>
</template>

<script>
import { mapActions } from 'vuex'
import ServerAlert from '~/components/ServerAlert.vue'
import FollowBtn from '~/components/mypage/FollowBtn.vue'

export default {
  components: {
    ServerAlert,
    FollowBtn
  },
  props: {
    user: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      show: true,
      editImage: null,
      input_image: null,
      id : this.$store.getters["currentUser/user"].id,
      userInfo: {
        name: this.$store.getters["currentUser/user"].name,
        profile: this.$store.getters["currentUser/user"].profile == 'null'? 
                  '':this.$store.getters["currentUser/user"].profile,
        birth_year: this.$store.getters["currentUser/user"].birth_year,
        birth_month: this.$store.getters["currentUser/user"].birth_month,
        birth_day: this.$store.getters["currentUser/user"].birth_day,
        sex: this.$store.getters["currentUser/user"].sex,
        icon: this.$store.getters["currentUser/user"].icon,
      },
      years: [''],
      months: [''],
      days: [''],
    }
  },
  created() {
    let year = (new Date().getFullYear()) - 18
    for (let i = 0; i < 70; i++) {
      this.years.push(String(year))
      year = year - 1
    }
    let init = 1
    for (let i = 0; i < 11; i++) {
      this.months.push(String(init))
      init = init + 1
    }
    let day = 1
    for (let i = 0; i < 30; i++) {
      this.days.push(String(day))
      day = day + 1
    }
  },
  methods: {
    ...mapActions ({
      clearMessages: "errorMessage/clearMessages",
      setUser: "user/setUser"
    }),
    setImage(file) {
      this.editImage = file
      if (file !== undefined && file !== null) {
        if (file.name.lastIndexOf(".") <= 0) {
          return
        }
        const fr = new FileReader()
        fr.readAsDataURL(file)
        fr.addEventListener("load", () => {
          this.input_image = fr.result
        })
      } else {
        this.input_image = null
      }
    },
    async changeUserProfile() {
      const formData = new FormData()
      if (this.editImage != null) {
        formData.append("icon", this.editImage)
      }
      formData.append("name", this.userInfo.name)
      formData.append("birth_year", this.userInfo.birth_year)
      formData.append("birth_month", this.userInfo.birth_month)
      formData.append("birth_day", this.userInfo.birth_day)
      formData.append("profile", this.userInfo.profile)
      formData.append("sex", this.userInfo.sex)
      await this.$axios
        .put('api/v1/auth', formData, {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        })
        .then((response) => {
          this.$store.commit("currentUser/setCurrentUser", response.data.data)
          this.setUser(this.id)
          this.show = true
          this.clearMessages()
          this.$store.dispatch(
            "flashMessage/showMessage",
            {
              message: "ユーザープロフィールを更新しました。",
              type: "success",
              status: true,
            }
          )
        })
        .catch((error) => {
          this.$store.dispatch(
            "flashMessage/showMessage",
            {
              message: "プロフィールの更新に失敗しました。",
              type: "error",
              status: true,
            }
          )
        })
    }
  },
}
</script>

