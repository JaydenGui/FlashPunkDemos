package com.rmc.projects.flashpunk_ogmo_level_demo.objects  
{
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class WallAbstract extends ObjectAbstract
	{
		
		public function WallAbstract(x:int,y:int, aImageClass : Class) 
		{
			super (x, y);
			setImage(aImageClass);
			this.type = "Wall";
			
		}
		
		override public function update () : void 
		{
			super.update();
			//FP.buffer.
		}
		
	}
	
}