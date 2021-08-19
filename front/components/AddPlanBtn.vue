<template>
  <v-row justify="center">
    <v-btn
      fab
      fixed
      right
      bottom
      large
      dark
      color="blue-grey"
      @click.stop="openDialog()"
    >
      <v-icon dark>
        mdi-pencil
      </v-icon>
      投稿</v-btn>
    <v-dialog
      v-model="planDialog"
      persistent
      max-width="600px"
    >
      <v-card>
        <v-btn icon large 
        class="mt-3"
        @click="openPlanDialog(false), clearMessages()"
        style="position: fixed">
          <v-icon>mdi-close</v-icon>
        </v-btn>  
        <v-row justify="center">
          <v-card-title class="mt-8 display-1">トレーニング プランの登録</v-card-title>
        </v-row>
        <server-alert/> 
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="12">
                <v-text-field
                  v-model="plan.title"
                  label="タイトル"
                ></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-textarea
                  v-model="plan.detail"
                  label="詳細説明"
                  type="content"
                  rows="5"
                  solo
                ></v-textarea>
              </v-col>
              <v-col
                cols="12"
                sm="6"
                md="4"
              >
                <v-menu
                  ref="menu"
                  v-model="menu"
                  :close-on-content-click="false"
                  :return-value.sync="plan.start_ymd"
                  transition="scale-transition"
                  offset-y
                  min-width="auto"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-model="plan.start_ymd"
                      label="開催日"
                      prepend-icon="mdi-calendar"
                      readonly
                      v-bind="attrs"
                      v-on="on"
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="plan.start_ymd"
                    no-title
                    scrollable
                  >
                    <v-spacer></v-spacer>
                    <v-btn
                      text
                      color="primary"
                      @click="menu = false"
                    >
                      Cancel
                    </v-btn>
                    <v-btn
                      text
                      color="primary"
                      @click="$refs.menu.save(plan.start_ymd)"
                    >
                      OK
                    </v-btn>
                  </v-date-picker>
                </v-menu>
              </v-col>
              <v-col
                cols="12"
                sm="6"
                md="4"
              >
                <v-text-field
                  v-model="plan.start_time"
                  label="開始時間"
                  type="time"
                ></v-text-field>
              </v-col>
              <v-col
                cols="12"
                sm="6"
                md="4"
              >
                <v-select
                  v-model="plan.duration"
                  label="所要時間"
                  :items="['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']"
                  preprend
                  required
                ></v-select>
              </v-col>
              <v-col
                cols="12"
                sm="6"
                md="4"
              >
                <v-select
                  v-model="plan.event_cls"
                  :items="['Swim', 'Bike', 'Run']"
                  append-icon="mdi-bike"
                  label="練習種別"
                  required
                ></v-select>
              </v-col>
              <v-col
                cols="12"
                sm="6"
                md="4"
              >
                <v-select
                  v-model="plan.train_strength"
                  :items="['fun', 'hard']"
                  label="強度"
                  required
                ></v-select>
              </v-col>
              <v-col
                cols="12"
                sm="6"
                md="4"
              >
                <v-text-field
                  v-model="plan.join_limit"
                  label="参加人数"
                  type="number"
                ></v-text-field>
              </v-col>
              <v-col
                cols="12"
                sm="6"
              >
                <v-text-field
                  v-model="plan.place"
                  label="集合場所"
                  prepend-inner-icon="mdi-map-marker"
                  placeholder="ローソン⚪︎⚪︎店前, ⚪︎⚪︎体育館前"
                  required
                ></v-text-field>
              </v-col>
              <v-col
                cols="12"
                sm="6"
              >
                <v-select
                  v-model="plan.prefecture"
                  :items="['東京都', '埼玉県', '神奈川県', '千葉県', '群馬県', '栃木県', '茨城県', '山梨県']"
                  label="エリア区分"
                  prepend-inner-icon="mdi-map-marker"
                  required
                ></v-select>
              </v-col>
            </v-row>
          </v-container>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="blue darken-1"
            text
            @click="openPlanDialog(false), clearMessages()"
          >
            Close
          </v-btn>
          <v-btn
            color="blue darken-1"
            text
            @click="postPlan()"
          >
            Save
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
import ServerAlert from '~/components/ServerAlert.vue'

export default {
  components: {
    ServerAlert
  },
  data() {
    return {
      menu: false,
      plan: {
        title: '',
        detail: '',
        start_ymd: (new Date(Date.now() - (new Date()).getTimezoneOffset() * 60000)).toISOString().substr(0, 10),
        start_time: '09:00:00',
        duration: '1',
        event_cls: '',
        train_strength: 'fun',
        place: '',
        prefecture: '',
        join_limit: '5',
      }
    }
  },  
  computed: {
    ...mapGetters({
      planDialog: "plan/planDialog",
      successPost: "plan/successPost",
    }),
  },
  methods: {
    ...mapActions ({
      createPlan: "plan/createPlan",
      openPlanDialog: "plan/openPlanDialog",
      clearMessages: "errorMessage/clearMessages",
    }),
    postPlan() {
      let user_id = this.$store.state.currentUser.user.id
      this.plan['user_id'] = user_id
      this.createPlan(this.plan)
    },
    openDialog() {
      if (this.$store.$auth.$state.loggedIn) {
        this.openPlanDialog(true)
        console.log(this.$store)
        return
      }
      alert('投稿するにはログインする必要があります。')
    }
  },
  watch: {
    successPost: function(newVal, oldVal) {
      if (this.successPost) {
        this.plan = {
          title: '',
          detail: '',
          start_ymd: (new Date(Date.now() - (new Date()).getTimezoneOffset() * 60000)).toISOString().substr(0, 10),
          start_time: '09:00:00',
          duration: '1',
          event_cls: '',
          train_strength: 'fun',
          place: '',
          prefecture: '',
          join_limit: '5',
        }
        this.$store.commit("plan/setSuccessPost", false)
        return
      }
    }
  }
}
</script>