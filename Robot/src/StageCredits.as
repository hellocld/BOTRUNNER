package  
{
	import org.flixel.*
	/**
	 * ...
	 * @author cld
	 */
	public class StageCredits extends BaseStage
	{
		
		override public function setData():void 
		{			
			floorCSV = data.floorCredits;
			interactiveCSV = data.interactCredits;
			backgroundCSV = data.backgroundCredits;
			name = "Stage 12";
		}
		
	}

}