package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Spike extends FlxSprite
	{
		[Embed(source = "../data/gfx/interactive.png")] public var interactivePNG:Class;
		
		public function Spike() 
		{
			super(x * 16, y * 16);
			
			//make the spike collidable and immovable (so it doesn't fly off when you hit it)
			solid = true;
			immovable = true;
			
			loadGraphic(interactivePNG, true, false, 16, 16);
		}
		
		public function setAngle(angle:int):void
		{
			addAnimation("idle", [angle]);
			play("idle");
		}
		
	}

}