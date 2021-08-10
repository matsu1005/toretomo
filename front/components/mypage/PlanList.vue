<template>
  <div>
    <v-row>
      <v-col v-for="plan in plans" :key="plan.id">
        <v-card
          class="mx-auto card-content"
          width="300"
        >
          <v-card-text>
            <div>
              {{ plan.event_cls }}
              <v-chip 
                style="margin-left: 10px"
                outlined
              >
                {{plan.train_strength}}
              </v-chip>
              <div style="float:right">
                <v-btn
                  color="success"
                  small
                >
                  編集
                </v-btn>
                <v-btn
                  color="error"
                  small
                >
                  削除
                </v-btn>

              </div>
            </div>
            <div class="card-title">
              <div class="plan-title">{{plan.title}}</div>
            </div>
            <p>
              <v-icon>mdi-map-marker</v-icon>
              {{plan.prefecture}} {{plan.place}}
            </p>
            <div class="text--primary">
              <v-alert 
                text 
                dense
                outlined
                style="font-size:14px; margin-bottom: 0;">
                開催日時:<strong>{{$dayjs(plan.start_ymd).format('MM月DD日')}} {{$dayjs(plan.start_time).format('HH:mm')}}</strong><br>
                (所要時間:<strong>{{plan.duration}}時間</strong>)</v-alert>
            </div>
          </v-card-text>
          <v-card-actions>
            <v-btn
            >
              詳細情報
            </v-btn>
            <div style="margin: 0 0 0 auto;">定員: [ 1 / {{plan.join_limit}} ]</div>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import { mapGetters, mapActions} from 'vuex'

export default {
  data() {
    return {
      loading: false,
    }
  },
  computed: {
    ...mapGetters({
      plans: 'plan/plans'
    })
  },
  created() {
    this.getPlans().then(() => {
      this.loading = true
    })
  },
  methods: {
    ...mapActions({
      getPlans: 'plan/getPlans'
    })
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

.plan-title {
  margin-top: 10px;
  height: 45px; 
  overflow: hidden; 
  position: relative;
}
</style>