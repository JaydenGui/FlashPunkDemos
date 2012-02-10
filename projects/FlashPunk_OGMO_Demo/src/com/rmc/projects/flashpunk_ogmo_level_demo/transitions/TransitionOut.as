package com.rmc.projects.flashpunk_ogmo_level_demo.transitions 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import com.rmc.projects.flashpunk_ogmo_level_demo.game.Game;
	
	public class TransitionOut extends Entity
	{
		private var alphaChange : Number = 0.05;
		public var alpha:Number = 1;			//alpha is used for the rectangle which is drawn over the screen (so that it fades out)
		public var colour:uint = 0xF2F2F2;		//color of the rectangle
		
		public function TransitionOut() 
		{
			//set ourselves above everything else
			layer = -1000;
		}
		
		override public function render():void
		{
			//draw the rectangle
			Draw.rect(FP.camera.x, FP.camera.y, FP.width, FP.height, colour, alpha);
			
			//decrease alpha
			alpha -= alphaChange;
			
			//if the alpha is 0, tell the game to go to the next level
			if (alpha == 0)
			{
				Game.gotonext = true;
			}
		}
		
	}

}