import { createRouter, createWebHistory } from "vue-router";
import IndexVue from "../pages/Index.vue"
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
        name: 'index',
        component: IndexVue
      },
      {
        path: '/1',
        name: 'home1',
        component: StudentIndexVue
      },
      {
        path: '/SelectAll',
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
      }
    ]
  })

export default router;