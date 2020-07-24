package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxAxes;

class PlayState extends FlxState
{
	public static var hud:HUD;
	public static var player:Player;
	public static var finish:Finish;

	private var platformGroup:FlxGroup;
	private var startingPlatform:StartingPlatform;
	private var platformDrawer:PlatformDrawer;

	override public function create()
	{
		player = new Player(20, 20);
		player.screenCenter(FlxAxes.Y);
		add(player);

		platformGroup = new FlxGroup(255);

		startingPlatform = new StartingPlatform(0, 0);
		startingPlatform.screenCenter(FlxAxes.Y);
		startingPlatform.y += 128;
		platformGroup.add(startingPlatform);

		var finishBlockCountX:Int = 4;
		var finishBlockCountY:Int = 4;
		var blockSize:Int = 8;

		var finishX:Int = FlxG.random.int(Std.int(FlxG.camera.width / 2), FlxG.camera.width - (finishBlockCountX * blockSize));
		var finishY:Int = FlxG.random.int(Std.int(FlxG.camera.height / 10), FlxG.camera.height - (finishBlockCountY * blockSize));

		finish = new Finish(finishBlockCountX, finishBlockCountY, finishX, finishY, blockSize);
		add(finish);

		add(platformGroup);

		platformDrawer = new PlatformDrawer(platformGroup);
		add(platformDrawer);

		hud = new HUD();
		add(hud);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		FlxG.collide(player, platformGroup);
		FlxG.collide(player, finish, onPlayerTouchingFinish);

		if (FlxG.keys.justReleased.R)
		{
			SessionStats.deathCount += 1;
			FlxG.resetState();
		}

		super.update(elapsed);
	}

	private function onPlayerTouchingFinish(obj1:FlxObject, ob2:FlxObject)
	{
		FlxG.switchState(new WinState());
		trace("touching finish");
	}
}
