<template>
  <el-container class="container">
    <el-card class="box-card">
      <img src="../assets/f1.png">
    </el-card>
  </el-container>
  <el-container class="container">
    <el-card class="box-card">
      <img src="../assets/f2.png">
    </el-card>
  </el-container>
</template>

<script>
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
