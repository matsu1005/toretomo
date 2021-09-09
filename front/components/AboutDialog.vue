<template>
  <v-dialog v-model="aboutDialog" max-width="700px">
    <v-card class="mt-5">
      <v-btn icon large style="position: fixed" @click="aboutDialog = false">
        <v-icon>mdi-close</v-icon>
      </v-btn>
      <v-row justify="center">
        <v-card-title cols="12" class="ma-5 display-1"
          ><strong>toretomoについて</strong></v-card-title
        >
        <v-card-text style="text-align: center">
          <b
            >「気軽にトレーニング友達を見つけよう」をコンセプトにアプリを制作しました。</b
          ><br /><br />

          少し体を動かしたい。だけど、なんだか気分がのらない、、、<br />
          そのようなことを経験したことはないでしょうか？<br />
          ひとりでモチベーション管理が難しい時、<b>仲間いればどれだけ心強い</b>だろうか。<br />
          <br />
          <b>「toretomo」</b>は、そんな課題を解決するために<br />
          気軽にトレーニング友達を見つけられる機会を提供します。<br /><br />
        </v-card-text>
        <v-card-title><strong>アプリの使い方</strong></v-card-title>
        <v-card-text style="text-align: center">
          <v-card-subtitle class="subtitle"
            ><strong>その１</strong></v-card-subtitle
          >
          <p class="subtitle">気になる練習プランを見つける</p>
          <v-img
            max-width="600"
            class="ma-auto"
            :src="require('@/assets/img/about/filter-plans.gif')"
          ></v-img>
        </v-card-text>
        <v-card-text style="text-align: center">
          <v-card-subtitle class="subtitle"
            ><strong>その２</strong></v-card-subtitle
          >
          <p class="subtitle">詳細情報を確認する</p>
          <v-img
            max-width="600"
            class="ma-auto"
            contain
            :src="require('@/assets/img/about/get-plan.gif')"
          ></v-img>
        </v-card-text>
        <v-card-text style="text-align: center">
          <v-card-subtitle class="subtitle"
            ><strong>その３</strong></v-card-subtitle
          >
          <p class="subtitle">メッセージを送ってみる</p>
          <v-img
            max-width="600"
            class="ma-auto"
            contain
            :src="require('@/assets/img/about/send-msg.gif')"
          ></v-img>
        </v-card-text>
        <v-card-text style="text-align: center">
          <v-card-subtitle class="subtitle"
            ><strong>その４</strong></v-card-subtitle
          >
          <p class="subtitle">練習に参加する！</p>
          <v-img
            max-width="600"
            class="ma-auto"
            contain
            :src="require('@/assets/img/about/join-plan.gif')"
          ></v-img>
        </v-card-text>
        <v-card-title cols="12" class="ma-5 display-1"
          ><strong>Lets's training ！！</strong></v-card-title
        >
      </v-row>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  data() {
    return {
      aboutDialog: true,
    }
  },
  watch: {
    aboutDialog() {
      this.$emit("close")
    },
  },
}
</script>

<style>
.intro-content {
  font-size: 17px;
}
.subtitle {
  font-size: 18px;
}
</style>
