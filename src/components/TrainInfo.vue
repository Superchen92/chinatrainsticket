<template>
  <div v-for="(order, index) in orders" :key="index">
    <q-badge class="text-subtitle1" style="position: relative; left: -10px; top: 10px; z-index: 999"
      >train {{ order.trainno }}</q-badge
    >
    <div class="row text-center bg-grey-4 q-pb-sm" style="width: 1200px">
      <div class="col-2">
        <p class="text-subtitle1 absolute-center">{{ order.startdate }}</p>
      </div>
      <div class="col-4">
        <div class="">
          <p class="q-mt-sm rounded-borders text-h6">{{ order.from }}</p>
          <span>{{ order.departuretime }}</span>
        </div>
      </div>
      <div class="col-2">
        <div class="absolute-center" style="width: 100%">
          <span>{{ order.seat.name }}</span>
          <q-separator color="black" />
          <p>{{ order.costtime }}</p>
        </div>
      </div>
      <div class="col-4">
        <div class="">
          <p class="q-mt-sm rounded-borders text-h6">{{ order.to }}</p>
          <span>{{ order.arrivaltime }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useBookInfoStore } from '@/stores/bookInfo'

const store = useBookInfoStore()
const orders = store.orders
</script>
