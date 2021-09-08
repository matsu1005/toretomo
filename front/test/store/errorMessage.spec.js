const Vuex = require("vuex")
const messages = require("../../store/errorMessage")
const { createLocalVue } = require("@vue/test-utils")
const cloneDeep = require("lodash.clonedeep")

const localVue = createLocalVue()
localVue.use(Vuex)

describe("エラーメッセージ", () => {
  let store

  beforeEach(() => {
    store = new Vuex.Store(cloneDeep(messages))
  })

  describe("actions", () => {
    test("エラーメッセージが表示されるか", async () => {
      const payload = "testmessage"
      await store.dispatch("setMessages", payload)
      expect(store.getters["messages"]).toEqual(payload.messages)
      await store.dispatch("clearMessages")
      expect(store.getters["messages"]).toBeUndefined()
    })
  })
})
