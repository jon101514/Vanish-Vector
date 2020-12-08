package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class LevelTrigger extends FlxSprite
{
	public var name:String;

	static inline var SCROLL_SPEED:Float = 64;

	// Constructor
	public function new(x:Float, y:Float, pName:String)
	{
		trace("LEVEL TRIGGER: " + pName + " CREATED");
		super(x, y);
		name = pName;
	}

	function movement()
	{
		velocity.x = -SCROLL_SPEED;
	}

	override function update(elapsed:Float)
	{
		movement();
		super.update(elapsed);
	}
}
