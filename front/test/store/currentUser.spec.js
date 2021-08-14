const Vuex = require('vuex')
const currentUser = require('../../store/currentUser')
const { createLocalVue } = require('@vue/test-utils')
const cloneDeep = require('lodash.clonedeep')

const localVue = createLocalVue()
localVue.use(Vuex)

describe('store/currentUser', () => {
  let store

  beforeEach(() => {
    store = new Vuex.Store(cloneDeep(currentUser))
  })

  describe('actions', () => {
    test('認証済みユーザーの情報を保持しているか', async () => {
      const payload =  { name: "test太郎", email: "test@example.com" }
      await store.dispatch('setCurrentUser', payload)
      expect(store.getters.user.name).toEqual(payload.name)
    })
  })

})