<template v-slot:extension>
  <v-card max-width=1000 class="ma-auto">
    <v-tabs
      v-model="tab"
      fixed-tabs
    >
      <v-tabs-slider color="blue"></v-tabs-slider>

      <v-tab
        v-for="item in items"
        :key="item"
        style="width:150px;"
      >
        {{ item }}
      </v-tab>
    </v-tabs> 
    <v-tabs-items v-model="tab">
      <v-tab-item>
        <plan-list :plans="user.plan"/>
      </v-tab-item>
      <v-tab-item>
        <v-row justify="center">
          <p cols="12" class="mt-3 display-1 grey--text">
            実装中
          </p>
        </v-row>
      </v-tab-item>
      <v-tab-item>
        <plan-list :plans="user.planjoin"/>
      </v-tab-item>
      <v-tab-item>
        <plan-list :plans="user.plan_interested"/>
      </v-tab-item>
      <v-tab-item>
        <follow-list :users="user.followings"/>
      </v-tab-item>
      <v-tab-item>
        <follow-list :users="user.followers"/>
      </v-tab-item>
    </v-tabs-items>
  </v-card>
</template>

<script>
import PlanList from '~/components/mypage/PlanList.vue'
import FollowList from '~/components/mypage/FollowList.vue'

export default {
  components: {
    PlanList,
    FollowList
  },
  props: {
    user: {
      type: Object,
      required: true,
    },
  },
  data () {
    return {
      tab: null,
      items: [
        '練習プラン', '活動報告', '参加', '気になる', 'フォロー', 'フォロワー'
      ],
    }
  },
}
</script>