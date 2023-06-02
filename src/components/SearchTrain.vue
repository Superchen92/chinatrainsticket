<template>
  <q-form @submit="onSubmit">
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
          :rules="[(val) => val != '' || 'Please enter your departure city!']"
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
          :rules="[(val) => val != '' || 'Please enter your arrival city!']"
        />
      </div>
      <div class="col-2">
        <q-input filled v-model="selectDate" mask="date" :rules="['date']" readonly>
          <template v-slot:append>
            <q-icon name="event" class="cursor-pointer">
              <q-popup-proxy ref="popup" cover transition-show="scale" transition-hide="scale">
                <q-date
                  v-model="selectDate"
                  minimal
                  @update:model-value="(val) => val && popup.toggle()"
                  :options="(date) => date >= today"
                />
              </q-popup-proxy>
            </q-icon>
          </template>
        </q-input>
      </div>
      <div class="col-3" style="padding-top: 2px">
        <q-btn
          color="primary"
          label="SEARCH"
          size="lg"
          icon="search"
          unelevated
          type="submit"
          @click="doSearch"
        />
      </div>
    </div>
  </q-form>
</template>

<script setup>
import { ref } from 'vue'
import { StationsName } from '@/constant/index'
import { date } from 'quasar'

const emits = defineEmits(['submit-search'])
const props = defineProps({
  fromStation: Object,
  toStation: Object,
  date: String
})
const popup = ref()
const today = date.formatDate(new Date(), 'YYYY/MM/DD')
const fromStation = props.fromStation ? ref(props.fromStation) : ref('')
const toStation = props.toStation ? ref(props.toStation) : ref('')
const selectDate = props.date ? ref(props.date) : ref(today)
const options = ref(StationsName)

const onSubmit = () => {
  emits('submit-search', {
    fromStation: fromStation.value,
    toStation: toStation.value,
    date: selectDate.value
  })
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
    })
    return
  }

  update(() => {
    const needle = val.toLowerCase()
    options.value = StationsName.filter((v) => v.label.toLowerCase().indexOf(needle) > -1)
  })
}
</script>
