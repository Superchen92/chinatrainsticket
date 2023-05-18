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
  <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
    <div class="row">
      <div class="col-6">
        <q-input
          filled
          v-model="model.name"
          label="Surname/Given Name"
          lazy-rules
          dense
          :rules="[(val) => (val && val.length > 0) || 'Please type something']"
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
        />
        <q-input
          filled
          v-model="model.phone"
          label="Tel / Mobile"
          lazy-rules
          dense
          :rules="[(val) => (val && val.length > 0) || 'Please type something']"
        />
      </div>
      <div class="col-12 text-center">
        <q-btn label="Book Now" color="primary" type="submit" />
      </div>
    </div>
  </q-form>
</template>

<script setup>
import { reactive } from 'vue'

const model = reactive({
  name: '',
  email: '',
  phone: ''
})
const onSubmit = () => {}
</script>
