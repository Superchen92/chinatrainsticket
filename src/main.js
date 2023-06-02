import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { Quasar, Dialog } from 'quasar'

//load lang
import langEn from 'quasar/lang/en-US'
// Import icon libraries
import '@quasar/extras/material-icons/material-icons.css'
// Import Quasar css
import 'quasar/src/css/index.sass'
import App from './App.vue'
import router from './router'
import piniaPersist from 'pinia-plugin-persist'

const app = createApp(App)
const pinia = createPinia()
pinia.use(piniaPersist)

app
  .use(pinia)
  .use(Quasar, {
    lang: langEn,
    plugins: {
      Dialog
    }
  })
  .use(router)
  .mount('#app')
