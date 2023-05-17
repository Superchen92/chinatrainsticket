<template>
  <div class="row">
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
        @filter="filterFn"
      />
    </div>
    <div class="col-1">
      <q-icon
        name="img:/svg/change.svg"
        size="lg"
        class="absolute-center cursor-pointer"
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
        @filter="filterFn"
      />
    </div>
    <div class="col-2">
      <q-input v-model="date" outlined type="date" />
    </div>
    <div class="col-3" style="padding-top: 2px">
      <q-btn color="primary" label="SEARCH" size="lg" icon="search" unelevated @click="doSearch" />
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { StationsName } from '@/constant/index'

const emits = defineEmits(['submit-search'])
const props = defineProps({
  fromStation: Object,
  toStation: Object,
  date: String
})

const fromStation = props.fromStation ? ref(props.fromStation) : ref('')
const toStation = props.toStation ? ref(props.toStation) : ref('')
const date = props.date ? ref(props.date) : ref('')
const options = ref(StationsName)

const doSearch = () => {
  if (fromStation.value != '' && toStation.value != '' && date.value != '') {
    emits('submit-search', {
      fromStation: fromStation.value,
      toStation: toStation.value,
      date: date.value
    })
  }
}

const doChangeDestination = () => {
  const oldFromStation = JSON.parse(JSON.stringify(fromStation.value))
  const oldToStation = JSON.parse(JSON.stringify(toStation.value))
  fromStation.value = oldToStation
  toStation.value = oldFromStation
}

function filterFn(val, update) {
  if (val === '') {
    update(() => {
      options.value = StationsName

      // here you have access to "ref" which
      // is the Vue reference of the QSelect
    })
    return
  }

  update(() => {
    const needle = val.toLowerCase()
    options.value = StationsName.filter((v) => v.label.toLowerCase().indexOf(needle) > -1)
  })
}
</script>
