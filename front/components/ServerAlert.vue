<template>
  <v-row justify="center" v-if="existsMessages">
    <v-alert 
      border="right"
      colored-border
      type="error"
      elevation="2"
      max-width=500
      style="padding: 5px 16px">
      <ul>
        <li v-for="(msg, index) in messages" :key="index"
          style="list-style: square;">
          <!-- <small>{{msg}}</small> -->
          {{msg}}
        </li>
      </ul>
    </v-alert>
  </v-row>
</template>

<script>
import { mapGetters　} from "vuex" 

export default {
  computed: {
    ...mapGetters({
      messages: 'errorMessage/getMessages',
      existsMessages: 'errorMessage/existsMessages'
    })
  },
}
</script>