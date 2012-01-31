package  
{
	import org.flixel.*
	/**
	 * ...
	 * @author cld
	 */
	public class PlayState extends FlxState
	{
		
		//generate all the Class references to each stage
		public var s1:Class = Stage1;
		public var s2:Class = Stage2;
		public var s3:Class = Stage3;
		public var s4:Class = Stage4;
		public var s5:Class = Stage5;
		public var s6:Class = Stage6;
		public var s7:Class = Stage7;
		
		//make an array out of the Class references of the stages
		public static var stages:Array;
		
		//make one stage object that the stages can be loaded into
		public var stage:BaseStage;
		
		//make the player object
		public var player:Player;
		
		//make a text box (DOESN'T WORK)
		private var winText:TextFrame;
		
		//set the stage counter at 0
		public static var stageCount:int = 0;
		
		//reset boolean, might be a better way to do this
		public var reset:Boolean = false;
		
		public function PlayState() 
		{
			
		}
		
		override public function create():void
		{
			stages = [s2];
			FlxG.bgColor = 0xff000000;
			
			makeStage();
			
			FlxG.log(stage.name);
			
			FlxG.worldBounds = new FlxRect(0, 0, stage.width, stage.height);
			
			FlxG.camera.setBounds(0, 0, stage.width, stage.height);
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		}
		
		//check for collisions between objects and all that jazz
		override public function update():void
		{
			super.update();
			
			FlxG.collide(player, stage.floorMap);
			
			if (player.stageActive)
			{
				FlxG.collide(player, stage.springs, springHit);
				FlxG.collide(player, stage.spikes, spikeHit);
				FlxG.collide(player, stage.crumblers, crumblerHit);
				FlxG.collide(player, stage.magwalls, magwallHit);
				FlxG.collide(player, stage.stageGoal, goalReached);
			}
			
			if (FlxG.keys.Q)
			{
				FlxG.switchState(new MainMenu);
			}
			if (FlxG.keys.R)
			{
				FlxG.resetState();
				stageCount = 0;
				makeStage();			
			}
			
			FlxG.watch(player, "x");
			FlxG.watch(player, "y");
			FlxG.watch(player, "onWall");
		}
		
		
		
		//all the cool collision events
		public function springHit(p:Player, s:Spring):void
		{
			s.boing();
			p.velocity.y = -400;
		}
		
		public function spikeHit(p:Player, s:Spike):void
		{
			if (p.alive)
			{
				p.death();
				FlxG.log("player has been killed");
			}
		}
		
		public function crumblerHit(p:Player, c:Crumbler):void
		{
			c.crumble();
		}
		
		public function magwallHit(p:Player, m:Magwall):void
		{
			p.magwallContact();
		}
		public function goalReached(p:Player, g:Goal):void
		{
			p.stageComplete();
			add(new FlxText(8, 8, 200, "Stage Complete!", true));
			FlxG.fade(0xff000000, 1, nextStage);
		}
		
		
		//load the next stage
		public function nextStage():void
		{
			FlxG.resetState();
			stageCount++;
			if (stageCount > (stages.length - 1))
			{
				stageCount = 0;
				FlxG.switchState(new MainMenu);
			} else {
				makeStage();
			}
		}
		
		//generate the stage
		public function makeStage():void
		{	
			
			stage = new stages[stageCount];
			player = recycle(Player) as Player;
			player.reset(stage.playerStartX, stage.playerStartY);
			player.setPosition(stage.playerStartX, stage.playerStartY);
			
			player.setBounds(new FlxRect(0, 0, stage.width, stage.height));
			FlxG.worldBounds.make(0, 0, stage.width, stage.height);
			
			add(stage.backgroundMap);
			add(stage.springs);
			add(stage.floorMap);
			add(stage.spikes);
			add(stage.magwalls);
			add(stage.crumblers);
			add(stage.stageGoal);
			add(player);
			
		}
		
	}
	

}