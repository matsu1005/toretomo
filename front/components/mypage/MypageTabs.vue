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

        </v-tab-item>
        <v-tab-item>
          <plan-list :plans="user.planjoin"/>
        </v-tab-item>
        <v-tab-item>
          
        </v-tab-item>
        <v-tab-item>
          <follow-list/>
        </v-tab-item>
        <v-tab-item>
          <follow-list/>
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
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    }
  },
}
</script>