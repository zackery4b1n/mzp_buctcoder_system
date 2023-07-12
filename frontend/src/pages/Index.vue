<template>
  <el-container class="container">
    <el-container class="left-section">
      <el-card class="box-card-l" v-loading="loading_1">
        <template #header>
          <div class="card-header">
            <span>已结束的比赛</span>
            <el-button class="button" @click="reflesh_1" text>刷新</el-button>
          </div>
        </template>
        <div v-for="item in items" :key="item.id" class="text item">{{ item.name }} - {{ item.description }}</div>
      </el-card>
      <el-card class="box-card-l" v-loading="loading_2">
        <template #header>
          <div class="card-header">
            <span>即将到来的比赛</span>
            <el-button class="button" @click="reflesh_2" text>刷新</el-button>
          </div>
        </template>
        <div v-for="item in items" :key="item.id" class="text item">{{ item.name }} - {{ item.description }}</div>
      </el-card>
    </el-container>
    <el-container class="right-section">
      <el-card class="box-card-r" v-loading="loading_3">
          <template #header>
            <div class="card-header">
              <span>codeforces</span>
              <el-button class="button" @click="reflesh_3" text>刷新</el-button>
            </div>
          </template>
          <div v-for="item in items" :key="item.id" class="text item">{{ item.name }} - {{ item.description }}</div>
      </el-card>
      <el-card class="box-card-r" v-loading="loading_4">
          <template #header>
            <div class="card-header">
              <span>atcoder</span>
              <el-button class="button" @click="reflesh_4" text>刷新</el-button>
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
      loading_1: false,
      loading_2: false,
      loading_3: false,
      loading_4: false,
    };
  },
  methods:{
    reflesh_1(){
      this.loading_1 = true
      setTimeout(() => {this.loading_1 = false}, 300);
    },
    reflesh_2(){
      this.loading_2 = true
      setTimeout(() => {this.loading_2 = false}, 300);
    },
    reflesh_3(){
      this.loading_3 = true
      setTimeout(() => {this.loading_3 = false}, 300);
    },
    reflesh_4(){
      this.loading_4 = true
      setTimeout(() => {this.loading_4 = false}, 300);
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

.card-header{
  height:30px
}
</style>