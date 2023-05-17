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
    <q-btn label="Continue" color="primary" unelevated />
  </div>
</template>

<script setup>
import { useQuasar } from 'quasar'
import { ref } from 'vue'
import AddPassage from './AddPassager.vue'

const $q = useQuasar()
const priceRows = ref([
  {
    name: 'Adult X0',
    price: '147.00/person',
    total: 147
  },
  {
    name: 'Child X0',
    price: '73.50/person',
    total: 147
  },
  {
    name: 'Service fee X0',
    price: '6.00/person',
    total: 147
  },
  {
    name: 'Total',
    price: '',
    total: 'USD 147'
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

const rows = ref([])

const showAddPassager = () => {
  $q.dialog({
    component: AddPassage
  }).onOk((data) => {
    //添加乘客清单
    rows.value.push({
      name: data.fullName,
      type: data.type,
      number: data.passportNumber,
      country: data.country
    })

    //计算价格
    let adultNum = 0
    let childNum = 0
    rows.value.forEach((item) => {
      if (item.type == 'Adult') {
        adultNum++
      } else {
        childNum++
      }
    })
    priceRows.value[0].name = `Adult X${adultNum}`
    priceRows.value[1].name = `Child X${childNum}`
    priceRows.value[2].name = `Child X${childNum + adultNum}`
  })
}
</script>
