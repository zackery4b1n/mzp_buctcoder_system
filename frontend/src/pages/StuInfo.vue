<template>
  <el-container class="container">
    <el-card class="box-card">
      <template #header>
        <div class="card-header">
          <span class="ml-3 w-35 text-gray-600 inline-flex items-center" style="flex:15">用户列表</span>
          <el-input v-model="input" placeholder="请输入" style="flex:8"/>
          <el-button type="primary" style="flex:1">搜索</el-button>
          <el-button type="primary" style="flex:1" @click="addStu">新增用户</el-button>
        </div>
      </template>
      <el-table :data="tableData.slice((currentPage - 1) * pageSize, currentPage * pageSize)" stripe border style="width: 100%" v-loading="loading">
        <el-table-column prop="stuNo" label="stuNo" width="120"></el-table-column>
        <el-table-column prop="stuName" label="stuName" ></el-table-column>
        <el-table-column prop="stuClass" label="stuClass" ></el-table-column>
        <el-table-column prop="stuAcId" label="stuAcId" ></el-table-column>
        <el-table-column prop="stuCfId" label="stuCfId" ></el-table-column>
        <el-table-column  label="操作" width="250px">
          <el-row>
            <el-button @click="handleEdit(scope.row)" type="primary" style="width:15px">编辑</el-button>
            <el-button @click="handleDel(scope.row)" type="primary" style="width:15px">删除</el-button>
          </el-row>
        </el-table-column>
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
    <el-dialog
      v-model="dialogVisible"
      :title="dialogtitle" style="border-radius: 30px;">
      <el-form
        label-width="120px"
        ref="ruleFormRef"
        :model="formData"
      >
        <el-form-item label="学号">
          <el-input :disabled="dialogtitle==='编辑'" v-model="formData.stuNo"></el-input>
        </el-form-item>
        <el-form-item label="名字">
          <el-input  v-model="formData.stuName"></el-input>
        </el-form-item>
        <el-form-item label="班级">
          <el-input  v-model="formData.stuClass"></el-input>
        </el-form-item>
        <el-form-item label="Atcoder账号">
          <el-input  v-model="formData.stuAcId"></el-input>
        </el-form-item>
        <el-form-item label="Codeforces账号">
          <el-input  v-model="formData.stuCfId"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer">
        <el-button @click="submit"> 确认</el-button>
        <el-button @click="showDialog=false"> 取消</el-button>
      </span>
    </el-dialog>
    </el-card>
  </el-container>
</template>

<script>
import axios from 'axios'
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
      axios.get('/stu/info/acmer/student/all/1/100').then(res => {
        if (res.data.code === 200) {
          this.loading = false
          const msgInfo = res.data.data.records
          this.tableData = []
          for (const item in msgInfo) {
            this.tableData.push({
              stuNo: msgInfo[item].stuNo,
              stuName: msgInfo[item].stuName,
              stuClass: msgInfo[item].stuClass,
              stuAcId: msgInfo[item].stuAcId,
              stuCfId: msgInfo[item].stuCfId
            })
          }
          this.totalNum = this.tableData.length
        }
      })
    },
    handleCurrentChange (val) {
      this.currentPage = val
    },
    handleEdit (data) {
      this.dialogtitle = '编辑'

      this.showDialog = true
      this.formData = {
        ...data
      }
    },
    handleDel (data) {
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        center: true
      }).then(() => {
        this.$axios('/stu/info/acmer/student/remove/' + data.stuNo).then((res) => {
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
      this.showDialog = false
      if (this.dialogtitle === '新增') {
        this.$axios.post('/stu/info/acmer/student/insert', this.formData).then(res => {
          console.log(res)
          this.getInfo()
        })
      } else {
        this.$axios.post('/stu/info/acmer/student/update', this.formData).then(res => {
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
  width: 100%;
  box-sizing: border-box;
  border-bottom: #eceef0 solid 2px;
  padding: 0px;
}
.container .block {
  display: flex;
  justify-content: center;
  margin-top: 5px;
}
.box-card {
  margin: 2%;
  width: 100%;
  border-radius: 20px
}
.card-header{
  height:50px
}

.block{
  padding-top: 10px;
}
</style>
