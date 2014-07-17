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
  
  var COLOR = "white";
  var RADIUS = 10;
  
  var Bullet = Asteroids.Bullet = function (pos, vel, img) {
    Asteroids.MovingObject.call(this, pos, vel, RADIUS, COLOR);
		this.img = img;
  }
  
  Bullet.inherits(Asteroids.MovingObject);
  
  Bullet.prototype.draw = function (ctx) {
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
  
  Bullet.prototype.move = function (maxX, maxY) {
    this.xAxis = ((this.xAxis + this.vx));
    this.yAxis = ((this.yAxis + this.vy));   

    if (this.xAxis <= 0) {
      this.xAxis = maxX
    }
    if (this.yAxis <= 0) {
      this.yAxis = maxY
    }
  }
  
  
  Bullet.createBullet = function (pos, vel){
    var dx, dy;
    
    if (vel[0] === 0 && vel[1] === 0) { return null; }
    
		var shipSpeed = Math.pow(vel[0], 2) + Math.pow(vel[1], 2);
		var bulletSpeed = 1300;
		var bulletFactor = bulletSpeed / shipSpeed;
				
    dx = Math.sqrt(Math.pow(vel[0], 2) * bulletFactor);
    dy = Math.sqrt(Math.pow(vel[1], 2) * bulletFactor);
    
		if (vel[0] < 0) dx = dx * -1;
		if (vel[1] < 0) dy = dy * -1;
		
    return new Bullet([pos[0], pos[1]], [dx, dy], Asteroids.Game.missile);
  }
	
  Bullet.createEnemyBullet = function (pos, vel){
    var dx, dy;
    
    if (vel[0] === 0 && vel[1] === 0) { return null; }
    
		var shipSpeed = Math.pow(vel[0], 2) + Math.pow(vel[1], 2);
		var bulletSpeed = 500;
		var bulletFactor = bulletSpeed / shipSpeed;
				
    dx = Math.sqrt(Math.pow(vel[0], 2) * bulletFactor);
    dy = Math.sqrt(Math.pow(vel[1], 2) * bulletFactor);
    
		if (vel[0] < 0) dx = dx * -1;
		if (vel[1] < 0) dy = dy * -1;
		
    return new Bullet([pos[0], pos[1]], [dx, dy], Asteroids.Game.football);
  }
	
  
  
})(this);
