package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Spike extends FlxSprite
	{
		public var data:StageData;
		
		public function Spike() 
		{
			data = new StageData();
			super(x * 16, y * 16);
			
			//make the spike collidable and immovable (so it doesn't fly off when you hit it)
			solid = true;
			immovable = true;
			
			loadGraphic(data.interactPNG, true, false, 16, 16);
		}
		
		public function setAngle(angle:int):void
		{
			addAnimation("idle", [angle]);
			play("idle");
		}
		
	}

}