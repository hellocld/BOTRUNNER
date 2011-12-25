package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author cld
	 */
	public class stage01 extends FlxGroup 
	{
		[Embed(source = "data/gfx/tiles.png")]public var tilesPNG:Class;
		[Embed(source = "data/gfx/interactive.png")]public var interactivePNG:Class;
		
		[Embed(source = "data/maps/mapCSV_Stage03_Floor.csv", mimeType = "application/octet-stream")] public var floorCSV:Class;
		[Embed(source = "data/maps/mapCSV_Stage03_Interactive.csv", mimeType = "application/octet-stream")] public var interactiveCSV:Class;
		[Embed(source = "data/maps/mapCSV_Stage03_Foreground.csv", mimeType = "application/octet-stream")] public var foregroundCSV:Class;
		
		public var floorMap:FlxTilemap;
		public var interactiveMap:FlxTilemap;
		public var foregroundMap:FlxTilemap;
		
		public var springs:FlxGroup;
		public var spikes:FlxGroup;
		public var stageGoal:FlxGroup;
		
		public var width:int;
		public var height:int;
		
		public function stage01():void 
		{
			super();
			
			floorMap = new FlxTilemap;
			floorMap.loadMap(new floorCSV, tilesPNG, 16, 16, 0, 0, 1, 3);
			
			foregroundMap = new FlxTilemap;
			foregroundMap.loadMap(new foregroundCSV, tilesPNG, 16, 16, 0, 0, 1, 3);
			
			width = floorMap.width;
			height = floorMap.height;
			
			parseInteractive();
		}
		
		private function parseInteractive():void
		{
			var interactiveMap:FlxTilemap = new FlxTilemap();
			interactiveMap.loadMap(new interactiveCSV, interactivePNG, 16, 16);
			
			springs = new FlxGroup();
			spikes = new FlxGroup();
			stageGoal = new FlxGroup();
			
			for (var ty:int = 0; ty < interactiveMap.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < interactiveMap.widthInTiles; tx++)
				{
					if (interactiveMap.getTile(tx, ty) == 4)
					{
						springs.add(new Spring(tx, ty));
					}
					
					if (interactiveMap.getTile(tx, ty) == 12)
					{
						spikes.add(new Spike(tx, ty));
					}
					
					if (interactiveMap.getTile(tx, ty) == 20)
					{
						stageGoal.add(new Goal(tx, ty));
					}
				}
			}
		}
		
		
		/*
		private function parseSpikes():void
		{
			var spikeMap:FlxTilemap = new FlxTilemap();
			spikeMap.loadMap(new interactiveCSV, interactivePNG, 16, 16);
			
			spikes = new FlxGroup();
			
			for (var ty:int = 0; ty < spikeMap.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < spikeMap.widthInTiles; tx++)
				{
					if (spikeMap.getTile(tx, ty) == 12)
					{
						spikes.add(new Spike(tx, ty));
					}
				}
			}
		}
		
		private function parseGoal():void
		{
			var goalMap:FlxTilemap = new FlxTilemap();
			goalMap.loadMap(new interactiveCSV, interactivePNG, 16, 16);
			
			stageGoal = new FlxGroup();
			
			for (var ty:int = 0; ty < goalMap.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < goalMap.widthInTiles; tx++)
				{
					if (goalMap.getTile(tx, ty) == 20)
					{
						stageGoal.add(new Goal(tx, ty));
					}
				}
			}
		}
		*/
	}

}