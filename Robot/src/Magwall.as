package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Magwall extends FlxSprite
	{
		public var data:StageData;
		
		public function Magwall() 
		{
			data = new StageData();
			super(x * 16, y * 16);
			solid = true;
			immovable = true;
			
			loadGraphic(data.interactPNG, true, false, 16, 16);
		}
		
		public function setAngle(angle:int):void
		{
			addAnimation("idle", [angle]);
			play("idle");
		}
		
		override public function update():void
		{
			super.update();
			play("idle");
		}
		
	}

}