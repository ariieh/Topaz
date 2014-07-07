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
  
  var Ship = Asteroids.Ship = function (pos, vel) {
    Asteroids.MovingObject.call(this, pos, vel, RADIUS, COLOR);
  }
  
  Ship.inherits(Asteroids.MovingObject);
  
  Ship.prototype.draw = function (ctx) {
    var that = this;
  
    drawRotatedImage(ctx, Asteroids.Game.spaceship, that.xAxis, that.yAxis, Math.atan2(this.vx, -this.vy));
    
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
    return new Ship(
      [
        dimX / 2,
        dimY / 2
      ],
      [
        0,
        0
      ]
    );
  }
    
  Ship.prototype.power = function(impulse){
    this.vx += impulse[0];
    this.vy += impulse[1];
  }
  
  Ship.prototype.fireBullet = function(){
    return Asteroids.Bullet.createBullet([this.xAxis, this.yAxis], [this.vx, this.vy]);
  }
  
  
})(this);
