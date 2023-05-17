<template>
  <div class="q-mt-md">
    <SearchTrain
      :fromStation="searchStore.fromStation"
      :toStation="searchStore.toStation"
      :date="searchStore.date"
    />
  </div>
  <div class="q-mt-lg">
    <TrainsList />
  </div>
</template>

<script setup>
import SearchTrain from '@/components/SearchTrain.vue'
import TrainsList from './components/TrainsList.vue'
import { useSearchTrainStore } from '@/stores/search'

const searchStore = useSearchTrainStore()
</script>
