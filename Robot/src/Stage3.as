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
			foregroundCSV = data.foreground3;
			interactiveCSV = data.interactive3;
			name = "Stage 3";
		}
		
	}

}