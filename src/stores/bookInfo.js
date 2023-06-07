import { defineStore } from 'pinia'

export const useBookInfoStore = defineStore('BookInfo', {
  state: () => ({
    orders: [],
    currentOrderIndex: 0
  }),
  persist: {
    enabled: true
  },
  getters: {
    getCurrentOrderCustomers() {
      return this.orders[this.currentOrderIndex]?.customers
    },
    getCurrentOrderSeatPrice() {
      return this.orders[this.currentOrderIndex]?.seat.price
    },
    getCurrentOrder() {
      return this.orders[this.currentOrderIndex]
    }
  },
  actions: {
    addOrder(order) {
      this.orders.push(order)
    },
    addPassager(passager) {
      this.orders[this.currentOrderIndex].customers.push(passager)
    }
  }
})
