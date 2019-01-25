import Vue from 'vue'
import Router from 'vue-router'
import Test from '@/components/Test'
import Welcome from '@/components/Welcome'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'test',
      component: Test
    },
    {
      path: '/welcome',
      name: 'welcome',
      component: Welcome
    }
  ]
})
