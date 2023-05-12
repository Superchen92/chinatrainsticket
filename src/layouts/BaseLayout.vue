<template>
  <q-layout view="hHh lpR fFf">
    <q-layout view="hHh lpR fFf">
      <q-page-container>
        <RouterView />
      </q-page-container>

      <q-footer elevated class="bg-grey-9 text-white">
        <q-toolbar>
          <q-toolbar-title>
            <div>Title</div>
          </q-toolbar-title>
        </q-toolbar>
      </q-footer>
    </q-layout>
  </q-layout>
</template>
