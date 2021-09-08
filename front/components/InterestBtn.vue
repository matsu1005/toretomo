<template>
  <div style=" margin: 0 0 0 auto; float:right;">
    <v-btn
      v-if="isInterested"
      :disabled="!$auth.loggedIn"
      color="#32cd32"
      small
      @click="notInterested(plan.id)"
      >
      気になる({{plan.interests.length}})
    </v-btn>
    <v-btn
      v-else
      :disabled="!$auth.loggedIn"
      color="gray"
      small
      @click="interested(plan.id)"
      >
      気になる({{plan.interests.length}})
    </v-btn>
  </div>
</template>

<script>
import { mapActions, mapGetters} from "vuex"

export default {
  props: {
    plan: {
    }
  },
  computed: {
    ...mapGetters({
      currentUser: "currentUser/user",
    }),
    isInterested() {
      if (!this.currentUser) return false
      return this.plan.interests.find(ele => ele.user_id === this.currentUser.id)
    }
  },
  methods: {
    ...mapActions({
      haveInterest: "plan/haveInterest",
      notInterest: "plan/notInterest",
    }),
    interested(planId) {
      let formData = {
        user_id: this.currentUser.id,
        plan_id: planId
      }
      this.haveInterest(formData)
    },
    notInterested(planId) {
      let formData = {
        user_id: this.currentUser.id,
        plan_id: planId
      }
      this.notInterest(formData)
    }
  },
}
</script>