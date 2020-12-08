package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Explosion extends FlxSprite
{
	var timer:Float = 0;

	// Constructor
	public function new(x:Float, y:Float)
	{
		super(x, y);
		// Create explosion animation
		loadGraphic(AssetPaths.explosion__png, true, 64, 64);
		animation.add("explode", [0, 1, 2, 3], 24, false);
	}

	public function explode(px:Float, py:Float)
	{
		timer = 0;
		x = px;
		y = py;
		animation.play("explode");
	}

	override function update(elapsed:Float)
	{
		// Update timer; set back to nonexisting after a period of time
		timer += elapsed;
		if (timer > 2)
		{
			exists = false;
		}
		super.update(elapsed);
	}
}
