package com.rmc.projects.flashpunk_ogmo_level_demo.objects  
{
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Grass extends ObjectAbstract
	{
		
		public function Grass (x:int, y:int) 
		{
			super (x, y);
			setImage(AssetManager.imgGrass);
			this.type = "Coin";
			
			
		}
		
	}
	
}