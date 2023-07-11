<template>
  <el-container class="container">
    <el-container class="left-section">
      <el-card class="box-card-l" v-loading="loading">
        <template #header>
          <div class="card-header">
            <span>已结束的比赛</span>
            <el-button class="button" @click="reflesh" text>刷新</el-button>
          </div>
        </template>
        <div v-for="item in items" :key="item.id" class="text item">{{ item.name }} - {{ item.description }}</div>
      </el-card>
      <el-card class="box-card-l">
        <template #header>
          <div class="card-header">
            <span>即将到来的比赛</span>
            <el-button class="button" text>刷新</el-button>
          </div>
        </template>
        <div v-for="item in items" :key="item.id" class="text item">{{ item.name }} - {{ item.description }}</div>
      </el-card>
    </el-container>
    <el-container class="right-section">
      <el-card class="box-card-r">
          <template #header>
            <div class="card-header">
              <span>codeforces</span>
              <el-button class="button" text>刷新</el-button>
            </div>
          </template>
          <div v-for="item in items" :key="item.id" class="text item">{{ item.name }} - {{ item.description }}</div>
      </el-card>
      <el-card class="box-card-r">
          <template #header>
            <div class="card-header">
              <span>atcoder</span>
              <el-button class="button" text>刷新</el-button>
            </div>
          </template>
          <div v-for="item in items" :key="item.id" class="text item">{{ item.name }} - {{ item.description }}</div>
      </el-card>
    </el-container>
  </el-container>
</template>

<script>
export default {
  data() {
    return {
      items: [
        { id: 1, name: 'Item 1', description: 'Description for Item 1' },
        { id: 2, name: 'Item 2', description: 'Description for Item 2' },
        { id: 3, name: 'Item 3', description: 'Description for Item 3' },
        // 添加更多列表项...
      ],
      loading: false
    };
  },
  method:{
    reflesh(){
      this.loading = true
      return
    }
  }
};
</script>

<style>
.container {
  /* background-color: #f9f9f9; */
  padding: 10%;
  padding-top: 2%;
  height: 100vh; 
}

.right-section { 
  flex: 3; /* 右侧栏占据整个剩余空间 */
  flex-direction: column;
  /* background-color: #ffffff;右侧栏的背景色 */
  border-radius: 4px;
}

.left-section {
  flex: 7; /* 左侧部分占据剩余空间的3/4 */
  flex-direction: column;
  border-radius: 4px
}

h2 {
  font-size: 20px;
  margin-bottom: 10px;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  margin-bottom: 5px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.text {
  font-size: 14px;
}

.item {
  margin-bottom: 18px;
}

.box-card-l {
  margin-bottom: 30px;
  width: 800px;
  border-radius: 20px
}

.box-card-r {
  width: 400px;
  margin-bottom: 30px;
  border-radius: 20px
}
</style>