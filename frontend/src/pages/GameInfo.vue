<template>
  <el-container class="container">
    <el-card class="box-card">
      <template #header>
        <div class="card-header">
          <span class="ml-3 w-35 inline-flex items-center" style="flex:15">即将到来的比赛</span>
          <el-input v-model="input" placeholder="请输入" style="flex:8"/>
          <el-button type="primary" style="flex:1">搜索</el-button>
          <el-button type="primary" style="flex:1" @click="addStu">刷新</el-button>
        </div>
      </template>
      <el-table :data="tableData" stripe border style="width: 100%" v-loading="loading">
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
          <el-button type="primary" style="flex:1" @click="addStu">新增用户</el-button>
        </div>
      </template>
      <el-table :data="tableData.slice((currentPage - 1) * pageSize, currentPage * pageSize)" stripe border style="width: 100%" v-loading="loading">
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
      tableData: [],
      loading: true,
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
          this.tableData = []
          for (const item in msgInfo) {
            this.tableData.push({
              cname: msgInfo[item].name,
              stime: msgInfo[item].time,
              ltime: msgInfo[item].formattedDuration,
            })
          }
      })
    },
    handleCurrentChange (val) {
      this.currentPage = val
    },
    handleEdit (data) {
      this.dialogtitle = '编辑'
      this.dialogVisible = true
      this.formData = {
        ...data
      }
    },
    handleDel (data) {
      ElMessageBox.confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        center: true
      }).then(() => {
        axios('/stu/info/acmer/student/remove/' + data.stuNo).then((res) => {
          this.getInfo()
          this.$message({
            type: 'success',
            message: '删除成功!'
          })
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    },
    addStu () {
      this.formData = {}
      this.dialogtitle = '新增'
      this.dialogVisible = true
    },
    submit () {
      this.dialogVisible = false
      if (this.dialogtitle === '新增') {
        axios.post('/stu/info/acmer/student/insert', this.formData).then(res => {
          console.log(res)
          this.getInfo()
        })
      } else {
        axios.post('/stu/info/acmer/student/update', this.formData).then(res => {
          console.log(res)
          this.getInfo()
        })
      }
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
