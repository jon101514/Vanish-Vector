package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	public var player:Player;

	// Walls
	var walls:FlxGroup;
	var upWall:FlxSprite;
	var downWall:FlxSprite;
	var leftWall:FlxSprite;
	var rightWall:FlxSprite;

	var bulletWalls:FlxGroup;
	var farWall:FlxSprite;

	// Bullets
	public var bullets:FlxTypedGroup<Bullet>;

	// Enemy
	var enemies:FlxGroup;

	public var nmeBullets:FlxTypedGroup<Bullet>;

	// Feedback FX
	public var explosions:FlxTypedGroup<Explosion>;

	// Level Triggers
	var triggers:FlxGroup;

	// Parallax Layers
	var frontLayers:FlxTypedGroup<ParallaxLayer>;
	var backLayers:FlxTypedGroup<ParallaxLayer>;

	// Level Loading
	var loader:FlxOgmo3Loader;

	// Constants
	static inline var CLIP_SIZE:Int = 32;

	override public function create()
	{
		// Place the player
		player = new Player(FlxG.width / 3, FlxG.height / 2);
		add(player);

		// Make the boundaries
		makeWalls();

		// Make parallax layers
		makeParallaxLayers();

		// Make bullet pools
		makePlayerBulletPool();
		makeEnemyBulletPool();

		// Make feedback FX explosions
		makeExplosions();

		// Load the level data
		enemies = new FlxGroup();
		triggers = new FlxGroup();
		loader = new FlxOgmo3Loader(AssetPaths.sidescrollingshooter__ogmo, AssetPaths.level1__json);
		loader.loadEntities(placeEntities, "entities");
		add(enemies);
		add(triggers);

		// Play music
		if (FlxG.sound.music == null)
		{ // don't restart the music if it's already playing
			FlxG.sound.playMusic(AssetPaths.airbattle__ogg, 1, true);
		}

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		// Collisions
		FlxG.collide(player, walls);

		FlxG.collide(bullets, bulletWalls, bulletTouchWall);
		FlxG.overlap(bullets, enemies, enemyTakeDamage);

		FlxG.overlap(player, enemies, playerTakeDamage);
		FlxG.overlap(player, nmeBullets, playerTakeDamage);

		FlxG.collide(triggers, farWall, triggerTouchWall);
	}

	/* Read in the level data and spawn in enemies accordingly. */
	function placeEntities(entity:EntityData)
	{
		switch (entity.name)
		{
			case "sin":
				enemies.add(new SinEnemy(entity.x, entity.y, 1));
			case "follow":
				enemies.add(new FollowEnemy(entity.x, entity.y, 1));
			case "shooter":
				enemies.add(new ShooterEnemy(entity.x, entity.y, 4));
			case "exploder":
				var exploder:ExploderEnemy = new ExploderEnemy(entity.x, entity.y, 4);
				enemies.add(exploder);
			case "touchDown":
				triggers.add(new LevelTrigger(entity.x, entity.y, entity.name));
			case "leave":
				triggers.add(new LevelTrigger(entity.x, entity.y, entity.name));
			case "end":
				triggers.add(new LevelTrigger(entity.x, entity.y, entity.name));
		}
	}

	/* Creates bullets to be recycled by the player.*/
	function makePlayerBulletPool()
	{
		bullets = new FlxTypedGroup<Bullet>();
		var bullet:Bullet;
		for (i in 0...CLIP_SIZE)
		{
			bullet = new Bullet(32, 32, false);
			bullet.exists = false;
			bullets.add(bullet);
		}
		add(bullets);
	}

	/* Creates bullets to be recycled amongst the enemies.*/
	function makeEnemyBulletPool()
	{
		nmeBullets = new FlxTypedGroup<Bullet>();
		var bullet:Bullet;
		for (i in 0...CLIP_SIZE)
		{
			bullet = new Bullet(32, 32, true);
			bullet.exists = false;
			nmeBullets.add(bullet);
		}
		add(nmeBullets);
	}

	/* Create object pooled explosions. */
	function makeExplosions()
	{
		explosions = new FlxTypedGroup<Explosion>();
		var exp:Explosion;
		for (i in 0...8)
		{
			exp = new Explosion(0, 0);
			exp.exists = false;
			explosions.add(exp);
		}
		add(explosions);
	}

	/* Makes boundaries that keep the player in bounds and also the wall on the right side that destroys bullets.*/
	function makeWalls()
	{
		// Make groups
		walls = new FlxGroup();
		bulletWalls = new FlxGroup();

		// Populate groups
		var wallThick:Int = 4;

		upWall = new FlxSprite(0, 0);
		upWall.makeGraphic(FlxG.width, wallThick, FlxColor.TRANSPARENT);
		upWall.immovable = true;
		walls.add(upWall);
		bulletWalls.add(upWall);

		downWall = new FlxSprite(0, FlxG.height - wallThick);
		downWall.makeGraphic(FlxG.width, wallThick, FlxColor.TRANSPARENT);
		downWall.immovable = true;
		walls.add(downWall);
		bulletWalls.add(downWall);

		leftWall = new FlxSprite(0, 0);
		leftWall.makeGraphic(wallThick, FlxG.height, FlxColor.TRANSPARENT);
		leftWall.immovable = true;
		walls.add(leftWall);
		bulletWalls.add(leftWall);

		rightWall = new FlxSprite(FlxG.width * 0.75, 0);
		rightWall.makeGraphic(wallThick, FlxG.height, FlxColor.TRANSPARENT);
		rightWall.immovable = true;
		walls.add(rightWall);

		farWall = new FlxSprite(FlxG.width, 0);
		farWall.makeGraphic(wallThick, FlxG.height, FlxColor.TRANSPARENT);
		farWall.immovable = true;
		bulletWalls.add(farWall);

		// Render the walls
		add(walls);
		add(bulletWalls);
	}

	/* Spawn some background layers that move at different speeds. */
	function makeParallaxLayers()
	{
		// Make groups
		frontLayers = new FlxTypedGroup<ParallaxLayer>();
		backLayers = new FlxTypedGroup<ParallaxLayer>();

		// Add to groups
		var frontLayer:ParallaxLayer = new ParallaxLayer(0, 64, 64, true);
		frontLayers.add(frontLayer);
		frontLayer = new ParallaxLayer(512, 64, 64, true);
		frontLayers.add(frontLayer);
		var backLayer:ParallaxLayer = new ParallaxLayer(0, 96, 48, false);
		backLayers.add(backLayer);
		backLayer = new ParallaxLayer(512, 96, 48, false);
		backLayers.add(backLayer);

		// Render groups
		add(backLayers);
		add(frontLayers);
	}

	/* Destroys a bullet that touches a wall; or rather deactivates the bullet. */
	function bulletTouchWall(bullet:Bullet, wall:FlxSprite)
	{
		bullet.exists = false;
	}

	/* Destroys the bullet and damages the enemy. */
	function enemyTakeDamage(bullet:Bullet, enemy:Enemy)
	{
		enemy.takeDamage(bullet.dmg);
		bullet.exists = false;
	}

	/* */
	function playerTakeDamage(player:Player, enemy:Enemy)
	{
		player.die();
	}

	function triggerTouchWall(trigger:LevelTrigger, wall:FlxSprite)
	{
		trace("trigger touch wall");
		switch (trigger.name)
		{
			case "touchDown":
				for (i in 0...frontLayers.members.length)
				{
					frontLayers.members[i].touchDown();
				}
				for (i in 0...backLayers.members.length)
				{
					backLayers.members[i].touchDown();
				}
			case "leave":
				for (i in 0...frontLayers.members.length)
				{
					frontLayers.members[i].leave();
				}
				for (i in 0...backLayers.members.length)
				{
					backLayers.members[i].leave();
				}
			case "end":
				FlxG.switchState(new EndingState());
		}
	}
}
