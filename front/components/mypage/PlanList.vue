<template>
  <div>
    <v-row>
      <v-col v-for="plan in plans" :key="plan.id">
        <v-card class="mx-auto card-content" width="300">
          <v-card-text>
            <div>
              {{ plan.event_cls }}
              <v-chip style="margin-left: 10px" outlined>
                {{ plan.train_strength }}
              </v-chip>
              <div v-if="plan.user_id === currentUser.id" style="float: right">
                <v-btn color="success" small @click="editPlan(plan)">
                  編集
                </v-btn>
                <v-btn color="error" small @click="deletePlan(plan)">
                  削除
                </v-btn>
              </div>
            </div>
            <div class="card-title">
              <nuxt-link
                v-if="plan.user_id !== currentUser.id"
                style="text-decoration: none"
                :to="{ path: `/users/${plan.user_id}` }"
              >
                <v-avatar v-if="plan.user.icon.url">
                  <v-img alt="user" :src="plan.user.icon.url" />
                </v-avatar>
                <v-avatar v-else color="#445CB0">
                  <v-icon dark> mdi-account-circle </v-icon>
                </v-avatar>
              </nuxt-link>
              <div class="plan-title">{{ plan.title }}</div>
            </div>
            <p>
              <v-icon>mdi-map-marker</v-icon>
              {{ plan.prefecture }} {{ plan.place }}
            </p>
            <div class="text--primary">
              <v-alert
                text
                dense
                outlined
                style="font-size: 14px; margin-bottom: 0"
              >
                開催日時:<strong
                  >{{ $dayjs(plan.start_ymd).format("MM月DD日") }}
                  {{ $dayjs(plan.start_time).format("HH:mm") }}</strong
                ><br />
                (所要時間:<strong>{{ plan.duration }}時間</strong>)</v-alert
              >
            </div>
          </v-card-text>
          <v-card-actions>
            <v-btn @click.stop="getDetailPlan(plan)"> 詳細情報 </v-btn>
            <div style="margin: 0 0 0 auto">
              定員: [ {{ plan.joins.length }} / {{ plan.join_limit }} ]
            </div>
          </v-card-actions>
        </v-card>
      </v-col>
      <plan-detail-dialog
        v-if="planDialog"
        :plan="clickPlan"
        @close="closeDialog"
      />
      <edit-plan-dialog
        v-if="editDialog"
        :plan="clickPlan"
        @close="closeDialog"
      />
      <delete-plan-dialog
        v-if="deleteDialog"
        :plan="clickPlan"
        @close="closeDialog"
      />
    </v-row>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex"
import myPlanDetail from "~/components/mypage/myPlanDetail"
import EditPlanDialog from "~/components/mypage/EditPlanDialog.vue"
import PlanDetailDialog from "~/components/PlanDetailDialog.vue"
import DeletePlanDialog from "~/components/mypage/DeletePlanDialog.vue"

export default {
  components: {
    myPlanDetail,
    EditPlanDialog,
    PlanDetailDialog,
    DeletePlanDialog,
  },
  props: {
    plans: {
      type: Array,
      default: () => [],
      required: true,
    },
  },
  data() {
    return {
      loading: false,
      planDialog: false,
      editDialog: false,
      deleteDialog: false,
    }
  },
  computed: {
    ...mapGetters({
      clickPlan: "plan/plan",
      currentUser: "currentUser/user",
    }),
  },
  methods: {
    ...mapActions({
      getPlans: "plan/getPlans",
      setUser: "user/setUser",
      getPlan: "plan/getPlan",
    }),
    getDetailPlan(plan) {
      this.getPlan(plan.id)
      setTimeout(() => {
        this.planDialog = true
      }, 100)
    },
    closeDialog() {
      this.planDialog = false
      this.editDialog = false
      this.deleteDialog = false
    },
    editPlan(plan) {
      this.getPlan(plan.id)
      setTimeout(() => {
        this.editDialog = true
      }, 100)
    },
    deletePlan(plan) {
      this.getPlan(plan.id)
      setTimeout(() => {
        this.deleteDialog = true
      }, 100)
    },
  },
}
</script>

<style>
.v-card--reveal {
  bottom: 0;
  opacity: 1 !important;
  position: absolute;
  width: 100%;
}

.card-content {
  margin: 15px;
}

.card-title {
  display: flex;
  margin-bottom: 10px;
  color: black;
  font-size: 16px;
}

.v-avatar {
  margin-right: 15px;
}

.plan-title {
  margin-top: 10px;
  height: 45px;
  overflow: hidden;
  position: relative;
}
</style>
