package com.rmc.projects.flashpunk_ogmo_level_demo.objects  
{
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	public class Coin extends ObjectAbstract
	{
		
		public function Coin (x:int, y:int) 
		{
			super (x, y);
			
			var sprPlayer: Spritemap = new Spritemap(AssetManager.imgCoin, 16, 16);
			 
			//ADJUST SCALE IF 'WORLD' NEEDS THE PLAYER TO BE SMALLER THAN THE SPRITESHEET
			sprPlayer.scaleX = 1;
			sprPlayer.scaleY = 1;
			
			sprPlayer.add	("ANIMATION_COIN_SPIN", [0,1,2,3], .3, true);
			sprPlayer.play	("ANIMATION_COIN_SPIN");
			
			graphic = sprPlayer;
			
			this.type = Constants.COLLISION_TYPE_COIN;
			
			
		}
		
	}
	
}