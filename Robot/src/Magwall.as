package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Magwall extends FlxSprite
	{
		public var gfxdata:GfxData;
		
		public function Magwall() 
		{
			gfxdata = new GfxData();
			super(x * 16, y * 16);
			solid = true;
			immovable = true;
			
			loadGraphic(gfxdata.interactPNG, true, false, 16, 16);
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