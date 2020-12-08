/** 
	This enemy tracks the player.
**/

package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class FollowEnemy extends Enemy
{
	static inline var Y_THRESH:Int = 16;
	static inline var SPEED:Int = 64;

	public function new(x:Float = 0, y:Float = 0, pHealth:Float = 1)
	{
		// Enemy parent constructor.
		super(x, y, pHealth);

		// Graphic
		loadGraphic(AssetPaths.follow__png, true, 32, 32);
	}

	function movement()
	{
		// If on screen, perform normal behavior
		if (isOnScreen())
		{
			// Get the player from the playstate
			var playState:PlayState = cast FlxG.state;
			var player:Player = playState.player;
			// Determine how we're moving
			if (Math.abs(y - player.y) < Y_THRESH) // The player's within +- 16px of us, move forward
			{
				velocity.x = -SPEED;
			}
			else if (y < player.y) // The player is above us; move diag + up
			{
				velocity.x = -SPEED * Math.sqrt(2);
				velocity.y = SPEED * Math.sqrt(2);
			}
			else // The player is below us; move diag + down
			{
				velocity.x = -SPEED * Math.sqrt(2);
				velocity.y = -SPEED * Math.sqrt(2);
			}
		}
		else // Otherwise, just scroll normally.
		{
			velocity.x = -Enemy.SCROLL_SPEED;
		}
	}

	override function update(elapsed:Float)
	{
		movement();
		super.update(elapsed);
	}
}
