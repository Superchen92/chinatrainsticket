<template>
  <div class="fixed-center" style="margin-top: -50px">
    <SearchTrain @submit-search="showSearchResults" />
  </div>
</template>

<script setup>
import SearchTrain from '../components/SearchTrain.vue'
import { useRouter } from 'vue-router'
import { useSearchTrainStore } from '@/stores/search.js'
import { useMeta } from 'quasar'

const router = useRouter()
const searchStore = useSearchTrainStore()
const showSearchResults = (data) => {
  searchStore.$patch({
    fromStation: data.fromStation,
    toStation: data.toStation,
    date: data.date
  })
  router.push('search-result')
}

useMeta(() => {
  return {
    title: 'china train',
    meta: {
      keywords: { name: 'keywords', content: 'china train bookings' }
    }
  }
})
</script>
