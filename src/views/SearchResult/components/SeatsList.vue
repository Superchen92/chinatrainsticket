<template>
  <q-tr v-show="props.origin.expand" v-for="(seat, index) in props.origin.row.seats" :key="index">
    <q-td colspan="100%">
      <div class="row">
        <div class="col-3 q-pt-sm offset-6">{{ seat.name }}</div>
        <div class="col-2 q-pt-sm">{{ seat.tickets }}</div>
        <div class="col-1 absolute-right">
          <q-btn
            :disable="seat.tickets == 'sold out'"
            :label="'$ ' + seat.price"
            unelevated
            color="primary"
            @click="confirmOrder(seat)"
          />
        </div>
      </div>
    </q-td>
  </q-tr>
</template>

<script setup>
import { useBookInfoStore } from '@/stores/bookInfo'
import { useRouter } from 'vue-router'

const props = defineProps({
  origin: Object
})
const store = useBookInfoStore()
const router = useRouter()

const confirmOrder = (seat) => {
  //避免多次选取
  store.$reset()
  store.addOrder({
    from: props.origin.row.station,
    to: props.origin.row.endstation,
    startdate: props.origin.row.startdate,
    trainno: props.origin.row.trainno,
    departuretime: props.origin.row.departuretime,
    arrivaltime: props.origin.row.arrivaltime,
    seat: seat,
    costtime: props.origin.row.costtime,
    customers: []
  })

  router.push('confirm-order')
}
</script>
