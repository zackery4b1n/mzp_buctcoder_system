<template>
  <el-container class="section">
    <el-card class="box-card" v-loading="loading_3">
        <template #header>
          <div class="card-header">
            <span>codeforces</span>
            <el-button class="button" @click="reflesh_3" text>刷新</el-button>
          </div>
        </template>
      <el-table :data="tableData.slice((currentPage - 1) * pageSize, currentPage * pageSize)"  stripe style="width: 100%" v-loading="loading" :row-class-name="tableRowClassName">
        <el-table-column prop="id" label="id"></el-table-column>
        <el-table-column prop="score" label="score"></el-table-column>
      </el-table>
      <div class="block2">
        <el-pagination
          layout="prev, pager, next"
          :total="totalNum"
          :page-size="pageSize"
          :current-page="currentPage"
          @current-change="handleCurrentChange"
        ></el-pagination>
      </div>
    </el-card>
    <el-card class="box-card" v-loading="loading_4">
        <template #header>
          <div class="card-header">
            <span>atcoder</span>
            <el-button class="button" @click="reflesh_4" text>刷新</el-button>
          </div>
        </template>
        <div v-for="item in items" :key="item.id" class="text item">{{ item.name }} - {{ item.description }}</div>
    </el-card>
  </el-container>
</template>
  
<script>
import axios from 'axios'
export default {
    data () {
      return {
        pageSize: 12, // 表示一页多少条数据
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
        axios.get('/stu/info/acmer/codeforces/all/1/100').then(res => {
          if (res.data.code === 200) {
            this.loading = false
            const msgInfo = res.data.data.records
            for (const item in msgInfo) {
              this.tableData.push({
                id: msgInfo[item].cfId,
                score: msgInfo[item].cfNewRating,
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
  
<style>
.container {
  /* background-color: #f9f9f9; */
  padding: 10%;
  padding-top: 2%;
  height: 100vh; 
}

.block2{
  margin-top: 3%;
  padding-left: 40%;
}


.section { 
  flex-direction: row;
  border-radius: 4px;
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


.box-card {
  margin-bottom: 30px;
  border-radius: 20px
}

.card-header{
  height:30px
}
</style>
  