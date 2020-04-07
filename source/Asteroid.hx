import nape.callbacks.*;
import flixel.FlxG;
import flixel.addons.nape.FlxNapeSprite;

class Asteroid extends FlxNapeSprite {
	public static var CBODYAsteroid:CbType = new CbType();

	public var secret = 10;

	public function new() {
		super();

		// smooth rotations, bad performance
		antialiasing = true;        
	}

	public function create(_x:Int = 0, _y:Int = 0, _xVel = 0, _yVel = 0):Asteroid {
		x = _x;
        y = _y;
		
		loadGraphic("assets/images/Asteroids/Asteroid_Small.png");
		
		createCircularBody(10);
		// adding CBODY
		body.cbTypes.add(CBODYAsteroid);
		body.userData.data = this;
		setBodyMaterial(1, 0.2, 0.4, 3, 0.001);
		body.velocity.setxy(_xVel, _yVel);
		
		return this;
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
