export const state = () => ({
  plans: [],
})
export const getters = {
  plans: (state) => state.plans,
}
export const mutations = {
  setPlans(state, plans) {
    state.plans = plans.data
  },
}

/* eslint-disable */
export const actions = {
  // setPost({ commit, rootState }, payload) {
  // },
  async getPlans({ commit }) {
    const plans = {
      data: '',
    }
    await this.$axios
      .get('api/v1/plans')
      .then((res) => {
        plans.data = res.data
        commit('setPlans', plans)
      })
      .catch((error) => {
        console.log(error)
      })
  }
}