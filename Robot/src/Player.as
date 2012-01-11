package  
{
	import org.flixel.*
	/**
	 * ...
	 * @author cld
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = "../data/gfx/robot.png")] protected var robotPNG:Class;
		
		protected var _jumpPower:int;
		protected var _runSpeed:uint;
		protected var _playerBounds:FlxRect;
		
		//this is the box for wall jumps
		public var magwallBox:FlxSprite;
		
		public var onWall:Boolean = false;
		public var stageActive:Boolean;
		
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
			addAnimation("jumpUp", [10]);
			addAnimation("jumpDown", [9]);
			addAnimation("death", [11, 0], 2, false);
			
			//call this function whenever there's an animation running to provide information about that animation
			addAnimationCallback(animCallback);
			
			//create the magwallBox
			magwallBox = new FlxSprite(x - 2, y)
			magwallBox.width = width + 4;
			magwallBox.height = height;
			magwallBox.solid = true;
		}
		
		override public function update():void
		{
			
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
				
				if (isTouching(FlxObject.WALL) && magwallBox.isTouching(FlxObject.WALL)) 
				{
					onWall = true;
				}
				if (onWall && !magwallBox.isTouching(FlxObject.WALL))
				{
					onWall = false;
				}
				
				if (!FlxG.keys.any() && onWall)
				{
					if (isTouching(FlxObject.LEFT))
					{
						facing = FlxObject.RIGHT;
					}
					if (isTouching(FlxObject.RIGHT))
					{
						facing = FlxObject.LEFT;
					}
				}
				
				/*
				if (onWall && FlxG.keys.justPressed("UP"))
				{
					velocity.x = maxVelocity.x * (facing == FlxObject.LEFT ? -1 : 1);
					velocity.y = -_jumpPower;
					onWall = false;
				}
				*/
				
				if (x < 0) x = 0;
				if (y < 0) y = 0;
				if (x > _playerBounds.width - 16) x = _playerBounds.width - 16;
				if (y > _playerBounds.height - 32) y = _playerBounds.height - 32;			
				
			}
		}
		
		override public function postUpdate():void
		{
			updateAnimation();
			//update the wallbox position
			magwallBox.x = x - 2;
			magwallBox.y = y;
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
				alive = true;
			}
			
		}
		
		public function stageComplete():void
		{
			stageActive = false;
			play("idle");
			FlxG.log("Stage Complete!");
		}
		
		public function death():void 
		{
			alive = false;
			flicker(1);
			play("death");	
		}
	}

}