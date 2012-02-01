package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Turret extends FlxSprite
	{
		public var gfxdata:GfxData;
		
		//set by the tile used in the CSV
		public var sF:int = 0;
		
		//for timing the shots
		private var counter:Number = 0;
		
		//trigger the bullet
		public var fire:Boolean = false;
		
		//trigger the charge
		public var charge:Boolean = false;
		
		public function Turret() 
		{
			gfxdata = new GfxData();
			super(x * 16, y * 16);
			
			loadGraphic(gfxdata.interactPNG, true, true, 16, 16);
			
			addAnimation("idle", [64], 0, true);
			addAnimation("charge", [64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77], 15, false);
			
			if (sF != 64)
			{
				play("charge");
				frame = sF - 64;
			}
			
			
			addAnimationCallback(animCallback);
		}
		
		override public function update():void
		{
			super.update();
			if (charge) 
			{
				play("charge");
			} else {
				play("idle");
			}
			
			
			FlxG.watch(this, "counter");
			
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
		
		public function animCallback(animationName:String, frameNumber:uint, frameIndex:uint):void
		{
			if (animationName == "charge" && frameNumber == 13)
			{
				charge = false;
				fire = true;
			}
		}
		
		
	}

}