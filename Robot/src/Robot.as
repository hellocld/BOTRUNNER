package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author cld
	 */
	
	[SWF(width = "640", height = "480", backgroundColor = "#ffffff")]
	
	public class Robot extends FlxGame
	{
		
		public function Robot():void 
		{
			super(320, 240, MainMenu, 2);
			forceDebugger = true;
		}
		
	}

}