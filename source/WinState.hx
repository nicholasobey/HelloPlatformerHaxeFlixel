package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class WinState extends FlxState
{
	override public function create()
	{
		var playButton:FlxButton = new FlxButton(0, 0, "Play Again", clickPlay);
		playButton.scale.set(3, 3);
		playButton.updateHitbox();
		playButton.label.setFormat(null, 24);
		playButton.label.fieldWidth = playButton.width;
		playButton.label.alignment = FlxTextAlign.CENTER;
		playButton.label.offset.y -= 10;
		playButton.screenCenter();
		add(playButton);

		var winText:FlxText = new FlxText(0, 0, 0,
			"Total Deaths: "
			+ SessionStats.deathCount
			+ "\nTotal Platforms: "
			+ SessionStats.platformCount
			+ "\nTotal Platform Volume: "
			+ SessionStats.platformVolumeCount,
			16);
		winText.screenCenter();
		winText.y -= 96;
		add(winText);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	private function clickPlay()
	{
		SessionStats.reset();
		FlxG.switchState(new PlayState());
	}
}
