package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Magwall extends FlxSprite
	{
		[Embed(source = "../data/gfx/interactive.png")] public var interactivePNG:Class;
		
		public function Magwall() 
		{
			super(x * 16, y * 16);
			solid = true;
			immovable = true;
			
			loadGraphic(interactivePNG, true, false, 16, 16);
		}
		
		public function setAngle(angle:int):void
		{
			addAnimation("idle", [angle]);
			play("idle");
			
			if (angle == 9) touching = LEFT;
			if (angle == 11) touching = RIGHT;
		}
		
	}

}