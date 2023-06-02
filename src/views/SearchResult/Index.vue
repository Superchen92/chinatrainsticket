<template>
  <div class="q-mt-md">
    <SearchTrain
      :fromStation="searchStore.fromStation"
      :toStation="searchStore.toStation"
      :date="searchStore.date"
    />
  </div>
  <div class="q-mt-lg">
    <TrainsList :list="trainlist" />
  </div>
</template>

<script setup>
import SearchTrain from '@/components/SearchTrain.vue'
import TrainsList from './components/TrainsList.vue'
import { useSearchTrainStore } from '@/stores/search'
import { ref } from 'vue'

const searchStore = useSearchTrainStore()
const trainlist = ref([])

fetch('http://localhost:8000/search-train', {
  method: 'post',
  body: JSON.stringify({
    from: searchStore.fromStation,
    to: searchStore.toStation,
    date: searchStore.date
  }),
  headers: {
    Accept: '*/*',
    'Content-Type': 'application/json'
  }
})
  .then((res) => res.json())
  .then((data) => {
    trainlist.value = data.result.list
  })
</script>
