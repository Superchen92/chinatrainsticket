<template>
  <div>
    <q-table
      flat
      :rows="props.list"
      :columns="columns"
      row-key="trainno"
      hide-bottom
      virtual-scroll
      :virtual-scroll-item-size="20"
      :rows-per-page-options="[0]"
      style="height: calc(100vh - 150px); width: 1200px"
    >
      <template v-slot:header="props">
        <q-tr :props="props">
          <q-th v-for="col in props.cols" :key="col.name" :props="props">
            {{ col.label }}
          </q-th>
          <q-th auto-width />
        </q-tr>
      </template>

      <template v-slot:body="props">
        <q-tr :props="props" @click="props.expand = !props.expand">
          <q-td v-for="col in props.cols" :key="col.name" :props="props">
            <div v-if="col.name == 'departuretime'">
              <span class="text-subtitle1">{{ col.value }}</span>
              <br />
              <span class="text-overline text-grey-5">{{ props.row.station }}</span>
            </div>
            <div v-else-if="col.name == 'arrivaltime'">
              <span class="text-subtitle1">{{ col.value }}</span>
              <br />
              <span class="text-overline text-grey-5">{{ props.row.endstation }}</span>
            </div>
            <div v-else>
              {{ col.value }}
            </div>
          </q-td>
          <q-td auto-width>
            <q-btn
              size="sm"
              color="primary"
              rounded
              flat
              dense
              :icon="props.expand ? 'expand_less' : 'expand_more'"
            />
          </q-td>
        </q-tr>
        <SeatsList :origin="props" />
      </template>
    </q-table>
  </div>
</template>

<script setup>
import SeatsList from './SeatsList.vue'
const props = defineProps({
  list: Array
})

const columns = [
  {
    name: 'trainno',
    required: true,
    label: 'Train',
    align: 'left',
    field: (row) => row.trainno,
    format: (val) => `${val}`
  },
  { name: 'departuretime', align: 'center', label: 'Departure', field: 'departuretime' },
  { name: 'costtime', label: 'Duration', field: 'costtime' },
  { name: 'arrivaltime', label: 'Arrival', field: 'arrivaltime' }
]
</script>
