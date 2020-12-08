/** 
	This enemy aims and shoots at the player.
**/

package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxVector;
import flixel.util.FlxColor;

class ShooterEnemy extends Enemy
{
	static inline var SPEED:Int = 64;
	static inline var BULLET_SPEED:Float = 96;

	var shotTimer:Float = 3;

	public function new(x:Float = 0, y:Float = 0, pHealth:Float = 1)
	{
		// Enemy parent constructor.
		super(x, y, pHealth);

		// Graphic
		loadGraphic(AssetPaths.shoot__png, true, 32, 32);
	}

	function movement()
	{
		// If on screen, perform normal behavior
		if (isOnScreen())
		{
			// Movement
			velocity.x = -SPEED;
		}
		else // Otherwise, just scroll normally.
		{
			velocity.x = -Enemy.SCROLL_SPEED;
		}
	}

	function shooting(elapsed:Float)
	{
		if (isOnScreen())
		{
			shotTimer -= elapsed;
			if (shotTimer <= 0)
			{
				var playState:PlayState = cast FlxG.state;
				var player:Player = playState.player;
				shotTimer = 3;
				// Aim and shoot
				var toPlayer:FlxVector = new FlxVector(player.x - x, player.y - y);
				toPlayer.normalize();
				var bullet:Bullet = playState.nmeBullets.recycle();
				if (bullet != null)
				{
					bullet.shoot(x - (width / 2), y - (height / 2), toPlayer.x * BULLET_SPEED, toPlayer.y * BULLET_SPEED, 1);
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		movement();
		shooting(elapsed);
		super.update(elapsed);
	}
}
