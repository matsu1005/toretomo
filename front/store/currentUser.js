export const state = () => ({
  user: {}
})

export const getters = {
  user: (state) => state.user,
}

export const mutations = {
  setCurrentUser(state, user) {
    state.user = user
  },
  clearCurrentUser(state) {
    state.user = {}
  }
}

export const actions = {
  setCurrentUser( { commit }, user) {
    this.$axios
      .$get(`/api/v1/users/${user.id}`)
      .then((response) => {
        commit('setCurrentUser', response)
        console.log(response)
    })
  },
  clearCurrentUser( { commit } ) {
    commit('clearCurrentUser')
  }
}
