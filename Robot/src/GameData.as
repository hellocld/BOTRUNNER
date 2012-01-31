package  
{
	
	
	/**
	 * ...
	 * @author cld
	 */
	public class GameData
	{
		[Embed(source = "../data/gfx/robot.png")]public static var robotPNG:Class;
		[Embed(source = "../data/gfx/tiles.png")]public static var tilesPNG:Class;
		[Embed(source = "../data/gfx/interactive.png")]public static var interactPNG:Class;
		[Embed(source = "../data/gfx/background.png")]public static var backgroundPNG:Class;
		[Embed(source = "../data/gfx/healthbar.png")]public static var healthbarPNG:Class;
		
		[Embed(source="../data/sfx/step.mp3")] public static var stepSFX:Class;
		[Embed(source="../data/sfx/die.mp3")] public static var dieSFX:Class;
		[Embed(source="../data/sfx/jump.mp3")] public static var jumpSFX:Class;
		[Embed(source = "../data/sfx/spring.mp3")]public static var springSFX:Class;
		[Embed(source = "../data/sfx/crumble.mp3")]public static var crumbleSFX:Class;
		
		[Embed(source = "../data/maps/mapCSV_TestStage_Floor.csv", mimeType = "application/octet-stream")] public static var testStageFloor:Class;
		[Embed(source = "../data/maps/mapCSV_TestStage_Interactive.csv", mimeType = "application/octet-stream")] public static var testStageInteract:Class;
		[Embed(source = "../data/maps/mapCSV_TestStage_Background.csv", mimeType = "application/octet-stream")] public static var testStageBackground:Class;
		
		[Embed(source = "../data/maps/mapCSV_Stage_1_Floor.csv", mimeType = "application/octet-stream")] public static var floor1:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_1_Interactive.csv", mimeType = "application/octet-stream")] public static var interact1:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_1_Background.csv", mimeType = "application/octet-stream")] public static var back1:Class;
		
		[Embed(source = "../data/maps/mapCSV_Stage_2_Floor.csv", mimeType = "application/octet-stream")] public static var floor2:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_2_Interactive.csv", mimeType = "application/octet-stream")] public static var interact2:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_2_Background.csv", mimeType = "application/octet-stream")] public static var back2:Class;
		
		[Embed(source = "../data/maps/mapCSV_Stage_3_Floor.csv", mimeType = "application/octet-stream")] public static var floor3:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_3_Interactive.csv", mimeType = "application/octet-stream")] public static var interact3:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_3_Background.csv", mimeType = "application/octet-stream")] public static var back3:Class;
		
		[Embed(source = "../data/maps/mapCSV_Stage_4_Floor.csv", mimeType = "application/octet-stream")] public static var floor4:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_4_Interactive.csv", mimeType = "application/octet-stream")] public static var interact4:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_4_Background.csv", mimeType = "application/octet-stream")] public static var back4:Class;
		
		[Embed(source = "../data/maps/mapCSV_Stage_5_Floor.csv", mimeType = "application/octet-stream")] public static var floor5:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_5_Interactive.csv", mimeType = "application/octet-stream")] public static var interact5:Class;
		[Embed(source = "../data/maps/mapCSV_Stage_5_Background.csv", mimeType = "application/octet-stream")] public static var back5:Class;
		
		public function GameData()
		{
		}
	}

}