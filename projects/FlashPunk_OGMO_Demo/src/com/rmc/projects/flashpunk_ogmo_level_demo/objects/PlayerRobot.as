package com.rmc.projects.flashpunk_ogmo_level_demo.objects
{
	public class PlayerRobot extends WallAbstract
	{
		public function PlayerRobot(x:int, y:int)
		{
			super(x, y, AssetManager.playerRobot);
			setImage (AssetManager.playerRobot, 16, 32);
			setHitbox(16, 32);
		}
	}
}