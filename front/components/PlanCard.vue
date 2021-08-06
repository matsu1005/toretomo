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
              <v-avatar color="#445CB0">
                <v-icon dark>
                  mdi-account-circle
                </v-icon>
              </v-avatar>
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
            <v-btn
              color="primary"
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
    console.log('created')
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

.title-text {
  height: 45px; 
  width: 205px; 
  overflow: hidden; 
  position: relative;
}
</style>