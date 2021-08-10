<template>
  <div>
    <v-row justify="center">
      <p cols="12" class="mt-3 display-1">
        テストさんのマイページ
      </p>
    </v-row>
    <v-row justify="center">
      <div outlined class="pa-5">
        <div style="float:left;">
          <v-avatar
            color="primary"
            size="100"
          >
            <v-icon>
              mdi-account-circle
            </v-icon>
          </v-avatar>
          <div style="text-align:center">
            <p class="mb-0"><small>生年月日 : </small></p>
            <p class="mb-0"><small>2020年10月10日</small></p>
            <p class="mb-0"><small>性別 : 男性</small></p>
          </div>
          <v-spacer></v-spacer>
          <v-btn
            outlined
            class="mx-4 my-5"
            text
          >
            編集
          </v-btn>
        </div>
        <div style="max-width: 800px">
          <p><strong>プロフィール</strong></p>
          <p class="text--primary">
            test test test test test test test test test test test test test test test test test test test test test test test test test test test test 
          </p>
        </div>
      </div>
    </v-row>
  </div>
</template>


