package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class StartingPlatform extends FlxSprite
{
	override public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		makeGraphic(64, 16, FlxColor.GREEN);
		immovable = true;
	}
}
