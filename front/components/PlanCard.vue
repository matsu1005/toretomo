<template>
  <div>
    <h2>
      参加したいイベントを探そう！
    </h2>
    <v-row>
      <v-col v-for="plan in plans" :key="plan.id">
        <v-card
          class="mx-auto card-content"
          width="300"
          v-if="plan.user"
        >
          <v-card-text>
            <div>
              {{ plan.event_cls }}
              <v-chip 
                color="primary"
                outlined
                style="margin-left: 15px"
              >
                {{plan.train_strength}}
              </v-chip>
            </div>
            <p class="text-h4 text--primary">
              
            </p>
            <div class="card-title">
            <nuxt-link 
              style="text-decoration: none;" 
              :to="{ path: `/users/${plan.user_id}` }">
              <v-avatar v-if="plan.user.icon.url">
                <v-img
                  alt="user"
                  :src="plan.user.icon.url"
                />
              </v-avatar >
              <v-avatar v-else color="#445CB0">
                <v-icon dark>
                  mdi-account-circle
                </v-icon>
              </v-avatar>
            </nuxt-link>
              <div class="title-text">{{plan.title}}</div>
            </div>
            <p>
              <v-icon>mdi-map-marker</v-icon>
              {{plan.prefecture}} {{plan.place}}
            </p>
            <div class="text--primary">
              <v-alert 
                text 
                dense
                color="deep-orange" 
                outlined
                style="font-size:14px; margin-bottom: 0;">
                開催日時:<strong>{{$dayjs(plan.start_ymd).format('MM月DD日')}} {{$dayjs(plan.start_time).format('HH:mm')}}</strong><br>
                (所要時間:<strong>{{plan.duration}}時間</strong>)</v-alert>
            </div>
          </v-card-text>
          <v-card-actions>
            <template>
              <v-btn
                color="primary"
                @click.stop="getDetailPlan(plan)"
              >
                詳細情報
              </v-btn>
            </template>
            <div style="margin: 0 0 0 auto;">定員: [ {{plan.joins.length}} / {{plan.join_limit}} ]</div>
          </v-card-actions>
        </v-card>
      </v-col>
      <plan-detail-dialog v-if="planDialog" :plan="clickPlan" @close="closeDialog"/>
    </v-row>
  </div>
</template>

<script>
import { mapGetters, mapActions} from 'vuex'
import PlanDetailDialog from '~/components/PlanDetailDialog'

export default {
  components: {
    PlanDetailDialog
  },
  data() {
    return {
      loading: false,
      planDialog: false,
    }
  },
  computed: {
    ...mapGetters({
      plans: 'plan/plans',
      clickPlan: 'plan/plan',
    })
  },
  created() {
    this.getPlans().then(() => {
      this.loading = true
    })
  },
  methods: {
    ...mapActions({
      getPlans: 'plan/getPlans',
      setUser: 'user/setUser',
      getPlan: "plan/getPlan"
    }),
    getDetailPlan(plan) {
      this.getPlan(plan.id)
      setTimeout(() => {
        this.planDialog = true
      }, 100)
    },
    closeDialog() {
      this.planDialog = false
    }
  }
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

.title-text {
  height: 45px; 
  width: 205px; 
  overflow: hidden; 
  position: relative;
}
</style>