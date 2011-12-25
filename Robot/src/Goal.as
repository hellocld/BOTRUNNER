package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Goal extends FlxSprite
	{		
		[Embed(source = "data/gfx/goal.png")] public var goalPNG:Class;
		
		public function Goal(X:int, Y:int) 
		{
			super(X * 16, Y * 16);
			
			solid = true;
			
			loadGraphic(goalPNG, false, false, 32, 48, false);
			
		}
		
	}

}