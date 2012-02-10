package com.rmc.projects.flashpunk_ogmo_level_demo.objects  
{
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	
	public class Finish extends Entity
	{
		public var sprFinish:Image 
		
		public function Finish(x:int,y:int) 
		{
			sprFinish = new Image(AssetManager.imgFinish, new Rectangle(0, 0, 16, 16));
			
			//set position
			this.x = x;
			this.y = y;
			
			//set type, so the player knows what it's hitting
			type = "Finish";
			
			//set the graphic
			graphic = sprFinish;
			
			//set the hitbox, for collisions
			setHitbox(16, 16);
		}
		

		
	}

}