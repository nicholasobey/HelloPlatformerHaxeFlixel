package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	private static inline var RUN_SPEED:Int = 90;
	private static inline var GRAVITY:Int = 620;
	private static inline var JUMP_SPEED:Int = 250;

	private var jumpTime:Float = -1;
	private var canRepeatJump:Bool = false;

	override public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		makeGraphic(16, 16, FlxColor.BLUE);

		drag.set(RUN_SPEED * 8, RUN_SPEED * 8);
		maxVelocity.set(RUN_SPEED, JUMP_SPEED);
		acceleration.y = GRAVITY;
	}

	override function update(elapsed:Float)
	{
		updateMovement(elapsed);

		super.update(elapsed);
	}

	private function updateMovement(elapsed:Float)
	{
		acceleration.x = 0;

		var left:Bool = FlxG.keys.anyPressed([LEFT, A]);
		var right:Bool = FlxG.keys.anyPressed([RIGHT, D]);

		if (left && right)
		{
			left = right = false;
		}

		if (left)
		{
			acceleration.x = -drag.x;
		}
		else if (right)
		{
			acceleration.x = drag.x;
		}

		jump(elapsed);

		if (x <= 0)
		{
			x = 0;
		}

		if (x + width > FlxG.width)
		{
			x = FlxG.width - width;
		}

		if (y + height > FlxG.height + height)
		{
			SessionStats.deathCount += 1;
			FlxG.resetState();
		}
	}

	private function jump(elapsed:Float)
	{
		if (FlxG.keys.anyJustPressed([UP, W]) || canRepeatJump)
		{
			if (velocity.y == 0)
			{
				jumpTime = 0;
			}
		}

		if (FlxG.keys.anyPressed([UP, W]) && jumpTime >= 0)
		{
			jumpTime += elapsed;
			if (jumpTime > 0.25)
			{
				jumpTime = -1;
			}
			else if (jumpTime > 0)
			{
				velocity.y = -0.6 * maxVelocity.y;
			}
		}
		else
		{
			jumpTime = -1;
		}

		if (isTouching(FlxObject.FLOOR) && !FlxG.keys.anyPressed([UP, W]))
		{
			jumpTime = -1;
		}

		if (isTouching(FlxObject.FLOOR))
		{
			canRepeatJump = true;
		}
		else
		{
			canRepeatJump = false;
		}
	}
}
