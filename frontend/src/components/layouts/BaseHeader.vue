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
    <!-- <el-menu-item index="2" class="menu-root-item">
      <RouterLink to="/StuInfo" class="custom-link">用户列表</RouterLink>
    </el-menu-item> -->
    <!-- <el-sub-menu index="2" class="menu-root-item">
      <template #title>用户列表</template>
      <el-menu-item index="2-1">item one</el-menu-item>
      <el-menu-item index="2-2">item two</el-menu-item>
      <el-menu-item index="2-3">item three</el-menu-item>
      <el-sub-menu index="2-4">
        <template #title>item four</template>
        <el-menu-item index="2-4-1">item one</el-menu-item>
        <el-menu-item index="2-4-2">item two</el-menu-item>
        <el-menu-item index="2-4-3">item three</el-menu-item>
      </el-sub-menu>
    </el-sub-menu> -->
    <!-- <el-menu-item index="3" class="menu-root-item" router-link to="/">月度积分</el-menu-item>
    <el-menu-item index="4" class="menu-root-item">codeforces</el-menu-item>

    <el-menu-item index="5" class="menu-root-item">atcoder</el-menu-item>
    <el-menu-item index="6" class="menu-root-item">图表</el-menu-item>
    <el-menu-item index="7" class="menu-root-item">智能训练</el-menu-item>
    <el-menu-item index="8" class="menu-root-item">更新信息</el-menu-item> -->
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