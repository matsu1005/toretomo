<template>
  <div style="margin:15px">
    <p>
      <strong>参加者一覧</strong>
    </p>
    <div v-if="joins[0]" style="display:flex">
      <div v-for="join in joins" :key="join.id" class="mx-2" style="text-align:center">
        <nuxt-link style="text-decoration: none;" :to="{ path: `/users/${join.user.id}` }">
          <v-avatar v-if="join.user.icon.url" size="56" class="ma-auto">
            <v-img
              alt="user"
              :src="join.user.icon.url"
            />
          </v-avatar >
          <v-avatar v-else size="56" color="#445CB0" class="ma-auto">
            <v-icon dark size="35">
              mdi-account-circle
            </v-icon>
          </v-avatar>
        </nuxt-link>
        <p><small>{{join.user.name}}</small></p>
      </div>
    </div>
    <div v-else>
      参加者がいません。
    </div>
  </div>
</template>

<script>
export default {
  props: {
    joins: {
      type: Array,
      required: true
    }
  }
}
</script>