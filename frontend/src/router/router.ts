import { createRouter, createWebHistory } from "vue-router";
import IndexVue from "../pages/Index.vue"
import StuInfoVue from "../pages/StuInfo.vue"
import GameInfoVue from "../pages/GameInfo.vue"
import StuScoreVue from "../pages/StuScore.vue"
// import StudentIndexVue from "../pages/StudentIndex.vue"
// import SelectAllVue from "../pages/SelectAll.vue"
import FigureVue from "../pages/Figure.vue";
import AboutVue from "../pages/About.vue";

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
      {
        path: '/',
        name: 'index',
        component: IndexVue
      },
      {
        path: '/stuInfo',
        name: 'stuInfo',
        component: StuInfoVue
      },
      {
        path: '/gameInfo',
        name: 'gameInfo',
        component: GameInfoVue
      },
      {
        path: '/stuScore',
        name: 'stuScore',
        component: StuScoreVue
      },
      {
        path: '/figure',
        name: 'figure',
        component: FigureVue
      },
      {
        path: '/about',
        name: 'about',
        component: AboutVue
      }
    ]
  })

export default router;