package  
{
	import org.flixel.*
	/**
	 * ...
	 * @author cld
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = "data/gfx/robot.png")] protected var robotPNG:Class;
		
		protected var _jumpPower:int;
		
		protected var _playerBounds:FlxRect;
		
		public function Player(X:int, Y:int) 
		{
			super(X, Y);
			loadGraphic(robotPNG, true, true, 16, 32);
			
			var runSpeed:uint = 120;
			drag.x = runSpeed * 8;
			acceleration.y = 420;
			_jumpPower = 200;
			maxVelocity.x = runSpeed;
			maxVelocity.y = _jumpPower*2;
			
			width = 14;
			offset.x = 1;
			
			addAnimation("idle", [0]);
			addAnimation("run", [1, 2, 3, 4, 5, 6, 7, 8], 12);
			addAnimation("jumpUp", [10]);
			addAnimation("jumpDown", [9]);
		}
		
		override public function update():void
		{
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
			if (FlxG.keys.justPressed("UP") && !velocity.y)
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
			
			
			if (x < 0) x = 0;
			if (y < 0) y = 0;
			if (x > _playerBounds.width - 16) x = _playerBounds.width - 16;
			if (y > _playerBounds.height - 32) y = _playerBounds.height - 32;
		}
		
		public function setBounds(bounds:FlxRect):void
		{
			_playerBounds = bounds;
		}
		
	}

}