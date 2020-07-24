package;

class SessionStats
{
	public static var deathCount:Int;
	public static var platformCount:Int;
	public static var platformVolumeCount:Int;

	public static function reset()
	{
		deathCount = 0;
		platformCount = 0;
		platformVolumeCount = 0;
	}
}
