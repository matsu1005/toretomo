<template>
  <v-dialog
    v-model="planDialog"
    max-width="500px"
  >
    <v-card rounded="lg">
      <div class="pt-10" v-if="existsMessages">
        <server-alert/> 
      </div>
      <v-card-title style="display:flex;">
        <div v-if="plan.user_id !== $store.state.currentUser.user.id" 
          style="margin-top: 15px">
          <nuxt-link style="text-decoration: none;" :to="{ path: `/users/${plan.user_id}` }">
            <v-avatar v-if="plan.user.icon.url" size="56">
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
          <p style="float:right; line-height:56px;">
            {{plan.user.name}}
          </p>
        </div>
        <p v-else class="mt-5">
          自分の投稿
        </p>
        <div>
          <v-chip 
            color="primary"
            outlined
            style="margin-left: 15px"
          >
            {{ plan.event_cls }}
          </v-chip>
          <v-chip 
            color="primary"
            outlined
            style="margin-left: 5px"
          >
            {{plan.train_strength}}
          </v-chip>
        </div>
        <div  v-if="plan.user_id !== currentUser.id"
          style=" margin: 0 0 0 auto">
          <v-btn
            v-if="isJoined"
            :disabled="!$auth.loggedIn"
            color="orange"
            @click="unJoinAction(plan.joins)"
            >
            参加中
            <v-icon dark>
              mdi-run-fast
            </v-icon>
          </v-btn>
          <v-btn
            v-else
            :disabled="!$auth.loggedIn"
            color="gray"
            @click="joinAction(plan.id)"
            >
            参加
            <v-icon dark>
              mdi-account-arrow-left
            </v-icon>
          </v-btn>
        </div>
      </v-card-title>
      <v-card-text class="mt-3" style="white-space:pre-line; word-wrap:break-word;">
        <strong>{{plan.title}}</strong>
        <v-spacer class="mt-5"></v-spacer>
        <p>
          <v-icon color="orange">mdi-calendar</v-icon>
          開催日時 : <strong>{{$dayjs(plan.start_ymd).format('MM月DD日')}} {{$dayjs(plan.start_time).format('HH:mm')}}</strong>
          所要時間 : <strong>{{plan.duration}}時間</strong></p>
        <p>
          <v-icon color="orange">mdi-map-marker</v-icon>
          集合場所 : <strong>{{plan.place}}</strong>
          エリア区分 : <strong>{{plan.prefecture}}</strong></p>
        <v-spacer class="mt-5"></v-spacer>
        <p style=" display:inline; border-bottom:solid 2px gray">詳細内容</p>
        <p >{{plan.detail}}</p>
      </v-card-text>

      <v-card-actions>
        <v-btn
          text
          @click="planDialog = false"
        >
        <v-icon>mdi-close</v-icon>
        <div style="line-height:24px">閉じる</div> 
        </v-btn>
        <div style="margin: 0 0 0 auto;">定員: [ {{plan.joins.length}} / {{plan.join_limit}} ]</div>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
import ServerAlert from '~/components/ServerAlert.vue'

export default {
  components: {
    ServerAlert
  },
  data() {
    return {
      planDialog: true,
    }
  },
  computed: {
    ...mapGetters({
      currentUser: "currentUser/user",
      plan: "plan/plan",
      existsMessages:  "errorMessage/existsMessages"
    }),
    isJoined() {
      if (!this.currentUser) return false
      return this.plan.joins.find(ele => ele.user_id === this.currentUser.id)
    }
  },
  methods: {
    ...mapActions({
      joinPlan: "plan/joinPlan",
      unJoinPlan: "plan/unJoinPlan",
      getPlan: "plan/getPlan",
      setUser: "user/setUser"
    }),
    joinAction(planId) {
      // if (this.plan.joins.length < this.plan.join_limit) {
        let formData = {
          user_id: this.currentUser.id,
          plan_id: planId
        }
        this.joinPlan(formData)
        return
      // }
      // alert('※定員が上限に達しているため、参加できません。')
    },
    unJoinAction(joins) {
      let obj = joins.find(ele => ele.user_id == this.currentUser.id)
      let formData = {
        user_id: this.currentUser.id,
        join_id: obj.id,
        plan_id: this.plan.id
      }
      this.unJoinPlan(formData)
    }
  },
  watch: {
    planDialog() {
      this.$emit("close")
      this.$store.dispatch("errorMessage/clearMessages", null)
    }
  }
}
</script>