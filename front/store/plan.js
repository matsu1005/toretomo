export const state = () => ({
  plan: {},
  plans: [],
  planDialog: false,
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
  successPost: (state) => state.successPost,
}
export const mutations = {
  setPlans(state, plans) {
    state.plans = plans.data
  },
  addPlan(state, plan) {
    state.plans.push(plan)
  },
  openPlanDialog(state, bool) {
    state.planDialog = bool
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
    const plans = {
      data: '',
    }
    await this.$axios
      .get('api/v1/plans')
      .then((response) => {
        plans.data = response.data
        commit('setPlans', plans)
      })
      .catch((error) => {
        console.log(error)
      })
  },
  async createPlan({ commit }, plan) {
    await this.$axios
      .post('api/v1/plans', plan)
      .then((response) => {
        commit('addPlan', response.data)
        commit('openPlanDialog', false)
        commit("flashMessage/setMessage", "投稿が成功しました。", { root: true })
        commit("flashMessage/setType", "success", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 3000)
        commit("errorMessage/clearMessages", null, { root: true })
        commit("setSuccessPost", true)
      })
      .catch((error) => {
        commit("flashMessage/setMessage", "投稿が失敗しました。", { root: true })
        commit("flashMessage/setType", "error", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 3000)
        commit("setSuccessPost", false)
        console.log(error)
      })
  },
  async openPlanDialog({ commit }, bool) {
    commit("openPlanDialog", bool)
  },
}