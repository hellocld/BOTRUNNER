package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Crumbler extends FlxSprite
	{
		public var gfxdata:GfxData;
		public var snddata:SndData;
		
		public var crumbleSND:FlxSound;
		
		//has the crumbler, er, crumbled?
		public var crumbled:Boolean = false;
		
		//crumbler animation variable (to make it only play once)
		public var crumblePlayed:Boolean = false;
		public var uncrumblePlayed:Boolean = false;
		//the variable for the crumble timer
		public var counter:Number = 0;
		
		public function Crumbler() 
		{
			gfxdata = new GfxData();
			snddata = new SndData();
			super(x * 16, y * 16);
			
			//make the crumbler collidable and immovable (so it doesn't fly away when you hit it)
			solid = true;
			immovable = true;
			
			//animaaaaaaations
			loadGraphic(gfxdata.interactPNG, true, false, 16, 16);
			addAnimation("idle", [20]);
			addAnimation("crumbling", [20, 16], 15, true);
			addAnimation("crumble", [16, 17, 18, 19, 0], 15, false);
			addAnimation("uncrumble", [0, 19, 18, 17, 16], 15, false);
			play("uncrumble");
			
			//audio
			crumbleSND = new FlxSound();
			crumbleSND.loadEmbedded(snddata.crumbleSFX);
		}
		
		override public function update():void
		{
			super.update();
			
			if (crumbled)
			{
				//start the counter
				counter += FlxG.elapsed;
				//if about to crumble play "crumbling"
				if (counter > 0 && counter < 0.5) 
				{
					play("crumbling");
				}
				//if the counter passes 1 second, crumble the block
				if (counter >= 0.5 && counter < 3) 
				{
					if (solid) 
					{
						play("crumble");
						crumbleSND.play();
					}
					solid = false;
				}
				if (counter >= 3)
				{
					if (!solid)
					{
						play("uncrumble");
					}
					solid = true;
				}
				if (counter >= 4)
				{
					crumbled = false;
					counter = 0;
				}
			}
			if (!crumbled)
			{
				play("idle");
			}
		}
		
		//when the player collides with a crumbler, this gets called
		public function crumble():void 
		{
			crumbled = true;
		}
		
	}

}