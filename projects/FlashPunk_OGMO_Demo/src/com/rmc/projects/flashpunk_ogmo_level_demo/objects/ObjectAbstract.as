package com.rmc.projects.flashpunk_ogmo_level_demo.objects  
{
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class ObjectAbstract extends Entity
	{
		
		public function ObjectAbstract(x:int,y:int) 
		{
			this.x = x;
			this.y = y;
			
		}
		
		protected function setImage (aImageClass : Class, aImageWidth : Number = 16, aImageHeight : Number = 16) : void{
			graphic = new Image(aImageClass , new Rectangle(0, 0, aImageWidth, aImageHeight));;
			setHitbox(16, 16);
		}
		
		
	}
	
}