(function (root) {
  var Asteroids = root.Asteroids = (root.Asteroids || {});
  
  var Game = Asteroids.Game = function (dimX, dimY, numAsteroids, numShips, asteroids, spaceship, enemyShip, missile, football) {
    Game.asteroids = asteroids;
    Game.spaceship = spaceship;
		Game.enemyShip = enemyShip;
    Game.missile = missile;
		Game.football = football;
		
    this.dimX = dimX;
    this.dimY = dimY;
  	
    this.bullets = [];
    this.enemyBullets = [];
		
    this.ship = Asteroids.Ship.createShip(dimX, dimY);
				
    this.populateAsteroids(dimX, dimY, numAsteroids);
		this.populateEnemyShips(dimX, dimY, numShips);
  }
  
  Game.prototype.populateAsteroids = function(dimX, dimY, numAsteroids){
    this.asteroids = [];
    for (var i = 0; i < numAsteroids; ++i) {
      this.asteroids.push(Asteroids.Asteroid.randomAsteroid(dimX, dimY));
    }
  }
	
  Game.prototype.populateEnemyShips = function(dimX, dimY, numShips){
    this.enemyShips = [];
    for (var i = 0; i < numShips; ++i) {
      this.enemyShips.push(Asteroids.Ship.createEnemyShip(dimX, dimY));
    }
  }
  
  Game.prototype.fireBullet = function(){
    var bullet = this.ship.fireBullet();
    var game = this;
    
    if (bullet){
      game.bullets.push(bullet)      
    }		
  }
	
  Game.prototype.fireEnemyBullet = function(){
    var game = this;
		
    this.enemyShips.forEach(function (enemyShip) {
      var bullet = enemyShip.fireEnemyBullet();
	    if (bullet){
	      game.enemyBullets.push(bullet)      
	    }
    });
  }
  
  Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, this.dimX, this.dimY);

    this.asteroids.forEach(function (asteroid) {
      asteroid.draw(ctx);
    });
    
    this.bullets.forEach(function (bullet) {
      bullet.draw(ctx);
    });
		
    this.enemyBullets.forEach(function (bullet) {
      bullet.draw(ctx);
    });
		
    this.enemyShips.forEach(function (enemyShip) {
      enemyShip.draw(ctx);
    });
    
    this.ship.draw(ctx);		
  };

  Game.prototype.move = function () {
    var game = this;
    
    this.enemyShips.forEach(function (ship) {
			var limit = 5;
			if (ship.vx > limit || ship.vy > limit || ship.vx < -limit || ship.vy < -limit){
				ship.vx = ((Math.random()*2)-1)*0.3;
				ship.vy = ((Math.random()*2)-1)*0.3;
			}
			
      ship.power([ship.vx/10, ship.vy/10]);
	    ship.move(game.dimX, game.dimY);
    });
		
    this.asteroids.forEach(function (asteroid) {
      asteroid.move(game.dimX, game.dimY);
    });
    
    this.bullets.forEach(function (bullet) {
      if (bullet.xAxis >= game.dimX) {
        game.removeBullet(bullet);
				return;
      }
      else if (bullet.yAxis >= game.dimY) {
        game.removeBullet(bullet);
				return;
      }
			
      bullet.move(game.dimX, game.dimY);
    });
		
    this.enemyBullets.forEach(function (bullet) {
      if (bullet.xAxis >= game.dimX) {
        game.removeEnemyBullet(bullet);
				return;
      }
      else if (bullet.yAxis >= game.dimY) {
        game.removeEnemyBullet(bullet);
				return;
      }
			
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
		
    this.enemyShips.forEach(function(ship) {
      if (ship.isCollidedWith(game.ship)){
        alert("Game over!");
        game.stopGame();
      }
    });
    
    this.enemyBullets.forEach(function(bullet) {
      if (bullet.isCollidedWith(game.ship)){
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
		
    this.enemyShips.forEach(function(ship) {
      game.bullets.forEach(function(bullet){
        if (bullet.isCollidedWith(ship)){
          game.removeEnemyShip(ship);
          game.removeBullet(bullet);
        }
      })
    });
		
  };
  
  Game.prototype.removeAsteroid = function(asteroid){
    var index = this.asteroids.indexOf(asteroid);
		this.asteroids.splice(index, 1);
  }
  
  Game.prototype.removeBullet = function(bullet){
    var index = this.bullets.indexOf(bullet);
		this.bullets.splice(index, 1);
  }
	
  Game.prototype.removeEnemyBullet = function(bullet){
    var index = this.enemyBullets.indexOf(bullet);
		this.enemyBullets.splice(index, 1);
  }
	
  Game.prototype.removeEnemyShip = function(ship){
    var index = this.enemyShips.indexOf(ship);
		this.enemyShips.splice(index, 1);
  }
	
	Game.prototype.checkWin = function(){
    if (this.asteroids.length === 0){
      alert("You win!");
      this.stopGame();
    }
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
  
  Game.prototype.start = function (canvasEl) {    
    this.bindKeyHandlers();
    var ctx = canvasEl.getContext("2d");
    this.step(ctx);
  };
  
  Game.prototype.stopGame = function () {
    var game = this;
    window.clearInterval(this.gameIntervalID);
    window.clearInterval(this.enemyFireInterval);
  }
  
  Game.prototype.step = function (ctx) {
    var game = this;
    this.gameIntervalID = window.setInterval(function () {
      game.checkCollisions();
      game.checkWin();
      game.isOutOfBounds();
      game.move();
      game.draw(ctx);
    }, 30);
		
		this.enemyFireInterval = window.setInterval(function(){
			game.fireEnemyBullet();
		}, 2000);
  };
  
  Game.prototype.bindKeyHandlers = function () {
    var game = this;
    key('up', function(){ game.ship.power([0,-1]) });
    key('down', function(){ game.ship.power([0,1]) });
    key('right', function(){ game.ship.power([1,0]) });
    key('left', function(){ game.ship.power([-1,0]) });
    key('space', function(){ game.fireBullet() });
  }
  
  
})(this);
