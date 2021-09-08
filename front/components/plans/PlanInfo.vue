<template>
  <v-row>
    <v-card
      outlined
      class="pa-5"
      max-width="800"
      style="display: flex; border: none; margin: auto"
    >
      <div>
        <p class="ml-4" style="font-size: 24px"><strong>主催者</strong></p>
        <nuxt-link
          style="text-decoration: none"
          :to="{ path: `/users/${plan.user_id}` }"
        >
          <v-avatar color="#445CB0" size="100" style="margin: 0">
            <template v-if="plan.user.icon.url !== null">
              <v-img :src="plan.user.icon.url" />
            </template>
            <template v-else>
              <v-icon dark size="70"> mdi-account-circle </v-icon>
            </template>
          </v-avatar>
        </nuxt-link>
        <p class="ml-3 mt-1" style="color: dimgray">{{ plan.user.name }}</p>
      </div>
      <div class="ml-5">
        <div>
          <div>
            <strong class="mr-3">{{ plan.title }}</strong>
            <v-chip color="green" outlined class="mb-1">{{
              plan.event_cls
            }}</v-chip>
            <v-chip color="primary" outlined class="mb-1">{{
              plan.train_strength
            }}</v-chip>
          </div>
          <p class="mt-5">
            <v-icon color="orange">mdi-calendar</v-icon>
            開催日時 :
            <strong class="mr-3"
              >{{ $dayjs(plan.start_ymd).format("MM月DD日") }}
              {{ $dayjs(plan.start_time).format("HH:mm") }}</strong
            >
            所要時間 : <strong>{{ plan.duration }}時間</strong>
          </p>
          <p>
            <v-icon color="orange">mdi-map-marker</v-icon>
            集合場所 : <strong class="mr-3">{{ plan.place }}</strong> エリア区分
            : <strong>{{ plan.prefecture }}</strong>
          </p>
          {{ plan.detail }}
        </div>
      </div>
    </v-card>
  </v-row>
</template>

<script>
export default {
  props: {
    plan: {
      type: Object,
      required: true,
    },
  },
}
</script>
