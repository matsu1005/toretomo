<template>
  <div style="text-align: center">
    <h4>条件を指定してください</h4>
    <v-list>
      <template v-for="item in events">
        <v-chip
          v-if="!eventSelected.includes(item)"
          :key="item.text"
          class="select-chips"
          :disabled="loading"
          @click="eventSelected.push(item)"
        >
          <v-icon :disabled="loading" v-text="item.icon"></v-icon>
          <v-list-item-title v-text="item.text"></v-list-item-title>
        </v-chip>
      </template>
      <br />
      <template v-for="prec in prefectures">
        <v-chip
          v-if="!precSelected.includes(prec)"
          :key="prec.text"
          class="select-chips"
          :disabled="loading"
          @click="precSelected.push(prec)"
        >
          <v-icon :disabled="loading" v-text="prec.icon"></v-icon>
          <v-list-item-title v-text="prec.text"></v-list-item-title>
        </v-chip>
      </template>
    </v-list>
    <h4>↓以下の条件で絞り込み↓</h4>
    <template v-for="(selection, i) in eventSelections">
      <v-chip
        :key="selection.text"
        class="select-chips"
        color="green"
        :disabled="loading"
        close
        outlined
        @click:close="eventSelected.splice(i, 1)"
      >
        <v-icon left v-text="selection.icon"></v-icon>
        {{ selection.text }}
      </v-chip>
    </template>
    <br />
    <template v-for="(selection, i) in precSelections">
      <v-chip
        :key="selection.text"
        class="select-chips"
        color="green"
        :disabled="loading"
        close
        outlined
        @click:close="precSelected.splice(i, 1)"
      >
        <v-icon left v-text="selection.icon"></v-icon>
        {{ selection.text }}
      </v-chip>
    </template>

    <v-col v-if="!allSelected" cols="12"> </v-col>
  </div>
</template>

<script>
export default {
  data: () => ({
    events: [
      {
        text: "Run",
        icon: "mdi-run",
      },
      {
        text: "Swim",
        icon: "mdi-swim",
      },
      {
        text: "Bike",
        icon: "mdi-bike",
      },
    ],
    prefectures: [
      {
        text: "東京都",
        icon: "mdi-map-marker",
      },
      {
        text: "埼玉県",
        icon: "mdi-map-marker",
      },
      {
        text: "神奈川県",
        icon: "mdi-map-marker",
      },
      {
        text: "千葉県",
        icon: "mdi-map-marker",
      },
      {
        text: "群馬県",
        icon: "mdi-map-marker",
      },
      {
        text: "栃木県",
        icon: "mdi-map-marker",
      },
      {
        text: "茨城県",
        icon: "mdi-map-marker",
      },
      {
        text: "山梨県",
        icon: "mdi-map-marker",
      },
    ],
    loading: false,
    eventSelected: [],
    precSelected: [],
    eventTags: [],
    precTags: [],
  }),
  computed: {
    allSelected() {
      return (
        this.precSelected.length + this.eventSelected.length ===
        this.prefectures.length + this.events.length
      )
    },
    eventSelections() {
      const eventSelections = []
      this.eventTags = []
      for (const selection of this.eventSelected) {
        eventSelections.push(selection)
        this.eventTags.push(selection.text)
      }
      return eventSelections
    },
    precSelections() {
      const precSelections = []
      this.precTags = []
      for (const selection of this.precSelected) {
        precSelections.push(selection)
        this.precTags.push(selection.text)
      }
      return precSelections
    },
  },
  watch: {
    precSelections() {
      this.searchTag()
    },
    eventSelections() {
      this.searchTag()
    },
  },
  methods: {
    next() {
      this.loading = true
      setTimeout(() => {
        this.search = ""
        this.selected = []
        this.loading = false
      }, 2000)
    },
    async searchTag() {
      console.log(this.tags)
      await this.$axios
        .$get("/api/v1/plans/search", {
          params: { event: this.eventTags, prec: this.precTags },
        })
        .then(
          (response) => {
            this.$store.commit("plan/setPlans", response)
            return response
          },
          (error) => {
            return error
          }
        )
    },
  },
}
</script>

<style lang="scss">
.select-chips {
  margin: 5px;
}
</style>
