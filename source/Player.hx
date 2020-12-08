package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	static inline var SPEED:Float = 192;
	static inline var BULLET_SPEED:Float = 384;

	var power:Float = 1;

	var dying:Bool = false;
	var deathTimer:Float = 0;

	// Constructor
	public function new(x:Float = 0, y:Float = 0)
	{
		// FlxSprite Parent constructor
		super(x, y);

		// Graphic
		loadGraphic(AssetPaths.player__png, true, 64, 64);
		animation.add("default", [0, 1, 2, 3, 2, 1], 6, true);
		animation.add("explode", [4, 5, 6, 7, 8, 9, 10], 12, false);
		animation.play("default");

		// Drag
		drag.x = drag.y = 2048;

		// Setup hitbox
		setSize(48, 24);
		offset.set(0, 16);
	}

	function movement()
	{
		if (dying)
		{
			return;
		}
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;
		// Check input
		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);
		// Cancel opposites
		if (up && down)
		{
			up = down = false;
		}
		if (left && right)
		{
			left = right = false;
		}
		// Movement
		if (up || down || left || right)
		{
			var newAngle:Float = 0;
			// Up direction
			if (up)
			{
				newAngle = -90;
				if (left)
				{
					newAngle -= 45;
				}
				else if (right)
				{
					newAngle += 45;
				}
				facing = FlxObject.UP;
			}
			// Down direction
			else if (down)
			{
				newAngle = 90;
				if (left)
				{
					newAngle += 45;
				}
				else if (right)
				{
					newAngle -= 45;
				}
				facing = FlxObject.DOWN;
			}
			// Horizontals
			else if (left)
			{
				newAngle = 180;
				facing = FlxObject.LEFT;
			}
			else if (right)
			{
				newAngle = 0;
				facing = FlxObject.RIGHT;
			}
			// Apply the velocity
			velocity.set(SPEED, 0);
			velocity.rotate(FlxPoint.weak(0, 0), newAngle);
		}
	}

	function shooting()
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			var playState:PlayState = cast FlxG.state;
			var bullet:Bullet = playState.bullets.recycle();
			// bullet.reset(x + width / 2 - bullet.width / 2, y);
			if (bullet != null)
			{
				bullet.shoot(x + width / 2 - bullet.width / 2, y + height / 2 - bullet.height / 2, BULLET_SPEED, 0, power);
			}
			else
			{
				trace("No bullet found");
			}
		}
	}

	public function die()
	{
		dying = true;
		animation.play("explode");
	}

	override function update(elapsed:Float)
	{
		movement();
		shooting();
		// Handle death
		if (dying)
		{
			deathTimer += elapsed;
			if (deathTimer > 3 / 4)
			{
				FlxG.switchState(new GameOverState());
			}
		}

		super.update(elapsed);
	}
}
