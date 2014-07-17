(function (root) {
  var Asteroids = root.Asteroids = (root.Asteroids || {});
  
  var MovingObject = Asteroids.MovingObject = function (pos, vel, rad, col, img) {
		console.log(pos, vel, img, rad)
    this.xAxis = pos[0];
    this.yAxis = pos[1];
    this.vx = vel[0];
    this.vy = vel[1];
		this.rad = rad;
		this.col = col;
		this.img = img;
  }
  
  MovingObject.prototype.move = function (maxX, maxY) {
    this.xAxis = ((this.xAxis + this.vx) % maxX);
    this.yAxis = ((this.yAxis + this.vy) % maxY);   

    if (this.xAxis <= 0) {
      this.xAxis = maxX
    }
    if (this.yAxis <= 0) {
      this.yAxis = maxY
    }
  }
  
  MovingObject.prototype.isCollidedWith = function (otherObject) {
    var xDiff = Math.pow((this.xAxis - otherObject.xAxis), 2);
    var yDiff = Math.pow((this.yAxis - otherObject.yAxis), 2);
    var distance = Math.sqrt(xDiff + yDiff);
    var sumRadii = this.rad + otherObject.rad;
    if (sumRadii > distance) {
      return true;
    }
    else {
      return false;
    }
  } 
  
})(this);
