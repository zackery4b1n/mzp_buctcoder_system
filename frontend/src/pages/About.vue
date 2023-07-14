<template>
  <img src="../assets/sky.png"/> 
  <div ref="gameContainer"></div>
</template>

<script>
import Phaser from 'phaser';

export default {
  mounted() {
    const config = {
      type: Phaser.AUTO,
      parent: this.$refs.gameContainer,
      width: 800,
      height: 600,
      physics: {
        default: 'arcade',
        arcade: {
          gravity: { y: 200 }
        }
      },
      scene: {
        preload: this.preload,
        create: this.create
      }
    };

    new Phaser.Game(config);
  },
  methods: {
    preload() {
      this.load.image('sky', '../assets/sky.png');
      this.load.image('ground', '../assets/platform.jpg');
      this.load.image('star', '../assets/star.jpg');
      this.load.image('bomb', '../assets/bomb.png');
      this.load.spritesheet('dude', '../assets/dude.jpg', { frameWidth: 32, frameHeight: 48 });
    },
    create() {
      this.add.image(400, 300, 'sky');

      const platforms = this.physics.add.staticGroup();

      platforms.create(400, 568, 'ground').setScale(2).refreshBody();

      platforms.create(600, 400, 'ground');
      platforms.create(50, 250, 'ground');
      platforms.create(750, 220, 'ground');

      const player = this.physics.add.sprite(100, 450, 'dude');

      player.setBounce(0.2);
      player.setCollideWorldBounds(true);

      this.anims.create({
        key: 'left',
        frames: this.anims.generateFrameNumbers('dude', { start: 0, end: 3 }),
        frameRate: 10,
        repeat: -1
      });

      this.anims.create({
        key: 'turn',
        frames: [{ key: 'dude', frame: 4 }],
        frameRate: 20
      });

      this.anims.create({
        key: 'right',
        frames: this.anims.generateFrameNumbers('dude', { start: 5, end: 8 }),
        frameRate: 10,
        repeat: -1
      });

      this.physics.add.collider(player, platforms);

      const cursors = this.input.keyboard.createCursorKeys();

      cursors.left.on('down', () => {
        player.setVelocityX(-160);
        player.anims.play('left', true);
      });

      cursors.right.on('down', () => {
        player.setVelocityX(160);
        player.anims.play('right', true);
      });

      cursors.up.on('down', () => {
        if (player.body.touching.down) {
          player.setVelocityY(-330);
        }
      });
    }
  }
};
</script>

<style scoped>
/* 可选的样式规则 */
</style>
