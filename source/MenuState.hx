package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.math.FlxPoint;
import flixel.text.FlxBitmapText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	var titleLogo:FlxSprite;
	var playButton:FlxButton;
	var ctrlText:FlxText;
	var copyText:FlxText;

	override public function create()
	{
		// Make a new "Play" button
		playButton = new FlxButton(0, FlxG.height * 3 / 4, "Play", clickPlay);
		playButton.screenCenter(FlxAxes.X); // ...and center it
		add(playButton);

		// Make a logo
		titleLogo = new FlxSprite(0, FlxG.height * 1 / 8, AssetPaths.title__png);
		titleLogo.screenCenter(FlxAxes.X); // ...and center it
		add(titleLogo);

		// Controls
		ctrlText = new FlxText(FlxG.width / 4, FlxG.height * (2 / 3), 0, "WASD to move, Space to shoot", 16);
		add(ctrlText);

		// Info at the bottom
		copyText = new FlxText(FlxG.width / 2, FlxG.height * (15 / 16), 0, "Created by Jonathan So, 2020.", 16);
		add(copyText);

		// playButton.onUp.sound = FlxG.sound.load(AssetPaths.select__wav);

		// Play the music
		// if (FlxG.sound.music == null)
		// { // don't restart the music if it's already playing
		// 	FlxG.sound.playMusic(AssetPaths.HaxeFlixel_Tutorial_Game__ogg, 1, true);
		// }

		// Fade transition
		FlxG.camera.fade(FlxColor.BLACK, 0.33, true);

		super.create();
	}

	function clickPlay()
	{
		// Switch to the PlayState from this state
		FlxG.switchState(new PlayState());
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
