package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Spring extends FlxSprite
	{
		//the graphic for the spring
		public var data:StageData;
		
		public function Spring() 
		{
			data = new StageData();
			super(x * 16, y * 16);
			
			//make the spring collidable and immovable (so it doesn't fly away when you hit it)
			solid = true;
			immovable = true;
			
			//animaaaaaaations
			loadGraphic(data.interactPNG, true, false, 16, 16);
			addAnimation("idle", [4]);
			addAnimation("boing", [7, 6, 4, 5, 4, 5, 4], 15, false);
			
			play("idle");
			
		}
		
		override public function update():void
		{
			super.update();
			//play("idle");
		}
		
		//when the player collides with a spring, this gets called
		public function boing():void {
			play("boing");
		}
		
	}

}