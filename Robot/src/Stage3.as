package  
{
	import org.flixel.*
	/**
	 * ...
	 * @author cld
	 */
	public class Stage3 extends BaseStage
	{
		
		override public function setData():void 
		{			
			floorCSV = data.floor3;
			interactiveCSV = data.interact3;
			backgroundCSV = data.background3;
			name = "Stage 3";
		}
		
	}

}