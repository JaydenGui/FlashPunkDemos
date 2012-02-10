package 
{
	import com.rmc.projects.flashpunk_ogmo_level_demo.game.Game;
	
	import flash.display.StageQuality;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	[SWF(width="800",height="600")]
	public class Main extends Engine
	{
		
		public function Main():void
		{
			//start the game
			super(Constants.GAME_WIDTH, Constants.GAME_HEIGHT, Constants.GAME_FRAMERATE, true);
			
			stage.quality = StageQuality.LOW;
			//set the screen scale, so it's double
			FP.screen.scale = 2;
			//go to the correct world
			FP.world = new Game();
		}
	}
	
}