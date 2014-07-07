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
  
  var Bullet = Asteroids.Bullet = function (pos, vel) {
    Asteroids.MovingObject.call(this, pos, vel, RADIUS, COLOR);
  }
  
  Bullet.inherits(Asteroids.MovingObject);
  
  Bullet.prototype.draw = function (ctx) {
    var that = this;
    
    drawRotatedImage(ctx, Asteroids.Game.missile, that.xAxis, that.yAxis, Math.atan2(this.vx, -this.vy));
    
    
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
    console.log(this.xAxis);
  }
  
  
  Bullet.createBullet = function (pos, vel){

    var dx, dy;
    
    if (vel[0] === 0 && vel[1] === 0) { return null; }
    
    dx = vel[0] * 3;
    dy = vel[1] * 3;
    
    return new Bullet(
      [
        pos[0],
        pos[1]
      ],
      [
        dx,
        dy
      ]
    );
  }
  
  
})(this);
