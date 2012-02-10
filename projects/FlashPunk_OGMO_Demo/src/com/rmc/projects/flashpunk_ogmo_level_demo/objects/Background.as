package com.rmc.projects.flashpunk_ogmo_level_demo.objects  
{
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Background extends ObjectAbstract
	{
		
		public function Background (x:int, y:int, aImageClass : Class) 
		{
			super (x, y);
			setImage(aImageClass, 400, 300);
			this.type = "Background";
			
			
		}
		
	}
	
}