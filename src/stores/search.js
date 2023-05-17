import { defineStore } from 'pinia'

export const useSearchTrainStore = defineStore({
  id: 'searchTrain',
  state: () => ({
    fromStation: '',
    toStation: '',
    date: ''
  })
})
