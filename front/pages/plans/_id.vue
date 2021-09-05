<template>
  <v-container v-if="plan.user" style="max-width: 900px">
    <plan-info :plan="plan"/>
    <join-user-list :joins="plan.joins"/>
    <message-area :plan="plan"/>
  </v-container>   
</template>

<script>
import { mapActions, mapGetters } from 'vuex'

import PlanInfo from '~/components/plans/PlanInfo.vue'
import JoinUserList from '~/components/plans/JoinUserList.vue'
import MessageArea from '~/components/plans/MessageArea.vue'

export default {
  components: {
    PlanInfo,
    JoinUserList,
    MessageArea,
  },
  data() {
    return {
      loading: false
    }
  },
  computed: {
    ...mapGetters({
      plan: "plan/plan"
    })
  },
  methods: {
    ...mapActions({
      getPlan: "plan/getPlan",
    }),
  },
  created() {
    this.getPlan(this.$route.params.id)
    this.loading = true
  }
}
</script>