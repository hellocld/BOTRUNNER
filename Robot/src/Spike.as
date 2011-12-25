package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Spike extends FlxSprite
	{
		[Embed(source = "data/gfx/interactive.png")] public var interactivePNG:Class;
		
		public function Spike(X:int, Y:int) 
		{
			super(X * 16, Y * 16);
			
			//make the spike collidable and immovable (so it doesn't fly off when you hit it)
			solid = true;
			immovable = true;
			
			loadGraphic(interactivePNG, true, false, 16, 16);
			addAnimation("idle", [12]);
			
			play("idle");
			
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}