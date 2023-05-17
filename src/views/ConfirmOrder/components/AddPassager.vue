<template>
  <q-dialog ref="dialogRef" @hide="onDialogHide" persistent>
    <q-card class="q-dialog-plugin">
      <q-card-section>
        <div class="text-h6 text-center">Add Passager</div>
      </q-card-section>
      <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md">
        <q-card-section>
          <div class="q-gutter-md">
            <q-radio v-model="model.type" val="Adult" label="Adult" />
            <q-radio v-model="model.type" val="Child" label="Child(under 14 years old;)" />
          </div>
          <q-input
            filled
            v-model="model.fullName"
            label="Surname/Given Name"
            lazy-rules
            dense
            :rules="[(val) => (val && val.length > 0) || 'Please type something']"
          />
          <q-select
            outlined
            v-model="model.sex"
            dense
            :options="['Male', 'Female']"
            label="Select Gender"
            :rules="[(val) => (val && val.length > 0) || 'Please Select Gender']"
          />
          <q-input
            v-model="model.birth"
            outlined
            type="date"
            dense
            label="Birthday"
            :rules="[(val) => (val && val.length > 0) || 'Please Select Birthday']"
          />
          <q-input
            v-model="model.passportNumber"
            outlined
            dense
            label="Passport Number"
            :rules="[(val) => (val && val.length > 0) || 'Please Type Your Number']"
          />
          <q-input
            v-model="model.passportExDate"
            outlined
            type="date"
            dense
            label="Passport Expiry"
            :rules="[(val) => (val && val.length > 0) || 'Please Select Date']"
          />
          <q-select
            outlined
            v-model="model.country"
            dense
            :options="['usa', 'china', 'eng']"
            label="Select Country"
            :rules="[(val) => (val && val.length > 0) || 'Please Select Country']"
          />
        </q-card-section>
        <q-card-actions align="right">
          <q-btn color="primary" label="Cancel" flat v-close-popup />
          <q-btn color="primary" label="submit" type="submit" unelevated />
        </q-card-actions>
      </q-form>
    </q-card>
  </q-dialog>
</template>

<script setup>
import { useDialogPluginComponent } from 'quasar'
import { reactive } from 'vue'
const model = reactive({
  type: 'Adult',
  fullName: '',
  sex: '',
  birth: '',
  passportNumber: '',
  passportExDate: '',
  country: ''
})

defineEmits([...useDialogPluginComponent.emits])

const { dialogRef, onDialogHide, onDialogOK, onDialogCancel } = useDialogPluginComponent()

function onSubmit() {
  onDialogOK(model)
}
</script>
