<template>
  <el-card class="box-card">
    <h1>打地鼠</h1>
    <el-button type="primary" v-if="!gameStarted" @click="startGame">开始游戏</el-button>
    <el-button type="primary" v-else @click="endGame">结束游戏</el-button>
    <div v-if="gameStarted">
      <WhackAMoleGame :gameTime="gameTime" :moleImages="moleImages" @moleHit="updateScore" @missedHit="handleMissedHit" @gameOver="handleGameOver" />
      <p v-if="gameOver">游戏结束! 您的得分: {{ score }}</p>
      <p v-else>您的得分: {{ score }}</p>
    </div>
    <div v-if="!gameStarted">
      <p v-if="gameOver">游戏结束! 您的得分: {{ score }}</p>
      <p v-else>您的得分: {{ score }}</p>
    </div>
  </el-card>
  <el-main class="about">
    <el-space direction="vertical">
      <el-text class="atext">在这段生产实习的时光里，我有幸参与了一个令人难以忘怀的项目，我们共同打造了一个完整的前后端Web应用。这个经历不仅让我收获了技术上的成长，更给我留下了一份深深的感动。</el-text>
      <el-text class="atext">回顾起刚开始的时候，我对这个项目充满了期待和一丝丝的紧张。总是担心自己无法胜任任务。然而，在整个团队的互相支持和鼓励下，我渐渐放下了担心，开始全身心地投入到项目中。</el-text>
      <el-text class="atext">与团队的合作是我最感动的一部分。每天都要面对无数的问题需要解决，但在整个团队的不断交流和学习的过程中，我们克服了一个又一个难题。在这个团队中，这让我深深明白，团队的力量是无穷的。</el-text>
      <el-text class="atext">而整个项目的完成过程更是一次挑战与奇迹。我们面对了各种技术难题和时间紧迫的压力，但团队成员们从不退缩，始终保持着积极的态度。我们一起攻克了一个又一个的难关，一遍又一遍地迭代优化，直到最终呈现出了一个出色的Web应用。这种坚持不懈、追求卓越的精神深深地感动了我。</el-text>
      <el-text class="atext">通过这个项目，我也意识到了自己的潜力和成长。当我看到自己所写的代码在应用中完美运行时，我感到一种前所未有的成就感。每一行代码都是我思考和努力的结晶，它们汇聚成了一个有用的、实用的工具。这个成就感让我更加坚定了自己在编程领域的热爱和追求。</el-text>
      <el-text class="atext">这段生产实习的经历不仅仅是一次项目经验，更是一段感动和成长的旅程。我相信，无论将来我身处何方，这份感动和收获将一直伴随着我，激励着我不断追求卓越、勇往直前。谢谢这个团队，谢谢这段难忘的时光！</el-text>
    </el-space>
  </el-main>
</template>

<script>
import { Bell, ElementPlus } from '@element-plus/icons-vue'
import WhackAMoleGame from './WhackAMoleGame.vue';
import m1 from '../assets/m1.jpg';
import m2 from '../assets/m2.jpg';
import m3 from '../assets/m3.jpg';
import m4 from '../assets/m4.jpg';
export default {
  components: {
    WhackAMoleGame,
  },
  data() {
    return {
      gameStarted: false,
      gameOver: false,
      score: 0,
      gameTime: 30, // 游戏时间（单位：秒）
      moleImages: [
        m1,m2,m3,m4,
      ],
    };
  },
  methods: {
    startGame() {
      this.gameStarted = true;
      this.gameOver = false;
      this.score = 0;
    },
    endGame() {
      this.gameStarted = false;
    },
    updateScore() {
      this.score += 1;
    },
    handleMissedHit() {
      this.endGame();
      this.gameOver = true;
    },
    handleGameOver() {
      this.gameOver = true;
    },
  },
};
</script>

<style>
.box-card {
  margin: 10px;
  width: 100%;
  border-radius: 20px;
}
.about{
  padding-left: 25%;
  padding-right: 25%;
}

.atext{
  text-align: left;
  font-family: "KaiTi";
  text-indent: 2em;
  font-size:10px;
  font-style: italic;
}
</style>