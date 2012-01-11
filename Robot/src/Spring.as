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
		[Embed(source = "../data/gfx/interactive.png")] public var interactivePNG:Class;
		
		public function Spring() 
		{
			super(x * 16, y * 16);
			
			//make the spring collidable and immovable (so it doesn't fly away when you hit it)
			solid = true;
			immovable = true;
			
			//animaaaaaaations
			loadGraphic(interactivePNG, true, false, 16, 16);
			addAnimation("idle", [4]);
			addAnimation("boing", [6, 5, 4], 15, false);
			
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