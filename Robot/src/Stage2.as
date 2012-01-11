package  
{
	import org.flixel.*
	/**
	 * ...
	 * @author cld
	 */
	public class Stage2 extends BaseStage
	{
		
		override public function setData():void 
		{			
			floorCSV = data.floor2;
			foregroundCSV = data.foreground2;
			interactiveCSV = data.interactive2;
			name = "Stage 2";
		}
		
	}

}