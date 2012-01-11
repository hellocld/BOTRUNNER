package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Goal extends FlxSprite
	{		
		[Embed(source = "../data/gfx/goal.png")] public var goalPNG:Class;
		
		public function Goal() 
		{
			super(x * 16, y * 16);
			
			solid = true;
			immovable = true;
			
			loadGraphic(goalPNG, true, false, 16, 16, false);
			addAnimation("waves", [0, 1, 2], 12, true);
		}
		
		override public function update():void
		{
			play("waves");
		}
		
	}

}