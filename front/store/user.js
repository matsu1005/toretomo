export const state = () => ({
  user: {}
})

export const getters = {
  user: (state) => state.user
}

export const mutations = {
  setUser(state, user) {
    state.user = user
  }
}

export const actions = {
  async setUser({ commit }, paramsId) {
    await this.$axios
      .get(`api/v1/users/${paramsId}`)
      .then((response) => {
        commit('setUser', response.data)
      })
      .catch((error) => {
        console.log(error)
      })
  }
}