<template>
  <p class="text-h6 q-mt-lg">How to receive tickets?</p>
  <p>
    <q-avatar icon="done" color="red" size="xs" text-color="white" />
    <span class="q-pl-sm"
      >Receive e-ticket by email (Recieve voucher by email and redeem tickets at railway
      station)</span
    >
  </p>
  <p class="text-h6 q-mt-lg">Contact Infomation</p>
  <q-form @submit.prevent="onSubmit" class="q-gutter-md">
    <div class="row">
      <div class="col-6">
        <q-input
          filled
          v-model="model.name"
          label="Surname/Given Name"
          lazy-rules
          dense
          :rules="[(val) => (val && val.length > 0) || 'Please type something']"
          clearable
        />
        <q-input
          filled
          v-model="model.email"
          label="Email"
          lazy-rules
          dense
          :rules="[
            (val) => (val && val.length > 0 && val.indexOf('@') > 0) || 'Please type something'
          ]"
          clearable
        />
        <q-input
          filled
          v-model="model.phone"
          label="Tel / Mobile"
          lazy-rules
          dense
          hide-hint
          :rules="[(val) => (val && val.length > 0) || 'Please type something']"
        />
      </div>
      <div class="col-12 text-center">
        <div>
          <q-btn label="Book Now" color="primary" type="submit" />
        </div>
      </div>
    </div>
  </q-form>
</template>

<script setup>
import { reactive } from 'vue'
import { useBookInfoStore } from '@/stores/bookInfo'

const model = reactive({
  name: '',
  email: '',
  phone: ''
})
const bookInfoStore = useBookInfoStore()
console.log(bookInfoStore.getCurrentOrder)
const onSubmit = () => {
  const postJson = {
    contactName: model.name,
    contactEmail: model.email,
    contactPhone: model.phone,
    details: {
      from: '北京',
      to: '上海',
      fromStation: bookInfoStore.getCurrentOrder.from,
      toStation: bookInfoStore.getCurrentOrder.to,
      depatureTime: bookInfoStore.getCurrentOrder.departuretime,
      arrivalTime: bookInfoStore.getCurrentOrder.arrivaltime,
      costTime: bookInfoStore.getCurrentOrder.costtime,
      startDate: bookInfoStore.getCurrentOrder.startdate,
      trainNo: bookInfoStore.getCurrentOrder.trainno,
      seat: bookInfoStore.getCurrentOrder.seat.name,
      seatPrice: bookInfoStore.getCurrentOrder.seat.price
    },
    customers: bookInfoStore.getCurrentOrder.customers
  }

  fetch('http://localhost:8000/api/add-orders', {
    method: 'POST',
    body: JSON.stringify(postJson),
    headers: {
      Accept: '*/*',
      'Content-Type': 'application/json'
    }
  }).then((res) => {
    console.log(res.json())
  })
}
</script>
