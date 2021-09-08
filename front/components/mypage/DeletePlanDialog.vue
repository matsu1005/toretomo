<template>
  <v-dialog v-model="deleteDialog" max-width="350px">
    <v-card rounded="lg" style="text-align: center" class="pb-5">
      <v-card-title>
        <p style="width: 100%">本当に削除しますか？</p>
      </v-card-title>
      <div style="text-align: center">
        <v-btn class="mx-5" color="primary" @click="deleteDialog = false">
          戻る
        </v-btn>
        <v-btn class="mx-5" color="error" @click="deleteMyPlan()"> 削除 </v-btn>
      </div>
    </v-card>
  </v-dialog>
</template>

<script>
import { mapActions } from "vuex"
export default {
  props: {
    plan: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      deleteDialog: true,
    }
  },
  methods: {
    ...mapActions({
      deletePlan: "plan/deletePlan",
    }),
    deleteMyPlan() {
      this.deletePlan(this.plan)
      this.deleteDialog = false
    },
  },
  watch: {
    deleteDialog() {
      this.$emit("close")
    },
  },
}
</script>
