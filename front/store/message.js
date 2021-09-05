export const state = () => ({
  messages: {}
})

export const getters = {
  messages: (state) => state.messages
}

export const mutations = {
  setMessages(state, messages) {
    state.messages = messages
  }
}

export const actions = {
  async setMessages({ commit }, paramsId) {
    await this.$axios
      .get(`api/v1/plans/${paramsId}/messages`)
      .then((response) => {
        commit('setMessages', response.data)
      })
      .catch((error) => {
        console.log(error)
      })
  },
  async createMessage({ commit }, message) {
    console.log()
    const form = new FormData()
    form.append("content", message.content)
    form.append("user_id", message.user_id)
    form.append("plan_id", message.plan_id)
    if (message.image !== null) {
      form.append("image", message.image)
    }
    await this.$axios
      .post(`api/v1/plans/${message.plan_id}/messages`, form, {
          headers: {
            "Content-Type": "multipart/form-data",
          },
      })
      .then((response) => {
        this.$axios.get(`api/v1/plans/${message.plan_id}/messages`)
          .then((response) => {
            commit('setMessages', response.data)
        })
        commit("flashMessage/setMessage", "投稿が成功しました。", { root: true })
        commit("flashMessage/setType", "success", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
      })
      .catch((error) => {
        commit("flashMessage/setMessage", "投稿が失敗しました。", { root: true })
        commit("flashMessage/setType", "error", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 3000)
        console.log(error)
      })
  },
  async destroyMessage({ commit }, params) {
    await this.$axios
      .delete(`api/v1/plans/${params.plan_id}/messages`, {params: params})
      .then((response) => {
        this.$axios.get(`api/v1/plans/${params.plan_id}/messages`)
          .then((response) => {
            commit('setMessages', response.data)
        })
        commit("flashMessage/setMessage", "メッセージを削除しました。", { root: true })
        commit("flashMessage/setType", "success", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 2000)
      })
      .catch((error) => {
        commit("flashMessage/setMessage", "メッセージの削除に失敗しました。", { root: true })
        commit("flashMessage/setType", "error", { root: true })
        commit("flashMessage/setStatus", true, { root: true })
        setTimeout(() => {
          commit("flashMessage/setStatus", false, { root: true })
        }, 3000)
        console.log(error)
      })
  }
}