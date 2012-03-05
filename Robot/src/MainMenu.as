package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author cld
	 */
	public class MainMenu extends FlxState
	{
		[Embed(source = "../data/gfx/titlescreen.png")] public var titlePNG:Class;
		public var titleGFX:FlxSprite;
		
		public function MainMenu() 
		{
			
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			titleGFX = new FlxSprite();
			titleGFX.loadGraphic(titlePNG, false, false, 320, 240, false);
			add(titleGFX);
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.X)
			{
				FlxG.switchState(new PlayState);
			}
		}
		
	}

}