<template>
  <div class="bg-grey-4 q-pa-lg">
    {{ customerInfo }}
    <div class="row text-h6" v-for="(customer, index) in customers" :key="index">
      <div class="col-2">{{ customer.name }}</div>
      <div class="col-2">{{ customer.type }}</div>
      <div class="col-2">{{ customer.number }}</div>
      <div class="col-2">{{ customer.country }}</div>
      <div class="col-2">USD {{ calculatePrice(customer.type) }}</div>
    </div>
    <q-separator class="q-mt-md" />
    <div class="row q-mt-md">
      <div class="col-6">
        <q-btn unelevated label="Remove" color="grey-3" text-color="black" />
      </div>
      <div class="col-6 text-right">
        <p>Service fee: 6.00 × {{ customers.length }} = USD {{ 6 * customers.length }}</p>
        <p>Subtotal: USD {{ calculateTotalPrice }}</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useBookInfoStore } from '@/stores/bookInfo'
import { computed } from 'vue'

const bookInfoStore = useBookInfoStore()
const customers = bookInfoStore.getCurrentOrderCustomers
const seatPrice = bookInfoStore.getCurrentOrderSeatPrice

const calculatePrice = computed(() => {
  return (type) => {
    if (type == 'Child') {
      return seatPrice / 2
    } else {
      return seatPrice
    }
  }
})

const calculateTotalPrice = computed(() => {
  let total = 0
  customers.forEach((customer) => {
    if (customer.type == 'Child') {
      total += seatPrice / 2
    } else {
      total += seatPrice
    }
  })

  //计算服务费
  total += customers.length * 6

  return total
})
</script>
