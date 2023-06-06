<template>
  <div>
    <q-table
      flat
      :rows="rows"
      :columns="columns"
      row-key="name"
      hide-bottom
      virtual-scroll
      :virtual-scroll-item-size="20"
      :rows-per-page-options="[0]"
      style="height: 300px"
    />
  </div>
  <div class="text-center q-mt-lg">
    <q-btn
      label="Add Passager"
      color="primary"
      icon="person_add"
      unelevated
      @click="showAddPassager"
    />
  </div>
  <q-table flat :rows="priceRows" :columns="priceColumns" row-key="name" hide-bottom />
  <div class="text-center q-mt-lg">
    <q-btn label="Continue" color="primary" unelevated @click="addContactInfo" />
  </div>
</template>

<script setup>
import { useQuasar } from 'quasar'
import { ref } from 'vue'
import AddPassage from './AddPassager.vue'
import { useBookInfoStore } from '@/stores/bookInfo'
import { useRouter } from 'vue-router'

const $q = useQuasar()
const store = useBookInfoStore()
const router = useRouter()
const priceRows = ref([
  {
    name: 'Adult X0',
    price: store.orders[0].seat.price + ' / person',
    total: store.orders[0].seat.price
  },
  {
    name: 'Child X0',
    price: store.orders[0].seat.price / 2 + ' / person',
    total: 0
  },
  {
    name: 'Service fee X0',
    price: '6.00 / person',
    total: 0
  },
  {
    name: 'Total',
    price: '',
    total: 0
  }
])
const priceColumns = [
  {
    name: 'name',
    required: true,
    align: 'left',
    field: (row) => row.name,
    format: (val) => `${val}`
  },
  { name: 'price', align: 'left', field: 'price' },
  { name: 'total', align: 'center', field: 'total' }
]
const columns = [
  {
    name: 'name',
    required: true,
    label: 'Name',
    align: 'center',
    field: (row) => row.name,
    format: (val) => `${val}`
  },
  { name: 'type', align: 'center', label: 'A/C', field: 'type' },
  { name: 'number', align: 'center', label: 'Passport Number', field: 'number' },
  { name: 'country', align: 'center', label: 'Country Of Passport', field: 'country' }
]

const rows = store.getCurrentOrderCustomers

const showAddPassager = () => {
  $q.dialog({
    component: AddPassage
  }).onOk((data) => {
    //添加乘客清单,存储到store
    store.addPassager({
      name: data.fullName,
      type: data.type,
      number: data.passportNumber,
      country: data.country,
      sex: data.sex,
      passportExDate: data.passportExDate,
      birth: data.birth
    })

    calculateTotalPrice()
  })
}

const calculateTotalPrice = () => {
  //计算价格
  let adultNum = 0
  let childNum = 0
  rows.forEach((item) => {
    if (item.type == 'Adult') {
      adultNum++
    } else {
      childNum++
    }
  })
  priceRows.value[0].name = `Adult X${adultNum}`
  priceRows.value[0].total = store.orders[0].seat.price * adultNum
  priceRows.value[1].name = `Child X${childNum}`
  priceRows.value[1].total = (store.orders[0].seat.price / 2) * childNum
  priceRows.value[2].name = `Service fee X${childNum + adultNum}`
  priceRows.value[2].total = 6 * (childNum + adultNum)
  priceRows.value[3].total =
    priceRows.value[0].total + priceRows.value[1].total + priceRows.value[2].total
}

const addContactInfo = () => {
  if (rows.length == 0) {
    $q.dialog({
      message: 'Please add at least one adult to your passenger list',
      cancel: true,
      persistent: true
    })
  } else {
    router.push('send-booking')
  }
}

if (rows.length > 0) {
  calculateTotalPrice()
}
</script>
