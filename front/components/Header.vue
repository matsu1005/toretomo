<template>
  <v-app-bar
    color="#445CB0" 
    dark 
    app 
    fixed
  >
    <v-toolbar-title>
      <nuxt-link to="/" class="header-link">
        <h2 class="app-title">toretomo</h2>
      </nuxt-link>
    </v-toolbar-title>
    <v-spacer />
    <v-btn color="#445CB0" to="/" class="header-link">
      <span>toretomoについて</span>
    </v-btn>
    <v-btn to="/" class="header-link" plain>
      <span>マイページ</span>
    </v-btn>
    <v-btn to="/" class="header-link" plain>
      <span>login</span>
    </v-btn>
    <v-btn to="/" class="header-link" plain>
      <span>signup</span>
    </v-btn>
    <v-btn to="/" class="header-link" plain>
      <span>logout</span>
    </v-btn>
  </v-app-bar>
</template>


<style lang="scss">
.header-link {
  font-size: 24px;
  text-decoration:none;
  margin: 5px;
  background-color: #445CB0;
}

.v-application a {
  color:white;
}
</style>