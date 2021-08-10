<template>
  <v-list three-line>
    <template v-for="(item, index) in items">
      <v-subheader
        v-if="item.header"
        :key="item.header"
        v-text="item.header"
      ></v-subheader>

      <v-divider
        v-else-if="item.divider"
        :key="index"
        :inset="item.inset"
      ></v-divider>

      <v-list-item
        v-else
        :key="item.title"
      >
        <v-list-item-avatar>
          <v-img :src="item.avatar"></v-img>
        </v-list-item-avatar>

        <v-list-item-content>
          <v-list-item-title v-html="item.name"></v-list-item-title>
          <v-list-item-subtitle class="pr-5">
            {{item.profile | omittedText}}
          </v-list-item-subtitle>
        </v-list-item-content>
        <v-btn
          color="primary"
          small
        >
          フォロー
        </v-btn>
      </v-list-item>
    </template>
  </v-list>
</template>

<script>
  export default {
    data: () => ({
      items: [
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/1.jpg',
          name: 'Mike',
          profile: `I'll be in your neighborhood doing errands this weekend. Do you want to hang out?`,
        },
        { divider: true, inset: true },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/2.jpg',
          name: 'Sccot',
          profile: `Wish I could come, but I'm out of town this weekend. Wish I could come, but I'm out of town this weekend.Wish I could come, but I'm out of town this weekend.Wish I could come, but I'm out of town this weekend.Wish I could come, but I'm out of town this weekend.Wish I could come, but I'm out of town this weekend.Wish I could come, but I'm out of town this weekend.Wish I could come, but I'm out of town this weekend.Wish I could come, but I'm out of town this weekend.Wish I could come, but I'm out of town this weekend.Wish I could come, but I'm out of town this weekend.Wish I could come, but I'm out of town this weekend.`
        },
        { divider: true, inset: true },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg',
          name: 'Merry',
          profile: 'Do you have Paris recommendations? Have you ever been?',
        },
        { divider: true, inset: true },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg',
          name: 'Andle',
          profile: 'こんにちは　テストメッセージを入力しています。　こんにちは　テストメッセージを入力しています。　こんにちは　テストメッセージを入力しています。　こんにちは　テストメッセージを入力しています。　こんにちは　テストメッセージを入力しています。　こんにちは　テストメッセージを入力しています。　こんにちは　テストメッセージを入力しています。',
        },
        { divider: true, inset: true },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/5.jpg',
          name: 'Rucy',
          profile: 'We should eat this: Grate, Squash, Corn, and tomatillo Tacos.',
        },
      ],
    }),
  filters: {
    omittedText(text) {
     return text.length > 300 ? text.slice(0, 300) + "..." : text;
    }
  },
  }
</script>