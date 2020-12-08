package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Bullet extends FlxSprite
{
	public var dmg:Float; // Damage

	var xDir:Float;
	var yDir:Float;

	// Constructor
	public function new(x:Float, y:Float, isEnemyBullet:Bool)
	{
		super(x, y);
		if (isEnemyBullet)
		{
			loadGraphic(AssetPaths.enemyBullet__png, true, 16, 16);
		}
		else
		{
			loadGraphic(AssetPaths.playerBullet__png, true, 16, 16);
		}
	}

	public function shoot(px:Float, py:Float, pdx:Float, pdy:Float, pDamage:Float)
	{
		x = px;
		y = py;
		xDir = pdx;
		yDir = pdy;
		dmg = pDamage;
	}

	function movement()
	{
		velocity.x = xDir;
		velocity.y = yDir;
	}

	override function update(elapsed:Float)
	{
		movement();
		super.update(elapsed);
	}
}
