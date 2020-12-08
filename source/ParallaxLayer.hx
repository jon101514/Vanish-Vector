package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

enum State
{
	TOUCH_DOWN;
	STAY;
	LEAVE;
}

class ParallaxLayer extends FlxSprite
{
	var speed:Float;
	var yThreshold:Float;
	var state:State; // Whether the player's touching down, staying, or leaving

	var WIDTH:Float = 512;

	public function new(x:Float = 0, y:Float = 0, pSpeed:Float = 16, isFront:Bool)
	{
		// FlxSprite Parent constructor
		super(x, FlxG.height); // Spawn way below the viewport, since the game starts in the air.

		state = STAY;
		speed = pSpeed;
		yThreshold = y;

		// Graphic
		if (isFront)
		{
			loadGraphic(AssetPaths.parallax1__png, true, 512, 512);
		}
		else
		{
			loadGraphic(AssetPaths.parallax2__png, true, 512, 512);
		}
	}

	function movement()
	{
		// Handle parallax scrolling and resetting.
		velocity.x = -speed;
		if (x <= -WIDTH) // reset position
		{
			x = FlxG.width;
		}

		// Handles player state.
		if (state == TOUCH_DOWN) // Touching down; scroll up.
		{
			// We're done moving up.
			if (y <= yThreshold)
			{
				velocity.y = 0;
				state = STAY;
			}
			else
			{
				velocity.y = -speed;
			}
		}
		else if (state == LEAVE) // Leaving ground; scroll down.
		{
			// We're done moving down.
			if (y >= FlxG.height)
			{
				velocity.y = 0;
				state = STAY;
			}
			else
			{
				velocity.y = speed;
			}
		}
	}

	/* The player is flying onto the ground, so scroll the parallax layers up until we reach a threshold. */
	public function touchDown()
	{
		state = TOUCH_DOWN;
	}

	public function leave()
	{
		state = LEAVE;
	}

	override function update(elapsed:Float)
	{
		movement();
		super.update(elapsed);
	}
}
