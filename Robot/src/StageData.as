package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class StageData
	{
		[Embed(source = "../data/gfx/tiles.png")]public var tilesPNG:Class;
		[Embed(source = "../data/gfx/interactive.png")]public var interactPNG:Class;

		[Embed(source = "../data/maps/mapCSV_Stage_1_Floor.csv", mimeType = "application/octet-stream")] public var floor1:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_1_Interact.csv", mimeType = "application/octet-stream")] public var interact1:Class;
		
		[Embed(source = "../data/maps/mapCSV_Stage_2_Floor.csv", mimeType = "application/octet-stream")] public var floor2:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_2_Interact.csv", mimeType = "application/octet-stream")] public var interact2:Class;
		
		[Embed(source = "../data/maps/mapCSV_Stage_3_Floor.csv", mimeType = "application/octet-stream")] public var floor3:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_3_Interact.csv", mimeType = "application/octet-stream")] public var interact3:Class;
		
		[Embed(source = "../data/maps/mapCSV_Stage_4_Floor.csv", mimeType = "application/octet-stream")] public var floor4:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_4_Interact.csv", mimeType = "application/octet-stream")] public var interact4:Class;
		
		[Embed(source = "../data/maps/mapCSV_Stage_5_Floor.csv", mimeType = "application/octet-stream")] public var floor5:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_5_Interact.csv", mimeType = "application/octet-stream")] public var interact5:Class;
				
	}

}