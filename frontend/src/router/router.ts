import { createRouter, createWebHistory } from "vue-router";
import HomeVue from "../pages/Home.vue"
import StuInfoVue from "../pages/StuInfo.vue"
import StudentIndexVue from "../pages/StudentIndex.vue"
import SelectAllVue from "../pages/SelectAll.vue"
import HelloWorldVue from "../pages/HelloWorld.vue";
import LogosVue from "../pages/Logos.vue";

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
      {
        path: '/',
        name: 'home',
        component: HomeVue
      },
      {
        path: '/1',
        name: 'home1',
        component: StudentIndexVue
      },
      {
        path: '/2',
        name: 'home2',
        component: SelectAllVue
      },
      {
        path: '/3',
        name: 'home3',
        component: HelloWorldVue
      },
      {
        path: '/4',
        name: 'home4',
        component: LogosVue
      },
      {
        path: '/StuInfo',
        name: 'stuinfo',
        component: StuInfoVue
        // route level code-splitting
        // this generates a separate chunk (About.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        // component: () => import('../views/AboutView.vue')
      }
    ]
  })

export default router;