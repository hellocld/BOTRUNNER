package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Goal extends FlxSprite
	{		
		public var gfxdata:GfxData;
		
		public function Goal() 
		{
			gfxdata = new GfxData();
			super(x * 16, y * 16);
			
			solid = true;
			immovable = true;
			
			loadGraphic(gfxdata.interactPNG, true, false, 16, 16, false);
			
			height = 8;
			offset.y = 8;
			
			addAnimation("waves", [36, 37, 38, 39], 12, true);
		}
		
		override public function update():void
		{
			play("waves");
		}
		
	}

}