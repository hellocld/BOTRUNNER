package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author cld
	 */
	public class Blaster extends FlxGroup
	{
		public var turret:Turret;
		public var bullet:Bullet;
		
		public function Blaster() 
		{
			
			super(x * 16, y * 16);
			turret = new Turret();
			bullet = new Bullet();
			
			add(turret);
			
			
		}
		
		override public function update():void
		{
			super.update();
			
			if (!bullet.alive)
			{
				turret.charge = true;
				if (turret.fire)
				{
					bullet.alive;
					bullet.reset(x, y);
					add(bullet);
				}
			}
		}
		
		public function setup(startFrame:int):void
		{
			turret.setup(startFrame);
			bullet.setup(startFrame);
		}
		
		
		
	}

}