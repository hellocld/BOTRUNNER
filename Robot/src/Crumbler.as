package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Crumbler extends FlxSprite
	{
		//the graphic for the spring
		public var data:StageData;
		
		//the crumble FlxSound
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
			data = new StageData();
			super(x * 16, y * 16);
			
			//make the crumbler collidable and immovable (so it doesn't fly away when you hit it)
			solid = true;
			immovable = true;
			
			//animaaaaaaations
			loadGraphic(data.interactPNG, true, false, 16, 16);
			addAnimation("idle", [28]);
			addAnimation("crumble", [28, 29, 30, 31, 0], 15, false);
			addAnimation("uncrumble", [0, 31, 30, 29, 28], 15, false);
			play("uncrumble");
			
			//audio
			crumbleSND = new FlxSound();
			crumbleSND.loadEmbedded(data.crumbleSFX);
		}
		
		override public function update():void
		{
			super.update();
			
			if (crumbled)
			{
				//start the counter
				counter += FlxG.elapsed;
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