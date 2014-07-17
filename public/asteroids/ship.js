(function (root) {
  var Asteroids = root.Asteroids = (root.Asteroids || {});
  
  function drawRotatedImage(ctx, image, x, y, angle) {
  	ctx.save();
  	ctx.translate(x, y);
  	ctx.rotate(angle);
  	ctx.drawImage(image, -(image.width/2), -(image.height/2));
  	ctx.restore(); 
  }
  
  Function.prototype.inherits = function(parent){
    function Surrogate() {}
    Surrogate.prototype = parent.prototype;
    this.prototype = new Surrogate (); 
  }
  
  var COLOR = "green";
  var RADIUS = 40;
  
  var Ship = Asteroids.Ship = function (pos, vel, img) {
    Asteroids.MovingObject.call(this, pos, vel, RADIUS, COLOR);
		this.img = img;
  }
  
  Ship.inherits(Asteroids.MovingObject);
  
  Ship.prototype.draw = function (ctx) {
    drawRotatedImage(ctx, this.img, this.xAxis, this.yAxis, Math.atan2(this.vx, -this.vy));
    
    ctx.fillStyle = this.col;
    ctx.beginPath();

    ctx.arc(
      this.xAxis,
      this.yAxis,
      this.rad,
      0,
      2 * Math.PI,
      false
    );
  };

  Ship.createShip = function (dimX, dimY){
    return new Ship([dimX / 2, dimY / 2], [0, 0], Asteroids.Game.spaceship);
  }
	
  Ship.createEnemyShip = function (dimX, dimY){
		sDimX = dimX * Math.random();
		sDimY = dimY * Math.random();
		
		while ((sDimX < dimX * 0.7) && (sDimX > dimX * 0.3) && (sDimY < dimY * 0.7) && (sDimY > dimY * 0.3)) {
			sDimX = dimX * Math.random();
			sDimY = dimY * Math.random();
		};
		
    return new Ship([sDimX, sDimY], [((Math.random()*2)-1)*0.3, ((Math.random()*2)-1)*0.3], Asteroids.Game.enemyShip);
  }
    
  Ship.prototype.power = function(impulse){
    this.vx += impulse[0];
    this.vy += impulse[1];
  }
  
  Ship.prototype.fireBullet = function(){
    return Asteroids.Bullet.createBullet([this.xAxis, this.yAxis], [this.vx, this.vy]);
  }
	
  Ship.prototype.fireEnemyBullet = function(){
    return Asteroids.Bullet.createEnemyBullet([this.xAxis, this.yAxis], [this.vx, this.vy]);
  }
	
  
  
})(this);
