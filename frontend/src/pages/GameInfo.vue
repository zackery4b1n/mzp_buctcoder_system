<template>
    <el-container class="container">
      <el-card class="box-card">
      <el-table :data="tableData.slice((currentPage - 1) * pageSize, currentPage * pageSize)"  
      stripe style="width: 100%" v-loading="loading" :row-class-name="tableRowClassName">
        <el-table-column prop="id" label="id" width="130px"></el-table-column>
        <el-table-column prop="date" label="date" width="210"></el-table-column>
        <el-table-column prop="contest" label="contest" width="180px"></el-table-column>
        <el-table-column prop="rank" label="rank"></el-table-column>
        <el-table-column prop="performance" label="performance" width="120px"></el-table-column>
        <el-table-column prop="newRating" label="newRating" width="120px"></el-table-column>
        <el-table-column prop="diff" label="diff" width="80px"></el-table-column>
        <el-table-column prop="count" label="count"></el-table-column>
        <el-table-column prop="maxrating" label="maxrating"></el-table-column>
        <el-table-column  label="操作" width="100px">
          <template slot-scope="scope">
            <el-button @click="handleEdit(scope.row)" type="text" size="small">编辑</el-button>
            <el-button @click="handleDel(scope.row)" type="text" size="small">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-container class="block">
        <el-pagination
          layout="prev, pager, next"
          :total="totalNum"
          :page-size="pageSize"
          :current-page="currentPage"
          @current-change="handleCurrentChange"
        ></el-pagination>
      </el-container>
    </el-card>
    </el-container>
</template>
  
<script>
  import axios from 'axios'
  export default {
    data () {
      return {
        pageSize: 6, // 表示一页多少条数据
        totalNum: 0,
        currentPage: 1,
        tableData: [],
        loading: true
      }
    },
    created () {
      this.getInfo()
    },
    methods: {
      getInfo () {
        axios.get('/stu/info/acmer/atcoder/all/1/100').then(res => {
          if (res.data.code === 200) {
            this.loading = false
            const msgInfo = res.data.data.records
            for (const item in msgInfo) {
              this.tableData.push({
                id: msgInfo[item].acId,
                date: msgInfo[item].acDate,
                contest: msgInfo[item].acContest,
                rank: msgInfo[item].acRank,
                performance: msgInfo[item].acPerformance,
                newRating: msgInfo[item].acNewrating,
                diff: msgInfo[item].acDiff,
                count: msgInfo[item].acCount,
                maxrating: msgInfo[item].acMaxrating,
              })
            }
            this.totalNum = this.tableData.length
          }
        })
      },
      handleCurrentChange (val) {
        this.currentPage = val
      },
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
</style>
  