/** 
	This enemy explodes into 4 bullets if shot.
**/

package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class ExploderEnemy extends Enemy
{
	static inline var SPEED:Float = 48;
	static inline var BULLET_SPEED:Float = 96;

	var power:Float = 1;

	public function new(x:Float = 0, y:Float = 0, pHealth:Float = 1)
	{
		// Enemy parent constructor.
		super(x, y, pHealth);

		// Graphic
		loadGraphic(AssetPaths.explode__png, true, 32, 32);
	}

	function movement()
	{
		// If on screen, perform normal behavior
		if (isOnScreen())
		{
			velocity.x = -SPEED;
		}
		else // Otherwise, just scroll normally.
		{
			velocity.x = -Enemy.SCROLL_SPEED;
		}
	}

	/* Explode into 4 bullets shooting across diagonals. */
	public function explode()
	{
		var playState:PlayState = cast FlxG.state;
		var bullet:Bullet;
		// Activate 4 bullets from the enemy bullet pool
		for (i in 0...4)
		{
			bullet = playState.nmeBullets.recycle();
			if (bullet != null)
			{
				// Determine which way the bullet shoots.
				var dx:Float = 0;
				var dy:Float = 0;
				switch (i)
				{
					case 0:
						dx = BULLET_SPEED * Math.sqrt(2);
						dy = BULLET_SPEED * Math.sqrt(2);
					case 1:
						dx = -1 * BULLET_SPEED * Math.sqrt(2);
						dy = BULLET_SPEED * Math.sqrt(2);
					case 2:
						dx = BULLET_SPEED * Math.sqrt(2);
						dy = -1 * BULLET_SPEED * Math.sqrt(2);
					case 3:
						dx = -1 * BULLET_SPEED * Math.sqrt(2);
						dy = -1 * BULLET_SPEED * Math.sqrt(2);
				}
				bullet.shoot(x + width / 2 - bullet.width / 2, y + height / 2 - bullet.height / 2, dx, dy, power);
			}
		}
		// Then self-destruct
		exists = false;
	}

	override function update(elapsed:Float)
	{
		movement();
		super.update(elapsed);
	}

	override function die()
	{
		explode();

		super.die();
	}
}
