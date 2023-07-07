<script lang="ts" setup>
import { toggleDark } from "~/composables";
</script>

<template>
  <el-menu class="el-menu-demo" mode="horizontal">    
    <RouterLink to="/" class="custom-link">
      <el-menu-item index="1" class="menu-root-item">首页</el-menu-item>
    </RouterLink>
    <RouterLink to="/1" class="custom-link">
      <el-menu-item index="2" class="menu-root-item">首页2</el-menu-item>
    </RouterLink>
    <RouterLink to="/2" class="custom-link">
      <el-menu-item index="3" class="menu-root-item">首页3</el-menu-item>
    </RouterLink>
    <el-menu-item h="full" @click="toggleDark()" class="menu-root-item">
      <button
        class="border-none w-full bg-transparent cursor-pointer"
        style="height: var(--ep-menu-item-height)"
      >
        <i inline-flex i="dark:ep-moon ep-sunny" />
      </button>
    </el-menu-item>
    <RouterLink to="/3" class="custom-link">
      <el-menu-item index="4" class="menu-root-item">首页4</el-menu-item>
    </RouterLink>
    <RouterLink to="/4" class="custom-link">
      <el-menu-item index="5" class="menu-root-item">首页5</el-menu-item>
    </RouterLink>
    <RouterLink to="/StuInfo" class="custom-link">
      <el-menu-item index="6" class="menu-root-item">首页6</el-menu-item>
    </RouterLink>   
  </el-menu>
</template>

<style>
.el-menu-demo {
  display: flex;
  justify-content: center;
}

.menu-root-item {
  width: 120px; /* 调整为你希望的宽度 */
}

.custom-link {
  text-decoration: none;
}
</style>