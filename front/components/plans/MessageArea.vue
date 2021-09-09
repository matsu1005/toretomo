<template>
  <div>
    <v-container style="min-height: 200px">
      <p>
        <strong>トークスペース</strong>
        <v-btn small dense class="mb-2" @click="scrollToEnd()"
          >下まで移動する</v-btn
        >
      </p>
      <v-list three-line style="padding: 0px">
        <template>
          <v-list-item v-for="(msg, index) in messages" :key="index">
            <nuxt-link
              style="text-decoration: none"
              :to="{ path: `/users/${msg.user_id}` }"
            >
              <v-avatar
                color="#445CB0"
                size="45"
                class="mr-2"
                style="margin-top: 0"
              >
                <template v-if="msg.user.icon.url !== null">
                  <v-img :src="msg.user.icon.url" />
                </template>
                <template v-else>
                  <v-icon dark size="25"> mdi-account-circle </v-icon>
                </template>
              </v-avatar>
            </nuxt-link>
            <div>
              <v-card
                v-if="msg.user_id === $store.state.currentUser.user.id"
                label
                color="#ffdead"
                class="pa-2"
              >
                <v-img
                  v-if="msg.image.url"
                  max-width="450"
                  :src="msg.image.url"
                ></v-img>
                {{ msg.content }}
                <v-btn text icon @click="deleteMessage(msg.id)">
                  <v-icon size="25"> mdi-delete </v-icon>
                </v-btn>
              </v-card>
              <v-card v-else label color="#f0f8ff" class="pa-2">
                <v-img
                  v-if="msg.image.url"
                  max-width="450"
                  :src="msg.image.url"
                ></v-img>
                {{ msg.content }}
              </v-card>
              <small style="color: gray">{{
                $dayjs(msg.created_at).format("YYYY-MM-DD HH:mm")
              }}</small>
            </div>
          </v-list-item>
        </template>
      </v-list>
      <v-btn small dense @click="scrollToTop()">上まで移動する</v-btn>
    </v-container>
    <v-footer color="transparent" height="60" style="margin: 0 auto">
      <v-text-field
        v-model="message.content"
        background-color="grey lighten-3"
        dense
        solo
      >
      </v-text-field>
      <v-col cols="3">
        <v-file-input
          v-model="message.image"
          accept="image/png, image/jpeg, image/bmp"
          prepend-icon="mdi-image"
          label="画像を選択"
          style="margin-bottom: 25px"
          hide-detail
        />
      </v-col>
      <v-btn
        color="primary"
        small
        rounded
        :disabled="!$auth.loggedIn"
        style="margin: 0 0 25px 5px"
        @click="postMessage()"
      >
        <v-icon size="15"> mdi-send </v-icon>
      </v-btn>
    </v-footer>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex"

export default {
  props: {
    plan: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      offsetTop: 0,
      message: {
        user_id: this.$store.state.currentUser.user.id,
        plan_id: this.plan.id,
        content: "",
        image: null,
      },
    }
  },
  computed: {
    ...mapGetters({
      messages: "message/messages",
    }),
  },
  created() {
    this.setMessaages(this.$route.params.id)
  },
  methods: {
    ...mapActions({
      setMessaages: "message/setMessages",
      createMessage: "message/createMessage",
      destroyMessage: "message/destroyMessage",
    }),
    scrollToEnd() {
      let footer = this.$el.querySelector(".v-footer")
      footer.scrollIntoView({ behavior: "smooth", block: "start" })
    },
    scrollToTop() {
      let footer = this.$el.querySelector(".mb-2")
      footer.scrollIntoView({ behavior: "smooth", block: "center" })
    },
    postMessage() {
      console.log(this.message.image)
      if (this.message.content.trim() == "" && this.message.image === null) {
        this.message.content = ""
        alert("メッセージを入力してください。")
        return
      }
      this.createMessage(this.message)
      this.message.content = ""
      this.message.image = null
    },
    deleteMessage(msgId) {
      let params = {
        id: msgId,
        plan_id: this.$route.params.id,
      }
      this.destroyMessage(params)
    },
  },
}
</script>
