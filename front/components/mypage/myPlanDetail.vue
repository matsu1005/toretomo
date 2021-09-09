//////////////////////// // 不要になったcomponent// ////////////////////////
<template>
  <v-dialog v-model="planDialog" max-width="500px">
    <v-card rounded="lg">
      <v-card-title> 自分の投稿 </v-card-title>
      <div>
        <v-chip color="primary" outlined style="margin-left: 15px">
          {{ plan.event_cls }}
        </v-chip>
        <v-chip color="primary" outlined style="margin-left: 5px">
          {{ plan.train_strength }}
        </v-chip>
      </div>
      <v-card-text
        class="mt-3"
        style="white-space: pre-line; word-wrap: break-word"
      >
        <strong>{{ plan.title }}</strong>
        <v-spacer class="mt-5"></v-spacer>
        <p>
          <v-icon color="orange">mdi-calendar</v-icon>
          開催日時 :
          <strong
            >{{ $dayjs(plan.start_ymd).format("MM月DD日") }}
            {{ $dayjs(plan.start_time).format("HH:mm") }}</strong
          >
          所要時間 : <strong>{{ plan.duration }}時間</strong>
        </p>
        <p>
          <v-icon color="orange">mdi-map-marker</v-icon>
          集合場所 : <strong>{{ plan.place }}</strong> エリア区分 :
          <strong>{{ plan.prefecture }}</strong>
        </p>
        <v-spacer class="mt-5"></v-spacer>
        <p style="display: inline; border-bottom: solid 2px gray">詳細内容</p>
        <p>{{ plan.detail }}</p>
      </v-card-text>

      <v-card-actions>
        <v-btn text @click="planDialog = false">
          <v-icon>mdi-close</v-icon>
          <div style="line-height: 24px">閉じる</div>
        </v-btn>
        <div style="margin: 0 0 0 auto">
          定員: [ 1 / {{ plan.join_limit }} ]
        </div>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import { mapActions } from "vuex"
export default {
  props: {
    plan: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      planDialog: true,
    }
  },
  watch: {
    planDialog() {
      this.$emit("close")
    },
  },
  methods: {},
}
</script>
