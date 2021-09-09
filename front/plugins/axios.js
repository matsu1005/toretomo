export default function ({ $axios, store, app }) {
  $axios.onRequest((config) => {
    config.headers.client = window.localStorage.getItem("client")
    config.headers["access-token"] = window.localStorage.getItem("access-token")
    config.headers.uid = window.localStorage.getItem("uid")
    config.headers["token-type"] = window.localStorage.getItem("token-type")
  })

  $axios.onResponse((response) => {
    if (response.headers.client) {
      localStorage.setItem("access-token", response.headers["access-token"])
      localStorage.setItem("client", response.headers.client)
      localStorage.setItem("uid", response.headers.uid)
      localStorage.setItem("token-type", response.headers["token-type"])
    }
  })

  $axios.onError((error) => {
    if (!error.response) {
      return
    }
    const code = error.response.status
    const method = error.response.config.method
    if (code === 422) {
      const messages = error.response.data.errors.full_messages
      store.commit("errorMessage/setMessages", messages)
      return
    }
    if (code === 401) {
      const messages = error.response.data.errors
      store.commit("errorMessage/setMessages", messages)
      return
    }
    if (code === 400) {
      const messages = error.response.data.errors.error
      store.commit("errorMessage/setMessages", messages)
      return
    }
    if (code === 404 && method == "get") {
      app.router.push({ path: "/errors/404" })
      return
    }
  })
}
