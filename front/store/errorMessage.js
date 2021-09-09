export const state = () => ({
  messages: "",
})

export const getters = {
  getMessages: (state) => state.messages,
  existsMessages: (state) => state.messages !== "",
}

export const mutations = {
  setMessages(state, messages) {
    state.messages = messages
  },
  clearMessages(state) {
    state.messages = ""
  },
}

export const actions = {
  setMessages({ commit }, messages) {
    commit("setMessages", messages)
  },
  clearMessages({ commit }) {
    commit("clearMessages")
  },
}
