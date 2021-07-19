<template>
  <div style="text-align:center;">    
    <v-divider v-if="!allSelected"></v-divider>
    <h4>条件を指定してください</h4>
    <v-list>
      <template v-for="item in events">
        <v-chip
          class="select-chips"
          v-if="!selected.includes(item)"
          :key="item.text"
          :disabled="loading"
          @click="selected.push(item)"
        >
          <v-icon
            :disabled="loading"
            v-text="item.icon"
          ></v-icon>
          <v-list-item-title v-text="item.text"></v-list-item-title>
        </v-chip>
      </template>
      <br>
      <template v-for="prec in prefectures">
        <v-chip
          class="select-chips"
          v-if="!selected.includes(prec)"
          :key="prec.text"
          :disabled="loading"
          @click="selected.push(prec)"
        >
          <v-icon
            :disabled="loading"
            v-text="prec.icon"
          ></v-icon>
          <v-list-item-title v-text="prec.text"></v-list-item-title>
        </v-chip>
      </template>
    </v-list>
    <h4>↓以下の条件で絞り込み↓</h4> 
    <template
      v-for="(selection, i) in selections"
    >
      <v-chip
        class="select-chips"
        color="green"
        :disabled="loading"
        close
        outlined
        @click:close="selected.splice(i, 1)"
        :key="selection.text"
      >
        <v-icon
          left
          v-text="selection.icon"
        ></v-icon>
        {{ selection.text }}
      </v-chip>
    </template>

    <v-col
      v-if="!allSelected"
      cols="12"
    >
    </v-col>

  </div>
</template>

<script>
  export default {
    data: () => ({
      events: [
        {
          text: 'Run',
          icon: 'mdi-run',
        },
        {
          text: 'Swim',
          icon: 'mdi-swim',
        },
        {
          text: 'Bike',
          icon: 'mdi-bike',
        }
      ],
      prefectures: [
        {
          text: '東京都',
          icon: 'mdi-map-marker',
        },
        {
          text: '埼玉県',
          icon: 'mdi-map-marker',
        },
        {
          text: '神奈川県',
          icon: 'mdi-map-marker',
        },
        {
          text: '千葉県',
          icon: 'mdi-map-marker',
        },
        {
          text: '群馬県',
          icon: 'mdi-map-marker',
        },
        {
          text: '栃木県',
          icon: 'mdi-map-marker',
        },
        {
          text: '茨城県',
          icon: 'mdi-map-marker',
        },
        {
          text: '山梨県',
          icon: 'mdi-map-marker',
        },
      ],
      loading: false,
      search: '',
      selected: [],
    }),
    computed: {
      allSelected () {
        return this.selected.length === this.events.length
      },
      selections () {
        const selections = []
        for (const selection of this.selected) {
          selections.push(selection)
        }
        return selections
      },
    },
    watch: {
      selected () {
        this.search = ''
      },
    },
    methods: {
      next () {
        this.loading = true
        setTimeout(() => {
          this.search = ''
          this.selected = []
          this.loading = false
        }, 2000)
      },
    },
  }
</script>

<style lang="scss">
.select-chips {
  margin: 5px;
}
  
</style>