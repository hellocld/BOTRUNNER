package  
{
	import org.flixel.*
	/**
	 * ...
	 * @author cld
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = "../data/gfx/robot.png")] public var robotPNG:Class;
		[Embed(source="../data/sfx/step.mp3")] public var stepSFX:Class;
		[Embed(source="../data/sfx/die.mp3")] public var dieSFX:Class;
		[Embed(source="../data/sfx/jump.mp3")] private var jumpSFX:Class;
		
		protected var _jumpPower:int;
		protected var _runSpeed:uint;
		protected var _playerBounds:FlxRect;
		
		public var onWall:Boolean = false;
		public var stageActive:Boolean;
		
		public var stepSND:FlxSound = new FlxSound();
		public var dieSND:FlxSound = new FlxSound();
		public var jumpSND:FlxSound = new FlxSound();
		
		public var xPos:int = 0;
		public var yPos:int = 0;
		
		public function Player() 
		{
			super(xPos, yPos);
			
			//load the sprite sheet for the robot
			loadGraphic(robotPNG, true, true, 16, 32);
			
			//set all the control and physics variables
			_runSpeed = 120;
			drag.x = _runSpeed * 8;
			acceleration.y = 420;
			_jumpPower = 200;
			maxVelocity.x = _runSpeed;
			maxVelocity.y = _jumpPower*2;
			
			//set the dimensions for collisions
			width = 14;
			offset.x = 1;
			
			//set the direction he's facing
			facing = RIGHT;
			
			//boolean to see if the stage is running
			stageActive = true;
			
			//animations for the robot
			addAnimation("idle", [0]);
			addAnimation("run", [1, 2, 3, 4, 5, 6, 7, 8], 12);
			addAnimation("mag", [12]);
			addAnimation("jumpUp", [10]);
			addAnimation("jumpDown", [9]);
			addAnimation("death", [11, 0], 2, false);
			
			//create the sound objects
			stepSND.loadEmbedded(stepSFX, false, false);
			jumpSND.loadEmbedded(jumpSFX, false, false);
			dieSND.loadEmbedded(dieSFX, false, false);
			
			//call this function whenever there's an animation running to provide information about that animation
			addAnimationCallback(animCallback);
		}
		
		override public function update():void
		{
			super.update();
			
			if(alive && stageActive){
				acceleration.x = 0;
			
				if (FlxG.keys.LEFT)
				{
					facing = LEFT;
					acceleration.x -= drag.x;
				}
				if (FlxG.keys.RIGHT)
				{
					facing = RIGHT;
					acceleration.x += drag.x;
				}
				
				if (FlxG.keys.justPressed("UP") && isTouching(FlxObject.FLOOR))
				{
					velocity.y = -_jumpPower;
					jumpSND.play();
				}
			
				if (velocity.y != 0)
				{
					if (velocity.y > 0) play("jumpUp");
					if (velocity.y < 0) play("jumpDown");
				}
				else if (velocity.x == 0)
				{
					play("idle");
				}
				else
				{
					play("run");
				}
				
				//all this stuff only happens when onWall is true
				if (onWall)
				{
					play("mag");
					if (FlxG.keys.justPressed("UP"))
					{
						velocity.x = maxVelocity.x * (facing == FlxObject.LEFT ? -1 : 1);
						velocity.y = -_jumpPower;
						acceleration.y = 420;
						onWall = false;
						jumpSND.play();
					}
					if (FlxG.keys.justPressed("DOWN"))
					{
						acceleration.y = 420;
						onWall = false;
					}
					if (FlxG.keys.justPressed("LEFT"))
					{
						acceleration.y = 420;
						onWall = false;
					}
					if (FlxG.keys.justPressed("RIGHT"))
					{
						acceleration.y = 420;
						onWall = false;
					}
				}
				
				if (x < 0) x = 0;
				if (y < 0) y = 0;
				if (x > _playerBounds.width - 16) x = _playerBounds.width - 16;
				if (y > _playerBounds.height - 32) y = _playerBounds.height - 32;
			}
			
			
		}
		
		public function setBounds(bounds:FlxRect):void
		{
			_playerBounds = bounds;
		}
		
		public function setPosition(X:int, Y:int):void
		{
			xPos = X;
			yPos = Y;
		}
		
		public function animCallback(animationName:String, frameNumber:uint, frameIndex:uint):void
		{
			
			if (animationName == "death" && frameNumber == 1)
			{
				reset(xPos, yPos);
				facing = RIGHT;
				acceleration.y = 420;
				alive = true;
			}
			if (!stageActive)
			{
				frame = frameNumber;
			}
			
			if (animationName == "run")
			{
				if (frameNumber == 3 || frameNumber == 7)
				{
					stepSND.play();
				}
			}
		}
		
		//called when the player touches a magwall
		public function magwallContact():void
		{
			onWall = true;
			acceleration.y = 0;
			velocity.y = 0;
			if (isTouching(FlxObject.LEFT))
			{
				facing = RIGHT
			}
			if (isTouching(FlxObject.RIGHT))
			{
				facing = LEFT;
			}
		}
		
		//called when the player touches the Goal
		public function stageComplete():void
		{
			stageActive = false;
			acceleration.x = 0;
			acceleration.y = 0;
			velocity.x = 0;
			velocity.y = 0;
			FlxG.log("Stage Complete!");
		}
		
		//called when the player touches the spikes
		public function death():void 
		{
			alive = false;
			dieSND.play();
			acceleration.x = 0;
			acceleration.y = 0;
			velocity.x = 0;
			velocity.y = 0;
			flicker(1);
			play("death");	
		}
	}

}