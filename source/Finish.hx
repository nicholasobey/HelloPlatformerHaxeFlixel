package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;

class Finish extends FlxGroup
{
	private var blockCountX:Int;
	private var blockCountY:Int;
	private var x:Int;
	private var y:Int;
	private var blockSize:Int;

	override public function new(blockCountX:Int, blockCountY:Int, x:Int, y:Int, blockSize:Int)
	{
		this.blockCountX = blockCountX;
		this.blockCountY = blockCountY;
		this.x = x;
		this.y = y;
		this.blockSize = blockSize;

		super(blockCountX * blockCountY);

		generateFinishPlatform();
	}

	private function generateFinishPlatform()
	{
		var currentX = x;
		var currentY = y;
		var yGridCount = 0;

		for (i in 0...blockCountY)
		{
			for (i in 0...blockCountX)
			{
				var block:FlxSprite = new FlxSprite(currentX, currentY);
				block.immovable = true;

				var color:FlxColor = FlxColor.PURPLE;
				if ((i + yGridCount) % 2 == 0)
				{
					color = FlxColor.PINK;
				}

				block.makeGraphic(blockSize, blockSize, color);

				add(block);

				currentX += blockSize;
			}

			currentY += blockSize;
			currentX = x;
			yGridCount++;
		}
	}
}
