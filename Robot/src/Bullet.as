package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Bullet extends FlxSprite
	{
		public var gfxdata:GfxData;
		
		public function Bullet() 
		{
			gfxdata = new GfxData();
			super(x * 16, y * 16);
			
			loadGraphic(gfxdata.interactPNG, true, true, 16, 16);
			width = 2;
			height = 2;
			offset.x = 7;
			offset.y = 7;
			
			addAnimation("fire" [96, 97, 98, 99], 15, true);
			
			alive = false;
			
		}
		
		override public function update():void
		{
			super.update();
			if (alive)
			{
				play("fire");
				acceleration.x = 50 * facing;
				if (isTouching(FlxObject.ANY))
				{
					kill();
					alive = false;
				}
			}
		}
		
		public function setup(startFrame:int):void
		{
			if (startFrame < 78)
			{
				facing = RIGHT;
			} else {
				facing = LEFT;
			}
		}
		
		
	}

}