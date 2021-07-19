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
                開催日時:<strong>{{plan.start_ymd}} {{plan.start_time}}</strong><br>
                (所要時間:<strong>{{plan.duration}}</strong>)</v-alert>
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
  export default {
    data: () => ({
      plans: [
        {
          id: 1,
          title: "尾根幹線往復、一緒にどうですか？？",
          detail: "こんにちは、松山と言います。　涼しい午前中に尾根幹で一緒にトレーニングできる人を\
                   募集しています。　巡航速度は25km/hくらいです。",
          start_ymd: "2021-07-01",
          start_time: "9:00",
          duration: "3時間",
          event_cls: "Bike",
          train_strength: "fun",
          place: "ローソン前",
          prefecture: "東京都",
          join_limit: 5
        },
        {
          id: 2,
          title: "尾根幹線往復、一緒にどうですか？？",
          detail: "こんにちは、松山と言います。　涼しい午前中に尾根幹で一緒にトレーニングできる人を\
                   募集しています。　巡航速度は25km/hくらいです。",
          start_ymd: "2021-07-01",
          start_time: "9:00",
          duration: "3時間",
          event_cls: "Bike",
          train_strength: "fun",
          place: "ローソン前",
          prefecture: "東京都",
          join_limit: 5
        },
        {
          id: 3,
          title: "尾根幹線往復、一緒にどうですか？？尾根幹線往復、一緒にどうですか？？",
          detail: "こんにちは、松山と言います。　涼しい午前中に尾根幹で一緒にトレーニングできる人を\
                   募集しています。　巡航速度は25km/hくらいです。",
          start_ymd: "2021-07-01",
          start_time: "9:00",
          duration: "3時間",
          event_cls: "Bike",
          train_strength: "fun",
          place: "ローソン前",
          prefecture: "東京都",
          join_limit: 5
        },
        {
          id: 4,
          title: "尾根幹線往復、一緒にどうですか？？",
          detail: "こんにちは、松山と言います。　涼しい午前中に尾根幹で一緒にトレーニングできる人を\
                   募集しています。　巡航速度は25km/hくらいです。",
          start_ymd: "2021-07-01",
          start_time: "9:00",
          duration: "3時間",
          event_cls: "Bike",
          train_strength: "fun",
          place: "ローソン前",
          prefecture: "東京都",
          join_limit: 5
        },
        {
          id: 5,
          title: "皇居をゆったり２周ほど！ぜひご一緒にどうですか？？",
          detail: "こんにちは、松山と言います。　涼しい午前中に尾根幹で一緒にトレーニングできる人を\
                   募集しています。　巡航速度は25km/hくらいです。",
          start_ymd: "2021-07-01",
          start_time: "9:00",
          duration: "3時間",
          event_cls: "Bike",
          train_strength: "fun",
          place: "ローソン前",
          prefecture: "東京都",
          join_limit: 5
        },
        {
          id: 6,
          title: "皇居をゆったり２周ほど！ぜひご一緒にどうですか？？",
          detail: "こんにちは、松山と言います。　涼しい午前中に尾根幹で一緒にトレーニングできる人を\
                   募集しています。　巡航速度は25km/hくらいです。",
          start_ymd: "2021-07-01",
          start_time: "9:00",
          duration: "3時間",
          event_cls: "Bike",
          train_strength: "fun",
          place: "ローソン前",
          prefecture: "東京都",
          join_limit: 5
        }
      ]
    }),
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