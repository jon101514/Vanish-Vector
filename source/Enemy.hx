/** 
	The base enemy class
**/

package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class Enemy extends FlxSprite
{
	static inline var SCROLL_SPEED:Float = 64;

	public function new(x:Float = 0, y:Float = 0, pHealth:Float = 1)
	{
		// FlxSprite Parent constructor
		super(x, y);

		// Graphic
		makeGraphic(16, 16, FlxColor.WHITE);

		// Drag
		drag.x = drag.y = 2048;

		// Setup hitbox
		setSize(14, 14);

		// Health
		health = pHealth;
	}

	/* Called when hit. */
	public function takeDamage(dmg:Float)
	{
		health -= dmg;

		if (health <= 0)
		{
			die();
		}
	}

	function die()
	{
		var playState:PlayState = cast FlxG.state;
		var exp:Explosion = playState.explosions.recycle();
		if (exp != null)
		{
			exp.explode(x - (width / 2), y - (height / 2));
		}
		exists = false;
	}
}
