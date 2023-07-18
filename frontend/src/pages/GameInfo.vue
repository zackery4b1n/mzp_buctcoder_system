<template>
  <el-container class="container">
    <el-card class="box-card">
      <template #header>
        <div class="card-header">
          <span class="ml-3 w-35 inline-flex items-center" style="flex:15">即将到来的比赛</span>
          <el-input v-model="input" placeholder="请输入" style="flex:8"/>
          <el-button type="primary" style="flex:1">搜索</el-button>
          <el-button type="primary" style="flex:1" @click="reflesh">刷新</el-button>
        </div>
      </template>
      <el-table :data="tableData1" stripe border style="width: 100%" v-loading="loading">
        <el-table-column prop="cname" label="比赛名称" ></el-table-column>
        <el-table-column prop="stime" label="开始时间" ></el-table-column>
        <el-table-column prop="ltime" label="持续时间" ></el-table-column>
      </el-table>
      <div class="block">
        <el-pagination
          layout="prev, pager, next"
          :total="totalNum"
          :page-size="pageSize"
          :current-page="currentPage"
          @current-change="handleCurrentChange"
        ></el-pagination>
      </div>
    </el-card>
  </el-container>
  <el-container class="container">
    <el-card class="box-card">
      <template #header>
        <div class="card-header">
          <span class="ml-3 w-35 inline-flex items-center" style="flex:15">已结束的比赛</span>
          <el-input v-model="input" placeholder="请输入" style="flex:8"/>
          <el-button type="primary" style="flex:1">搜索</el-button>
          <el-button type="primary" style="flex:1" @click="reflesh2">刷新</el-button>
        </div>
      </template>
      <el-table :data="tableData2" stripe border style="width: 100%" v-loading="loading2">
        <el-table-column prop="cname" label="比赛名称" ></el-table-column>
        <el-table-column prop="stime" label="开始时间" ></el-table-column>
        <el-table-column prop="ltime" label="结束时间" ></el-table-column>
      </el-table>
      <div class="block">
        <el-pagination
          layout="prev, pager, next"
          :total="totalNum"
          :page-size="pageSize"
          :current-page="currentPage"
          @current-change="handleCurrentChange"
        ></el-pagination>
      </div>
    </el-card>
  </el-container>
</template>

<script>
import axios from 'axios'
import { ElMessage, ElMessageBox } from 'element-plus'
export default {
  data () {
    return {
      pageSize: 8, // 表示一页多少条数据
      totalNum: 0,
      currentPage: 1,
      tableData1: [],
      tableData2: [],
      loading: true,
      loading2:true,
      formData: {},
      dialogVisible: false,
      dialogtitle: ''
    }
  },
  created () {
    this.getInfo()
  },
  methods: {
    getInfo () {
      axios.get('/stu/info/acmer/competitioninformation/notStarted').then(res => {
          this.loading = false
          const msgInfo = res.data
          this.tableData1 = []
          for (const item in msgInfo) {
            this.tableData1.push({
              cname: msgInfo[item].name,
              stime: msgInfo[item].startTime,
              ltime: msgInfo[item].formattedDuration,
            })
          }
      })
      axios.get('/stu/info/acmer/competitioninformation/finished').then(res => {
          this.loading2 = false
          const msgInfo = res.data
          this.tableData2 = []
          for (const item in msgInfo) {
            this.tableData2.push({
              cname: msgInfo[item].name,
              stime: msgInfo[item].startTime,
              ltime: msgInfo[item].closingTime,
            })
          }
      })
    },
    reflesh(){
      this.loading = true
      setTimeout(() => this.getInfo(), 300);
    },
    reflesh2(){
      this.loading2 = true
      setTimeout(() => this.getInfo(), 300);
    }
  }
}
</script>

<style scoped>
.container {
  width: 80%;
  box-sizing: border-box;
  border-bottom: #eceef0 solid 2px;
  padding: 0px;
  flex-direction: column;
  margin-left: 8%;
  height:70%;
}
.container .block {
  display: flex;
  justify-content: center;
  margin-top: 5px;
}
.box-card {
  margin: 10px;
  width: 100%;
  border-radius: 20px;
}
.card-header{
  height:50px
}

.block{
  padding-top: 10px;
}
</style>
