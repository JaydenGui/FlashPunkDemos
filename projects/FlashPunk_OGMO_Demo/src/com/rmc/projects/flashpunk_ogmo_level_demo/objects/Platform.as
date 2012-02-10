package com.rmc.projects.flashpunk_ogmo_level_demo.objects
{
	public class Platform extends WallAbstract
	{
		public function Platform(x:int, y:int)
		{
			super(x, y, AssetManager.platform);
		}
	}
}