/** 
	This enemy moves according to a sine wave.
**/

package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class SinEnemy extends Enemy
{
	var timer:Float = 0;
	var yOrigin:Float;

	static inline var SPEED:Float = 72;
	static inline var AMP:Float = 48;
	static inline var FREQ:Float = 4;

	public function new(x:Float = 0, y:Float = 0, pHealth:Float = 1)
	{
		// Enemy parent constructor.
		super(x, y, pHealth);

		yOrigin = y;

		// Graphic
		loadGraphic(AssetPaths.sin__png, true, 32, 32);
		animation.add("default", [0, 1, 2, 1], 6, true);
		animation.play("default");
	}

	function movement()
	{
		if (isOnScreen())
		{
			velocity.x = -SPEED;
			y = yOrigin + (Math.sin(FREQ * timer) * AMP);
		}
		else // Otherwise, just scroll normally.
		{
			velocity.x = -Enemy.SCROLL_SPEED;
		}
	}

	override function update(elapsed:Float)
	{
		movement();
		timer += elapsed;
		super.update(elapsed);
	}
}
