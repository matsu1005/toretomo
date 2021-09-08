export const state = () => ({
  plan: {},
  plans: [],
  planDialog: false,
  editDialog: false,
  successPost: false,
  basePlan: {
    title: '',
    detail: '',
    start_ymd: (new Date(Date.now() - (new Date()).getTimezoneOffset() * 60000)).toISOString().substr(0, 10),
    start_time: '09:00:00',
    duration: '1',
    event_cls: '',
    train_strength: 'fun',
    place: '',
    prefecture: '',
    join_limit: '5'
  }
})
export const getters = {
  plan: (state) => state.plan,
  plans: (state) => state.plans,
  planDialog: (state) => state.planDialog,
  editDialog: (state) => state.editDialog,
  successPost: (state) => state.successPost,
}
export const mutations = {
  setPlans(state, plans) {
    state.plans = plans
  },
  setPlan(state, plan) {
    state.plan = plan
  },
  openPlanDialog(state, bool) {
    state.planDialog = bool
  },
  openEditDialog(state, bool) {
    state.editDialog = bool
  },
  setPlan(state, plan) {
    state.plan = plan
  },
  setSuccessPost(state, bool) {
    state.successPost = bool
  }
}

export const actions = {
  async getPlans({ commit }) {
    await this.$axios
      .get('api/v1/plans')
      .then((response) => {
        commit('setPlans', response.data)
      })
      .catch((error) => {
        console.log(error)
      })
  },
  async getPlan({ commit }, planId) {
    await this.$axios
      .get(`api/v1/plans/${planId}`)
      .then((response) => {
        commit('setPlan', response.data)
      })
      .catch((error) => {
        console.log(error)
      })
  },
  async createPlan({ commit }, plan) {
    const user_id = plan.user_id
    await this.$axios
      .post('api/v1/plans', plan)
      .then((response) => {
        commit('openPlanDialog', false)
        commit("flashMessage/setMessage", "投稿が成功しました。", { root: true })
        commit("flashMessage/setType", "success", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        commit("errorMessage/clearMessages", null, { root: true })
        commit("setSuccessPost", true)    
        this.$axios.get('api/v1/plans')
          .then((response) => {
            commit('setPlans', response)
            this.$router.push({ path: `users/${user_id}`})
        })
      })
      .catch((error) => {
        commit("flashMessage/setMessage", "投稿が失敗しました。", { root: true })
        commit("flashMessage/setType", "error", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        commit("setSuccessPost", false)
        console.log(error)
      })
  },
  async openPlanDialog({ commit }, bool) {
    commit("openPlanDialog", bool)
  },
  async openEditDialog({ commit }, bool) {
    commit("openEditDialog", bool)
  },
  async updatePlan({ commit }, plan) {
    await this.$axios
      .put(`/api/v1/plans/${plan.id}`, plan)
      .then((response) => {
        commit('openPlanDialog', false)
        commit("flashMessage/setMessage", "投稿を編集しました。", { root: true })
        commit("flashMessage/setType", "success", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        commit("errorMessage/clearMessages", null, { root: true })
        commit("setSuccessPost", true)
        this.$axios
          .get(`api/v1/users/${plan.user_id}`)
          .then((response) => {
            commit('user/setUser', response.data, { root: true})
          })
        
      })
      .catch((error) => {
        commit("flashMessage/setMessage", "投稿の編集が失敗しました。", { root: true })
        commit("flashMessage/setType", "error", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        commit("setSuccessPost", false)
        console.log(error)
      })
  },
  async deletePlan({ commit }, plan) {
    await this.$axios
      .delete(`/api/v1/plans/${plan.id}`)
      .then((response) => {
        commit("flashMessage/setMessage", "投稿したプランを削除しました。", { root: true })
        commit("flashMessage/setType", "success", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        this.$axios
          .get(`api/v1/users/${plan.user_id}`)
          .then((response) => {
            commit('user/setUser', response.data, { root: true})
          })
      })
      .catch((error) => {
        commit("flashMessage/setMessage", "プランの削除に失敗しました。", { root: true })
        commit("flashMessage/setType", "error", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        console.log(error)
      })
  },
  async joinPlan({ commit }, formData) {
    await this.$axios
      .post("/api/v1/joins", formData)
      .then((response) => {
        commit("flashMessage/setMessage", "練習プランに参加しました。", { root: true })
        commit("flashMessage/setType", "success", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        this.$axios.get(`api/v1/plans/${formData.plan_id}`)
          .then((response) => {
            commit('setPlan', response.data)
          })
        this.$axios.get('api/v1/plans')
          .then((response) => {
            commit('setPlans', response.data)
          })
        this.$axios
          .get(`api/v1/users/${formData.user_id}`)
          .then((response) => {
            commit('user/setUser', response.data, { root: true})
          })
      })
      .catch((error) => {
        commit("flashMessage/setMessage", "練習プラン参加処理が失敗しました。", { root: true })
        commit("flashMessage/setType", "error", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        console.log(error)
      })
  },
  async unJoinPlan({ commit }, formData) {
    await this.$axios
      .delete(`/api/v1/joins/${formData.join_id}`)
      .then((response) => {
        commit("flashMessage/setMessage", "練習プランの参加を解除しました。", { root: true })
        commit("flashMessage/setType", "success", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        this.$axios.get(`api/v1/plans/${formData.plan_id}`)
          .then((response) => {
            commit('setPlan', response.data)
          })
        this.$axios.get('api/v1/plans')
          .then((response) => {
            commit('setPlans', response.data)
          })
        this.$axios
          .get(`api/v1/users/${formData.user_id}`)
          .then((response) => {
            commit('user/setUser', response.data, { root: true})
          })
      })
      .catch((error) => {
        commit("flashMessage/setMessage", "練習プラン参加の解除が失敗しました。", { root: true })
        commit("flashMessage/setType", "error", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        console.log(error)
      })
  },
  async haveInterest({ commit }, formData) {
    await this.$axios
      .post("/api/v1/interests", formData)
      .then((response) => {
        commit("flashMessage/setMessage", "「気になる」に追加しました。", { root: true })
        commit("flashMessage/setType", "success", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        this.$axios.get('api/v1/plans')
          .then((response) => {
            commit('setPlans', response.data)
          })
      })
      .catch((error) => {
        commit("flashMessage/setMessage", "処理が失敗しました。", { root: true })
        commit("flashMessage/setType", "error", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        console.log(error)
      })
  },
  async notInterest({ commit }, formData) {
    await this.$axios
      .$delete("/api/v1/interests", {params: formData})
      .then((response) => {
        commit("flashMessage/setMessage", "「気になる」から外ししました。", { root: true })
        commit("flashMessage/setType", "success", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        this.$axios.get('api/v1/plans')
          .then((response) => {
            commit('setPlans', response.data)
          })
      })
      .catch((error) => {
        commit("flashMessage/setMessage", "処理が失敗しました。", { root: true })
        commit("flashMessage/setType", "error", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
        console.log(error)
      })
  }
}