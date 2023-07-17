<template>
    <div class="game">
      <div class="hole" v-for="(hole, index) in holes" :key="index" @click="hitMole(index)">
        <img class="mole" :src="hole.image" :class="{ active: hole.active }" alt="Mole" />
      </div>
    </div>
</template>

<script>
export default {
props: {
    gameTime: {
    type: Number,
    required: true,
    },
    moleImages: {
    type: Array,
    required: true,
    },
},
data() {
    return {
    holes: [],
    timer: null,
    remainingTime: 0,
    };
},
created() {
    // 初始化地鼠洞的状态
    for (let i = 0; i < 9; i++) {
    this.holes.push({
        active: false,
        timeout: null,
        image: this.getRandomMoleImage(),
    });
    }
},
methods: {
    startTimer() {
    this.remainingTime = this.gameTime;

    this.timer = setInterval(() => {
        this.remainingTime--;

        if (this.remainingTime <= 0) {
        this.stopGame();
        this.$emit('gameOver');
        } else {
        const randomIndex = Math.floor(Math.random() * this.holes.length);
        this.holes[randomIndex].active = true;
        this.holes[randomIndex].timeout = setTimeout(() => {
            this.holes[randomIndex].active = false;
        }, 1000);
        }
    }, 1000);
    },
    stopTimer() {
    clearInterval(this.timer);
    this.timer = null;
    },
    hitMole(index) {
    if (this.holes[index].active) {
        clearTimeout(this.holes[index].timeout);
        this.holes[index].active = false;
        this.$emit('moleHit');
    } else {
        // 处理漏打
        this.$emit('missedHit');
    }
    },
    stopGame() {
    this.stopTimer();
    for (let i = 0; i < this.holes.length; i++) {
        clearTimeout(this.holes[i].timeout);
        this.holes[i].active = false;
        this.holes[i].timeout = null;
    }
    },
    getRandomMoleImage() {
    const randomIndex = Math.floor(Math.random() * this.moleImages.length);
    return this.moleImages[randomIndex];
    },
},
mounted() {
    this.startTimer();
},
beforeUnmount() {
    this.stopGame();
},
};
</script>

<style scoped>
.game {
margin:1%;
display: flex;
flex-wrap: wrap;
padding-left:17%;
}

.hole {
width: 100px;
height: 100px;
border: 2px solid #000;
display: flex;
align-items: center;
justify-content: center;
cursor: pointer;
}

.mole {
width: 60px;
height: 60px;
border-radius: 50%;
transition: opacity 0.2s;
}

.mole.active {
opacity: 1;
}

.mole:not(.active) {
opacity: 0;
}
</style>
  