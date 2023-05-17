<template>
  <div class="fixed-center" style="margin-top: -50px">
    <SearchTrain @submit-search="showSearchResults" />
  </div>
</template>

<script setup>
import SearchTrain from '../components/SearchTrain.vue'
import { useRouter } from 'vue-router'
import { useSearchTrainStore } from '@/stores/search.js'

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
</script>
