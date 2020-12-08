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

class EndingState extends FlxState
{
	var playButton:FlxButton;
	var primeText:FlxText;
	var subText:FlxText;

	override public function create()
	{
		// Make a new "Play" button
		playButton = new FlxButton(0, FlxG.height * 3 / 4, "Play Again", clickPlay);
		playButton.screenCenter(FlxAxes.X); // ...and center it
		add(playButton);

		// Prime Message: You Won
		primeText = new FlxText(FlxG.width / 2, FlxG.height * (1 / 3), 0, "You Win!", 36);
		primeText.screenCenter(FlxAxes.X);
		add(primeText);
		// Sub Message
		subText = new FlxText(FlxG.width / 2, FlxG.height * (1 / 2), 0,
			"You successfully escaped out of \ndangerous enemy territory.\nIn the future,\nlook out for more levels!\nThank you for playing!", 18);
		subText.screenCenter(FlxAxes.X);
		add(subText);


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
