package  
{
	
	/**
	 * All the sound data for the game
	 * 
	 * @author cld
	 */
	public class SndData
	{
		//robot sounds
		[Embed(source="../data/sfx/step.mp3")] public var stepSFX:Class;
		[Embed(source="../data/sfx/die.mp3")] public var dieSFX:Class;
		[Embed(source="../data/sfx/jump.mp3")] public var jumpSFX:Class;
		
		[Embed(source = "../data/sfx/spring.mp3")]public var springSFX:Class;
		[Embed(source = "../data/sfx/crumble.mp3")]public var crumbleSFX:Class;
	}

}