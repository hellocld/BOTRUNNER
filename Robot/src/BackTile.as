package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class BackTile extends FlxSprite
	{
		//the graphic for the background tile
		public var data:StageData;
		
		public function BackTile() 
		{
			super(x * 16, y * 16);
			
			data = new StageData();
			
			scrollFactor.x = 0.5;
			scrollFactor.y = 0.5;
			
			//animaaaaaaations
			loadGraphic(data.tilesPNG, true, false, 16, 16);
			addAnimation("spin", [33, 34, 35, 36, 37, 36, 35, 34], 15, true);
			
			play("spin");
		}
		
		override public function update():void
		{
			super.update();
			play("spin");
		}
		
	}

}