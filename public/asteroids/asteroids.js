(function (root) {
  var Asteroids = root.Asteroids = (root.Asteroids || {});
  
  Function.prototype.inherits = function(parent){
    function Surrogate() {}
    Surrogate.prototype = parent.prototype;
    this.prototype = new Surrogate (); 
  }
  
  var COLOR = "brown";
  var RADIUS = 25;
  
  var Asteroid = Asteroids.Asteroid = function (pos, vel) {
    Asteroids.MovingObject.call(this, pos, vel, RADIUS, COLOR);
  }
  
  Asteroid.randomAsteroid = function (dimX, dimY){
		aDimX = dimX * Math.random();
		aDimY = dimY * Math.random();
				
		while ((aDimX < dimX * 0.6) && (aDimX > dimX * 0.4) && (aDimY < dimY * 0.6) && (aDimY > dimY * 0.4)) {
			aDimX = dimX * Math.random();
			aDimY = dimY * Math.random();
		}

    return new Asteroid(
      [
        aDimX,
        aDimY
      ],
      [
        ((Math.random()*3)-1),
        ((Math.random()*3)-1)
      ]
    );
  }
    
  Asteroid.inherits(Asteroids.MovingObject);
  
  Asteroid.prototype.draw = function (ctx) {
    var that = this;
    
    ctx.drawImage(Asteroids.Game.asteroid, that.xAxis-25, that.yAxis-17);
    
    
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
  
})(this);
