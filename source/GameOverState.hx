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

class GameOverState extends FlxState
{
	var playButton:FlxButton;
	var primeText:FlxText;
	var subText:FlxText;

	override public function create()
	{
		// Make a new "Play" button
		playButton = new FlxButton(0, FlxG.height * 3 / 4, "Retry", clickPlay);
		playButton.screenCenter(FlxAxes.X); // ...and center it
		add(playButton);

		// Prime Message: Game Over
		primeText = new FlxText(FlxG.width / 2, FlxG.height * (1 / 3), 0, "Game Over", 36);
		primeText.screenCenter(FlxAxes.X);
		add(primeText);
		// Sub Message: See you next game!
		subText = new FlxText(FlxG.width / 2, FlxG.height * (1 / 2), 0, "See you next game!", 18);
		subText.screenCenter(FlxAxes.X);
		add(subText);

		// playButton.onUp.sound = FlxG.sound.load(AssetPaths.select__wav);

		// Play the music
		// if (FlxG.sound.music == null)
		// { // don't restart the music if it's already playing
		// 	FlxG.sound.playMusic(AssetPaths.HaxeFlixel_Tutorial_Game__ogg, 1, true);
		// }

		// Fade transition
		FlxG.camera.fade(FlxColor.BLACK, 1, true);

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
