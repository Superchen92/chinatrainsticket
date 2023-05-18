import { defineStore } from 'pinia'

export const useBookInfoStore = defineStore({
  id: 'searchTrain',
  state: () => ({
    orders: []
  })
})
