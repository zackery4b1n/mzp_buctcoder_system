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
          <el-table :data="tableData1" stripe border style="width: 100%" v-loading="loading_1">
            <el-table-column prop="cname" label="比赛名称" ></el-table-column>
            <el-table-column prop="stime" label="开始时间" ></el-table-column>
            <el-table-column prop="ltime" label="持续时间" ></el-table-column>
          </el-table>
      </el-card>
      <el-card class="box-card-l" v-loading="loading_2">
        <template #header>
          <div class="card-header">
            <span>即将到来的比赛</span>
            <el-button class="button" @click="reflesh_2" text>刷新</el-button>
          </div>
        </template>
        <el-table :data="tableData2" stripe border style="width: 100%" v-loading="loading_2">
          <el-table-column prop="cname" label="比赛名称" ></el-table-column>
          <el-table-column prop="stime" label="开始时间" ></el-table-column>
          <el-table-column prop="ltime" label="持续时间" ></el-table-column>
        </el-table>
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
          <el-table :data="tableData3" stripe border style="width: 100%" v-loading="loading_3">
            <el-table-column prop="id" label="姓名" ></el-table-column>
            <el-table-column prop="score" label="成绩" ></el-table-column>
          </el-table>
      </el-card>
      <el-card class="box-card-r" v-loading="loading_4">
          <template #header>
            <div class="card-header">
              <span>atcoder</span>
              <el-button class="button" @click="reflesh_4" text>刷新</el-button>
            </div>
          </template>
          <el-table :data="tableData4" stripe border style="width: 100%" v-loading="loading_4">
            <el-table-column prop="id" label="姓名" ></el-table-column>
            <el-table-column prop="score" label="成绩" ></el-table-column>
          </el-table>
      </el-card>
    </el-container>
  </el-container>
</template>

<script>
import axios from 'axios'
export default {
  data() {
    return {
      loading_1: true,
      loading_2: true,
      loading_3: true,
      loading_4: true,
      tableData1: [],
      tableData2: [],
      tableData3: [],
      tableData4: [],
    };
  },
  created () {
    this.getInfo()
  },
  methods:{
    getInfo(){
      axios.get('/stu/info/acmer/competitioninformation/notStarted').then(res => {
          this.loading_1 = false
          const msgInfo = res.data
          this.tableData1 = []
          var count = 0
          for (const item in msgInfo) {
            count = count+1
            if (count == 7)
              break
            this.tableData1.push({
              cname: msgInfo[item].name,
              stime: msgInfo[item].startTime,
              ltime: msgInfo[item].formattedDuration,
            })
          }
      })
      axios.get('/stu/info/acmer/competitioninformation/finished').then(res => {
          this.loading_2 = false
          const msgInfo = res.data
          this.tableData2 = []
          var count2 = 0
          for (const item in msgInfo) {
            count2 = count2 +1
            if (count2 == 8)
              break
            this.tableData2.push({
              cname: msgInfo[item].name,
              stime: msgInfo[item].startTime,
              ltime: msgInfo[item].closingTime,
            })
          }
      })
      axios.get('/stu/info/acmer/student/name_rating/1/100').then(res => {
          if (res.data.code === 200) {
            this.loading_3 = false
            const msgInfo = res.data.data
            var count3 = 0
            for (const item in msgInfo) {
              count3 = count3 +1
              if (count3 == 10)
              break
              this.tableData3.push({
                id: msgInfo[item].name,
                score: msgInfo[item].cfRating,
              })
            }
          }
        })
      axios.get('/stu/info/acmer/student/score/1/100').then(res => {
        if (res.data.code === 200) {
          this.loading_4 = false
          const msgInfo = res.data.data
          var count4 = 0
          for (const item in msgInfo) {
            count4 = count4 +1
            if (count4 == 10)
              break
            this.tableData4.push({
              id: msgInfo[item].name,
              score: msgInfo[item].rating,
            })
          }
        }
      })
    },
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
  height: 200%;
}

.left-section {
  flex: 7; /* 左侧部分占据剩余空间的3/4 */
  flex-direction: column;
  border-radius: 4px;
  height: 200%;
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
  border-radius: 20px;
  height: 5000px;
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