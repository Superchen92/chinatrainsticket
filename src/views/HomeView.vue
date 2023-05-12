<template>
  <div class="fixed-center" style="margin-top: -50px">
    <div class="row" style="width: 840px">
      <div class="col-3">
        <q-select
          use-input
          outlined
          v-model="fromStation"
          :options="options"
          label="From"
          option-label="label"
          option-value="value"
          virtual-scroll-item-size="10"
          virtual-scroll-slice-size="60"
        />
      </div>
      <div class="col-1">
        <q-icon
          name="img:/svg/change.svg"
          size="lg"
          class="q-px-md q-pt-xs cursor-pointer"
          @click="doChangeDestination"
        />
      </div>
      <div class="col-3">
        <q-select
          use-input
          outlined
          v-model="toStation"
          :options="options"
          label="To"
          option-label="label"
          option-value="value"
        />
      </div>
      <div class="col-2">
        <q-input v-model="date" outlined type="date" />
      </div>
      <div class="col-3" style="padding-top: 2px">
        <q-btn
          color="primary"
          label="SEARCH"
          size="lg"
          icon="search"
          unelevated
          @click="doSearch"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { StationsName } from '@/constant/index'

const fromStation = ref()
const toStation = ref()
const date = ref()
const options = ref(StationsName)

const doSearch = () => {
  console.log(fromStation.value)
  console.log(toStation.value)
}

const doChangeDestination = () => {
  const oldFromStation = JSON.parse(JSON.stringify(fromStation.value))
  const oldToStation = JSON.parse(JSON.stringify(toStation.value))
  fromStation.value = oldToStation
  toStation.value = oldFromStation
}
</script>
