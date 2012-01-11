package  
{
	import org.flixel.*
	/**
	 * ...
	 * @author cld
	 */
	public class Stage1 extends BaseStage
	{
		
		override public function setData():void 
		{			
			floorCSV = data.floor1;
			foregroundCSV = data.foreground1;
			interactiveCSV = data.interactive1;
			name = "Stage 1";
		}
		
	}

}