package  
{
	import org.flixel.*
	/**
	 * ...
	 * @author cld
	 */
	public class TextFrame extends FlxGroup 
	{
		private var _text:FlxText;
		private var _box:FlxTileblock;
		
		public function TextFrame(X:int, Y:int, width:int, margin:int, fill:int, stroke:int, TextColor:int, Text:String) 
		{
			_text = new FlxText(X + margin, Y + margin, width - (margin * 2), Text);
			_text.color = TextColor;
			
			_box = new FlxTileblock(X, Y, width, _text.height+(margin*2));
			_box.makeGraphic(width, _text.height+(margin*2), fill);
			
			
			add(_box);
			add(_text);
		}
		
	}

}