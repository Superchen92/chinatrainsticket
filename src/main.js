import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { Quasar } from 'quasar'

//load lang
import langEn from 'quasar/lang/en-US'
// Import icon libraries
import '@quasar/extras/material-icons/material-icons.css'
// Import Quasar css
import 'quasar/src/css/index.sass'
import App from './App.vue'
import router from './router'

const app = createApp(App)

app
  .use(createPinia())
  .use(Quasar, {
    lang: langEn
  })
  .use(router)
  .mount('#app')
