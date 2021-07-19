<template>
  <v-carousel height="400">
    <v-carousel-item
      v-for="(item,i) in items"
      :key="i"
      :src="item.src"
      reverse-transition="fade-transition"
      transition="fade-transition"
    ></v-carousel-item>
  </v-carousel>
</template>

<script>
  export default {
    data () {
      return {
        items: [
          {
            src: require("@/assets/img/run.jpg"),
          },
          {
            src: require("@/assets/img/swim.jpg"),
          },
        ],
      }
    },
  }
</script>