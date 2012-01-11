package  
{
	import flash.events.DataEvent;
	import org.flixel.*;
	/**
	 * ...
	 * @author cld
	 */
	public class stageLoader extends FlxGroup 
	{
		[Embed(source = "data/gfx/tiles.png")]public var tilesPNG:Class;
		[Embed(source = "data/gfx/interactive.png")]public var interactivePNG:Class;
		
		public var data:Stage1;
		
		public var tempString:String;
		
		public var floorMap:FlxTilemap;
		public var interactiveMap:FlxTilemap;
		public var foregroundMap:FlxTilemap;
		
		public var springs:FlxGroup;
		public var spikes:FlxGroup;
		public var magwalls:FlxGroup;
		public var stageGoal:FlxGroup;
		
		public var width:int;
		public var height:int;
		
		public var playerStartX:int;
		public var playerStartY:int;
		
		public var currentStage:int;
		public var stagesLoaded:Boolean = false;
		
		public function stageLoader(stage:int):void 
		{
			super();
			
			currentStage = stage;
			
			
			width = floorMap.width;
			height = floorMap.height;
			
			parseInteractive();
		}		
		
		private function parseInteractive():void
		{
			var interactiveMap:FlxTilemap = new FlxTilemap();
			interactiveMap.loadMap(new data.interactive, interactivePNG, 16, 16);
			
			springs = new FlxGroup();
			spikes = new FlxGroup();
			magwalls = new FlxGroup();
			stageGoal = new FlxGroup();
			
			for (var ty:int = 0; ty < interactiveMap.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < interactiveMap.widthInTiles; tx++)
				{
					if (interactiveMap.getTile(tx, ty) == 1)
					{
						playerStartX = tx*16;
						playerStartY = ty*16;
					}
					
					if (interactiveMap.getTile(tx, ty) == 4)
					{
						springs.add(new Spring(tx, ty));
					}
					
					if (interactiveMap.getTile(tx, ty) > 7 && interactiveMap.getTile(tx, ty) <12)
					{
						magwalls.add(new magwall(tx, ty, interactiveMap.getTile(tx, ty)));
					}
					
					if (interactiveMap.getTile(tx, ty) > 11 && interactiveMap.getTile(tx, ty) <16)
					{
						spikes.add(new Spike(tx, ty, interactiveMap.getTile(tx, ty)));
					}
					
					if (interactiveMap.getTile(tx, ty) == 20)
					{
						stageGoal.add(new Goal(tx, ty));
					}
				}
			}
		}
		
	}

}