package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author cld
	 */
	public class MainMenu extends FlxState
	{
		
		protected var _text:FlxText;
		
		public function MainMenu() 
		{
			
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			
			_text = new FlxText(10, 10, 300, "Robot - press x to begin");
			
			add(_text);
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