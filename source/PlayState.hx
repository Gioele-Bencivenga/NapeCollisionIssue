package;

import nape.callbacks.*;
import flixel.math.FlxMath;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.addons.nape.FlxNapeSpace;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.addons.display.FlxStarField.FlxStarField2D;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState {
	var asteroid:Asteroid;

	override public function create():Void {
		super.create();

		// initializing the space for physics simulation
		FlxNapeSpace.init();
		FlxNapeSpace.velocityIterations = 5;
		FlxNapeSpace.positionIterations = 5;

		// creating 2 asteroids
		asteroid = new Asteroid();
		asteroid.create(0, 150, 100, 0);
		add(asteroid);

		asteroid = new Asteroid();
		asteroid.create(FlxG.width, 150, -100, 0);
		add(asteroid);

		// creating listener
		var asteroidCollListener = new InteractionListener(CbEvent.BEGIN, InteractionType.COLLISION, Asteroid.CBODYAsteroid, Asteroid.CBODYAsteroid,
			CollAsteroidToAsteroid);
		FlxNapeSpace.space.listeners.add(asteroidCollListener);
	}

	public function CollAsteroidToAsteroid(i:InteractionCallback) {
		trace("Asteroid collided");

		var castAsteroid = i.int1.castBody.userData.data;
		trace("Secret: "+castAsteroid.secret);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}
