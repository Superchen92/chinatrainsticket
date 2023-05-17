import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      component: () => import('@/layouts/BaseLayout.vue'),
      path: '/',
      children: [
        {
          name: 'home',
          path: '',
          component: HomeView
        },
        {
          name: 'searchresult',
          path: 'search-result',
          component: () => import('@/views/SearchResult/Index.vue')
        },
        {
          name: 'confirmOrder',
          path: 'confirm-order',
          component: () => import('@/views/ConfirmOrder/Index.vue')
        },
        {
          name: 'sendBooking',
          path: 'send-booking',
          component: () => import('@/views/SendBooking/Index.vue')
        }
      ]
    }
  ]
})

export default router
