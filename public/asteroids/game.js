(function (root) {
  var Asteroids = root.Asteroids = (root.Asteroids || {});
  
  var Game = Asteroids.Game = function (dimX, dimY, numAsteroids) {
    this.dimX = dimX;
    this.dimY = dimY;
  
    this.bullets = [];
    this.ship = Asteroids.Ship.createShip(dimX, dimY);
    
    this.populateAsteroids(dimX, dimY, numAsteroids);
    
    var game = this;
    this.asteroids.forEach(function(asteroid) {
      while (asteroid.isCollidedWith(game.ship)){
        this.populateAsteroids();
      }
    });
  }
  
  Game.prototype.populateAsteroids = function(dimX, dimY, numAsteroids){
    this.asteroids = [];
    for (var i = 0; i < numAsteroids; ++i) {
      this.asteroids.push(Asteroids.Asteroid.randomAsteroid(dimX, dimY));
    }
  }
  
  Game.prototype.fireBullet = function(){
    var bullet = this.ship.fireBullet();
    var game = this;
    
    if (bullet){
      game.bullets.push(bullet)      
    }
  }
  
  Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, this.dimX, this.dimY);

    this.asteroids.forEach(function (asteroid) {
      asteroid.draw(ctx);
    });
    
    this.bullets.forEach(function (bullet) {
      bullet.draw(ctx);
    });
    
    this.ship.draw(ctx);
  };

  Game.prototype.move = function () {
    var game = this;
    
    this.asteroids.forEach(function (asteroid) {
      asteroid.move(game.dimX, game.dimY);
    });
    
    this.bullets.forEach(function (bullet) {
      bullet.move(game.dimX, game.dimY);
    });
    
    this.ship.power([0,0]);
    this.ship.move(game.dimX, game.dimY);
  };
  
  Game.prototype.checkCollisions = function () {
    var game = this;
    this.asteroids.forEach(function(asteroid) {
      if (asteroid.isCollidedWith(game.ship)){
        alert("Game over!");
        game.stopGame();
      }
    });
    
    this.asteroids.forEach(function(asteroid) {
      game.bullets.forEach(function(bullet){
        if (asteroid.isCollidedWith(bullet)){
          game.removeAsteroid(asteroid);
          game.removeBullet(bullet);
        }
      })
    });
  };
  
  Game.prototype.removeAsteroid = function(asteroid){
    var index = this.asteroids.indexOf(asteroid);
    delete this.asteroids[index];
  }
  
  Game.prototype.removeBullet = function(bullet){
    var index = this.bullets.indexOf(bullet);
    delete this.bullets[index];
  }
  
  Game.prototype.isOutOfBounds = function () {
    var game = this;
    
    this.bullets.forEach(function(bullet) {
      if (bullet.xAxis >= game.dimX) {
        game.removeBullet(bullet);
      }
      else if (bullet.yAxis >= game.dimY) {
        game.removeBullet(bullet);        
      }
    });
  }
  
  Game.prototype.start = function (canvasEl, asteroid, spaceship, missile) {
    Game.asteroid = asteroid;
    Game.spaceship = spaceship;
    Game.missile = missile;
    
    this.bindKeyHandlers();
    var ctx = canvasEl.getContext("2d");
    this.step(ctx);
  };
  
  Game.prototype.stopGame = function () {
    var game = this;
    window.clearInterval(this.gameIntervalID);
  }
  
  Game.prototype.step = function (ctx) {
    var game = this;
    this.gameIntervalID = window.setInterval(function () {
      game.checkCollisions();
      game.isOutOfBounds();
      game.move();
      game.draw(ctx);
    }, 30);
  };
  
  Game.prototype.bindKeyHandlers = function () {
    var game = this;
    key('up', function(){ game.ship.power([0,-1]) });
    key('down', function(){ game.ship.power([0,1]) });
    key('right', function(){ game.ship.power([1,0]) });
    key('left', function(){ game.ship.power([-1,0]) });
    key('space', function(){ game.fireBullet () });
    
  }
  
  
})(this);
