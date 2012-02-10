package com.rmc.projects.flashpunk_ogmo_level_demo.game  
{
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.Background;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.Background1;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.Coin;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.Finish;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.Grass;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.Platform;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.PlatformLeft;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.PlatformLower;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.PlatformLowerLeft;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.PlatformLowerRight;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.PlatformRight;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.Player;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.PlayerRobot;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.Wall1;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.Wall2;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.Wall3;
	import com.rmc.projects.flashpunk_ogmo_level_demo.objects.WallAbstract;
	import com.rmc.projects.flashpunk_ogmo_level_demo.transitions.TransitionIn;
	import com.rmc.projects.flashpunk_ogmo_level_demo.transitions.TransitionOut;
	
	import flash.utils.ByteArray;
	
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	
	public class Game extends World
	{
		
		//the current level
		public static var level:int = 1;
		
		//put the levels in an array, so we can run through them
		public var levels:Array = new Array(AssetManager.level1, AssetManager.level1, AssetManager.level1, AssetManager.level1);
		
		//set some basic values
		public static var player:Player;				// the player
		public static var finished:Boolean = false;		// if we are finished the level
		public static var gotonext:Boolean = false;		// if we should go to the next level
		public static var restart:Boolean = false;		// if we should restart the current level
		public static var transition:Boolean = false;	// if a transition is currently happening
		
		public function Game() 
		{
			//load the level
			loadLevel();
		}
		
		override public function update():void
		{
			super.update();
			
			//if the level is finished
			if (finished)
			{
				//if we aren't ready to go to the next yet
				if (!gotonext)
				{
					//add transition (assuming it has not yet been created)
					if (!transition) 
					{
						add(new TransitionIn()); 
						transition = true; 
					}
				} else {
					//if we are ready to go to the next level, go to it
					nextLevel();
				}
			}
			
			//restart the current level (if restart is true)
			if (restart) { restartLevel(); }
		}
		
		public function loadLevel():void
		{
			//if we've beaten all the levels, go back to level 1
			if (level > levels.length) { level = 1; }
			
			//add the transition
			add(new TransitionOut());
			
			//set all the variables to false
			finished = false;
			gotonext = false;
			transition = false;
			restart = false;
			
			//setup some variables
			var e:Entity;
			var o:XML;
			
			//get the xml file of the level
			var file:ByteArray = new levels[level-1];
			var str:String = file.readUTFBytes( file.length );
			var xml:XML = new XML(str);
			
			trace ("xml.static[0].wall: " + xml.static[0].player);
			trace ("xml.static[0].wall: " + xml.static[0].wall);
			trace ("xml.static[0].wall1: " + xml.static[0].wall1);
			trace ("xml.static[0].wall2: " + xml.static[0].wall2);
			
			//add the objects to level
			
			//BACKGROUND FIRST
			for each (o in xml.background[0].background1) { add(e = new Background1(o.@x, o.@y)); }
			
			//STATIC - PERMANENT STUFF
			for each (o in xml.dynamic[0].player) 		{ 	add(player = new Player(o.@x, o.@y)); }
			for each (o in xml.dynamic[0].player_robot) 	{ 	add(e = new PlayerRobot(o.@x, o.@y)); }
			//
			for each (o in xml.static[0].platform_left) { 	add(e = new PlatformLeft(o.@x, o.@y)); }
			for each (o in xml.static[0].platform) { 		add(e = new Platform(o.@x, o.@y)); }
			for each (o in xml.static[0].platform_right) { 	add(e = new PlatformRight(o.@x, o.@y)); }
			for each (o in xml.static[0].platform_lower_left) { 	add(e = new PlatformLowerLeft(o.@x, o.@y)); }
			for each (o in xml.static[0].platform_lower) 		{ 	add(e = new PlatformLower(o.@x, o.@y)); }
			for each (o in xml.static[0].platform_lower_right) { 	add(e = new PlatformLowerRight(o.@x, o.@y)); }
			//
			for each (o in xml.static[0].wall1) { 			add(e = new Wall1(o.@x, o.@y)); }
			for each (o in xml.static[0].wall1) { 			add(e = new Wall1(o.@x, o.@y)); }
			for each (o in xml.static[0].wall2) { 			add(e = new Wall2(o.@x, o.@y)); }
			for each (o in xml.static[0].wall3) { 			add(e = new Wall3(o.@x, o.@y)); }
			for each (o in xml.static[0].finish) { 			add(e = new Finish(o.@x, o.@y)); }
			
			//DYNAMIC - CHANGING STUFF
			for each (o in xml.dynamic[0].coin) { add(e = new Coin(o.@x, o.@y)); }
			
			//FOREGROUND LAST (ON TOP)
			for each (o in xml.foreground[0].grass) { add(e = new Grass(o.@x, o.@y)); }
			//
		}
		
		//remove all the entities, load the CURRENT level
		public function restartLevel():void
		{
			removeAll();
			loadLevel();
		}
		
		//remove all entities, go to the next level
		public function nextLevel():void
		{
			removeAll();
			level ++;
			loadLevel();
		}
	}

}