package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxAxes;

class HUD extends FlxTypedGroup<FlxSprite>
{
	var deathCounter:FlxText;
	var platformCounter:FlxText;
	var platformVolumeCounter:FlxText;

	override public function new()
	{
		super();

		deathCounter = new FlxText(0, 2, 0, "Deaths: " + Std.string(SessionStats.deathCount), 16);
		deathCounter.screenCenter(FlxAxes.X);
		deathCounter.x -= 200;
		deathCounter.alignment = FlxTextAlign.LEFT;

		platformCounter = new FlxText(0, 2, 0, "Platforms: " + Std.string(SessionStats.platformCount), 16);
		platformCounter.screenCenter(FlxAxes.X);
		platformCounter.x -= 50;
		deathCounter.alignment = FlxTextAlign.CENTER;

		platformVolumeCounter = new FlxText(0, 2, 0, "Platform Volume: " + Std.string(SessionStats.platformVolumeCount), 16);
		platformVolumeCounter.screenCenter(FlxAxes.X);
		platformVolumeCounter.x += 128;
		deathCounter.alignment = FlxTextAlign.RIGHT;

		add(deathCounter);
		add(platformCounter);
		add(platformVolumeCounter);
	}

	public function updateHUD()
	{
		deathCounter.text = "Deaths: " + Std.string(SessionStats.deathCount);
		platformCounter.text = "Platforms: " + Std.string(SessionStats.platformCount);
		platformVolumeCounter.text = "Platform Volume: " + Std.string(SessionStats.platformVolumeCount);
	}
}
