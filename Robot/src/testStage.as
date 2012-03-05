package  
{
	import org.flixel.*
	/**
	 * ...
	 * @author cld
	 */
	public class testStage extends BaseStage
	{
		
		override public function setData():void 
		{			
			floorCSV = GameData.testStageFloor;
			interactiveCSV = GameData.testStageInteract;
			backgroundCSV = GameData.testStageBackground;
			name = "Test Stage";
		}
		
	}

}