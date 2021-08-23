<template>
  <v-dialog
    v-model="editDialog"
    max-width="500px"
  >
    <v-card>
      <v-btn icon large 
      class="mt-3"
      @click="editDialog = false, clearMessages()"
      style="position: fixed">
        <v-icon>mdi-close</v-icon>
      </v-btn>  
      <v-row justify="center">
        <v-card-title class="mt-8 display-1">トレーニングプランの編集</v-card-title>
      </v-row>
      <server-alert/> 
      <v-card-text>
        <v-container>
          <v-row>
            <v-col cols="12">
              <v-text-field
                v-model="editPlan.title"
                label="タイトル"
              ></v-text-field>
            </v-col>
            <v-col cols="12">
              <v-textarea
                v-model="editPlan.detail"
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
                v-model="menu"
                :close-on-content-click="false"
                :nudge-right="40"
                transition="scale-transition"
                offset-y
                min-width="auto"
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-text-field
                    v-model="editPlan.start_ymd"
                    label="開催日"
                    prepend-icon="mdi-calendar"
                    readonly
                    v-bind="attrs"
                    v-on="on"
                  ></v-text-field>
                </template>
                <v-date-picker
                  v-model="editPlan.start_ymd"
                  @input="menu = false"
                ></v-date-picker>
              </v-menu>
            </v-col>
            <v-col
              cols="12"
              sm="6"
              md="4"
            >
              <v-text-field
                v-model="editPlan.start_time"
                label="開始時間"
                type="time"
                hint="右の時計のｱｲｺﾝをｸﾘｯｸ"
              ></v-text-field>
            </v-col>
            <v-col
              cols="12"
              sm="6"
              md="4"
            >
              <v-select
                v-model="editPlan.duration"
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
                v-model="editPlan.event_cls"
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
                v-model="editPlan.train_strength"
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
                v-model="editPlan.join_limit"
                label="参加人数"
                type="number"
              ></v-text-field>
            </v-col>
            <v-col
              cols="12"
              sm="6"
            >
              <v-text-field
                v-model="editPlan.place"
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
                v-model="editPlan.prefecture"
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
          @click="editDialog = false, clearMessages()"
        >
          Close
        </v-btn>
        <v-btn
          color="blue darken-1"
          text
          @click="updateMyPlan()"
        >
          Save
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
import ServerAlert from '~/components/ServerAlert.vue'

export default {
  components: {
    ServerAlert
  },
  props: {
    plan: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      menu: false,
      editPlan: {
        id: this.plan.id,
        user_id: this.plan.user_id,
        title: this.plan.title,
        detail: this.plan.detail,
        start_ymd: this.plan.start_ymd,
        start_time: new Date(this.plan.start_time).toTimeString().split(' ')[0],
        duration: this.plan.duration,
        event_cls: this.plan.event_cls,
        train_strength: this.plan.train_strength,
        place: this.plan.place,
        prefecture: this.plan.prefecture,
        join_limit: this.plan.join_limit,

      },
      editDialog: true
    }
  },
  computed: {
    ...mapGetters({
      successPost: "plan/successPost",
    }),
  },
  methods: {
    ...mapActions({
      openPlanDialog: "plan/openPlanDialog",
      clearMessages: "errorMessage/clearMessages",
      updatePlan: "plan/updatePlan"
    }),
    updateMyPlan() {
      this.updatePlan(this.editPlan)
      this.clearMessages()
    }
  },
  watch: {
    editDialog() {
      this.$emit("close")
    },
    successPost: function(newVal, oldVal) {
      if (this.successPost) {
        this.$emit("close")
        this.$store.commit("plan/setSuccessPost", false)
        }
        return
      }
    }
}
</script>