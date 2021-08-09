export const state = () => ({
  user: {}
})

export const getters = {
  user: (state) => state.user,
}

export const mutations = {
  setCurrentUser(state, user) {
    state.user = user
  }
}

export const actions = {
  setCurrentUser( { commit }, user) {
    commit('setCurrentUser', user)
  }
}