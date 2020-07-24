package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class PlatformDrawer extends FlxSprite
{
	private var platformGroup:FlxGroup;
	private var startPos:FlxPoint;
	private var endPos:FlxPoint;

	override public function new(platformGroup:FlxGroup)
	{
		super();

		this.platformGroup = platformGroup;
		startPos = new FlxPoint(0, 0);
		endPos = new FlxPoint(0, 0);

		makeGraphic(1, 1, FlxColor.RED);
		this.alpha = 0.25;
		width = height = 1;

		x = y = -1;
	}

	override function update(elapsed:Float)
	{
		drawSquare();

		super.update(elapsed);
	}

	private function drawSquare()
	{
		if (FlxG.mouse.justPressed)
		{
			startPos.set(FlxG.mouse.screenX, FlxG.mouse.screenY);

			x = startPos.x;
			y = startPos.y;
		}

		if (FlxG.mouse.pressed)
		{
			endPos.set(FlxG.mouse.screenX, FlxG.mouse.screenY);

			width = Math.abs(startPos.x - endPos.x);
			height = Math.abs(startPos.y - endPos.y);
			if (width > 0 && height > 0)
			{
				makeGraphic(Std.int(width), Std.int(height), FlxColor.RED);
			}

			if (endPos.x < startPos.x)
			{
				x = endPos.x;
			}

			if (endPos.y < startPos.y)
			{
				y = endPos.y;
			}
		}

		if (FlxG.mouse.justReleased)
		{
			var rect:FlxSprite = new FlxSprite(x, y);

			var trueWidth:Int = Std.int(width);
			var trueHeight:Int = Std.int(height);
			rect.makeGraphic(trueWidth, trueHeight, FlxColor.RED);
			rect.immovable = true;
			if (!FlxG.overlap(rect, PlayState.player) && !FlxG.overlap(rect, PlayState.finish) && !FlxG.overlap(rect, platformGroup))
			{
				platformGroup.add(rect);

				SessionStats.platformCount += 1;
				SessionStats.platformVolumeCount += trueWidth * trueHeight;

				PlayState.hud.updateHUD();
			}

			makeGraphic(1, 1);

			x = y = -1;
		}
	}
}
