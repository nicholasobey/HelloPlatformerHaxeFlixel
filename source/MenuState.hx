package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState
{
	override public function create()
	{
		SessionStats.reset();

		var playButton:FlxButton = new FlxButton(0, 0, "Play", clickPlay);
		playButton.scale.set(3, 3);
		playButton.updateHitbox();
		playButton.label.setFormat(null, 24);
		playButton.label.fieldWidth = playButton.width;
		playButton.label.alignment = FlxTextAlign.CENTER;
		playButton.label.offset.y -= 10;
		playButton.screenCenter();
		add(playButton);

		var menuText:FlxText = new FlxText(0, 0, 0,
			"Controls:\nA or Left Arrow to move left\nD or Right Arrow to move right\nW or Up Arrow to jump\nR to reset (counts as death)\nClick and hold mouse to draw platforms",
			16);
		menuText.screenCenter();
		menuText.y += 96;
		add(menuText);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	private function clickPlay()
	{
		FlxG.switchState(new PlayState());
	}
}
