package 
{
	public class AssetManager
	{
		//embed all the levels
		[Embed(source = '../assets/levels/Project/NewLevel.oel', mimeType = "application/octet-stream")] 
		public static var level1:Class;
		
		[Embed(source = '../assets/levels/Level2.oel', mimeType = "application/octet-stream")]
		public static var level2:Class;
		
		[Embed(source = '../assets/levels/Level3.oel', mimeType = "application/octet-stream")] 
		public static var level3:Class;
		
		
		//Embed the graphic, and create a new Image called sprWall, with a size of 16x16
		[Embed(source = '../assets/graphics/grass.png')]
		public static var imgGrass:Class;
		
		//Embed the graphic, and create a new Image called sprWall, with a size of 16x16
		[Embed(source = '../assets/graphics/coin.png')]
		public static var imgCoin:Class;
		
		//Embed the graphic, and create a new Image called sprWall, with a size of 16x16
		[Embed(source = '../assets/graphics/background1.png')]
		public static var imgBackground1:Class;
		
		//Embed the graphic, and create a new Image called sprWall, with a size of 16x16
		[Embed(source = '../assets/graphics/wall1.png')]
		public static var imgWall1:Class;
		
		//Embed the graphic, and create a new Image called sprWall, with a size of 16x16
		[Embed(source = '../assets/graphics/wall2.png')] 
		public static var imgWall2:Class;
		
		//Embed the graphic, and create a new Image called sprWall, with a size of 16x16
		[Embed(source = '../assets/graphics/wall3.png')] 
		public static var imgWall3:Class;
		
		////////////////////////
		////////////////////////
		
		//Embed the graphic, and create a new Image called sprWall, with a size of 16x16
		[Embed(source = '../assets/graphics/platform.png')] 
		public static var platform:Class;
		
		
		//Embed the graphic, and create a new Image called sprWall, with a size of 16x16
		[Embed(source = '../assets/graphics/platform_left.png')] 
		public static var platformLeft:Class;
		
		
		//Embed the graphic, and create a new Image called sprWall, with a size of 16x16
		[Embed(source = '../assets/graphics/platform_right.png')] 
		public static var platformRight:Class;
		
		//Embed the graphic, and create a new Image called sprWall, with a size of 16x16
		[Embed(source = '../assets/graphics/platform_lower_left.png')] 
		public static var platformLowerLeft:Class;
		
		//Embed the graphic, and create a new Image called sprWall, with a size of 16x16
		[Embed(source = '../assets/graphics/platform_lower.png')] 
		public static var platformLower:Class;
		
		//Embed the graphic, and create a new Image called sprWall, with a size of 16x16
		[Embed(source = '../assets/graphics/platform_lower_right.png')] 
		public static var platformLowerRight:Class;
		
		
		[Embed(source = '../assets/graphics/finish.png')] 
		public static var imgFinish:Class;
		
		//Embed the player sprite, and create a new spritemap, that is 16x16
		//[Embed(source = '../assets/graphics/player.png')] 
		//public static var imgPlayer:Class;
		
		//Embed the player sprite, and create a new spritemap, that is 16x16
		[Embed(source = '../assets/graphics/player_sword_guy.png')] 
		public static var imgPlayer:Class;
		
		
		//Embed the player sprite, and create a new spritemap, that is 16x16
		[Embed(source = '../assets/graphics/player_robot.png')] 
		public static var playerRobot:Class;
		
		
		public function AssetManager()
		{
		}
	}
}
