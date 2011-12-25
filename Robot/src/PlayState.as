package  
{
	import org.flixel.*
	/**
	 * ...
	 * @author cld
	 */
	public class PlayState extends FlxState
	{
		private var stage:stage01;
		private var player:Player;
		private var textTest:TextFrame;
		
		public function PlayState() 
		{
			
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			
			player = new Player(0, 176);
			stage = new stage01();
			
			player.setBounds(new FlxRect(0, 0, stage.width, stage.height));
			
			//textTest = new TextFrame(60, 16, 200, 8,  0x77000077, 0xff000000, 0xffffffff, "Chris:\nRun over the spring to jump the platform.");
			
			add(stage.springs);
			add(stage.floorMap);
			add(stage.spikes);
			add(stage.stageGoal);
			add(player);
			add(stage.foregroundMap);
			add(textTest);
			
			FlxG.worldBounds = new FlxRect(0, 0, stage.width, stage.height);
			
			FlxG.camera.setBounds(0, 0, stage.width, stage.height);
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		}
		
		//check for collisions between objects and all that jazz
		override public function update():void
		{
			super.update();
			
			FlxG.collide(player, stage.floorMap);
			
			FlxG.collide(player, stage.springs, springHit);
			FlxG.collide(player, stage.spikes, spikeHit);
			FlxG.collide(player, stage.stageGoal, goalReached);
			
			if (FlxG.keys.Q)
			{
				FlxG.switchState(new MainMenu);
			}
		}
		
		//all the cool collision events
		public function springHit(p:Player, s:Spring):void
		{
			s.boing();
			p.velocity.y = -400;
		}
		
		public function spikeHit(p:Player, s:Spike):void
		{
			FlxG.resetState();
		}
		
		public function goalReached(p:Player, g:Goal):void
		{
			FlxG.switchState(new MainMenu);
		}
		
		
		
	}

}