<script lang="ts" setup>
import { toggleDark } from "~/composables";
</script>

<template>
  <el-menu class="el-menu-demo" mode="horizontal">    
    <RouterLink to="/" class="custom-link">
      <el-menu-item index="1" class="menu-root-item">首页</el-menu-item>
    </RouterLink>
    <RouterLink to="/stuInfo" class="custom-link">
      <el-menu-item index="2" class="menu-root-item">学生信息</el-menu-item>
    </RouterLink>
    <RouterLink to="/gameInfo" class="custom-link">
      <el-menu-item index="3" class="menu-root-item">比赛信息</el-menu-item>
    </RouterLink>
    <el-menu-item h="full" @click="toggleDark()" class="menu-root-item">
      <button
        class="border-none w-full bg-transparent cursor-pointer"
        style="height: var(--ep-menu-item-height)"
      >
        <i inline-flex i="dark:ep-moon ep-sunny" />
      </button>
    </el-menu-item>
    <RouterLink to="/stuScore" class="custom-link">
      <el-menu-item index="4" class="menu-root-item">学生分数</el-menu-item>
    </RouterLink>
    <RouterLink to="/figure" class="custom-link">
      <el-menu-item index="5" class="menu-root-item">图表</el-menu-item>
    </RouterLink>
    <RouterLink to="/about" class="custom-link">
      <el-menu-item index="6" class="menu-root-item">关于</el-menu-item>
    </RouterLink>   
  </el-menu>
</template>

<style>
.el-menu-demo {
  display: flex;
  justify-content: center;
}

.menu-root-item {
  width: 120px; 
  justify-content: center;
  margin:0%;
}

.custom-link {
  text-decoration: none;
  width: 120px;
  justify-content: center;
}
</style>