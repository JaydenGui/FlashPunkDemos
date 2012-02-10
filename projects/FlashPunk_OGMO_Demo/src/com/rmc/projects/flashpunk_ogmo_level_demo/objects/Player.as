package com.rmc.projects.flashpunk_ogmo_level_demo.objects 
{
	import com.rmc.projects.flashpunk_ogmo_level_demo.emitters.FootstepDustEmitter;
	import com.rmc.projects.flashpunk_ogmo_level_demo.game.Game;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import org.osmf.layout.ScaleMode;
	
	public class Player extends Entity
	{

		public var spriteMapOfBody:Spritemap;
		
		//init all the variables.
		public var speed:Point = new Point(0, 0);		//Vertical and Horizontal speed of the player
		public var acceleration:Number = 0.8*2;			//Horizontal acceleration of the player (left/right)
		public var friction:Number = 0.3*2;				//Horizontal friction of the player (slows player down when not moving)
		public var gravity:Number = 0.4;				//how fast the player is pulled down
		public var jump:Number = 8;					//how high the character can jump
		public var maxspeed:Number = 4;					//the max horizontal speed of the player (left/right)
		
		public var frozen:Boolean = false;				//if the player is "frozen" (can't move)
		private var FRAME_RATE:Number = .4;

		private var footstepDustEmitterName_str : String = "FootstepDustEmitter";
		private var footstepDustEmitter:FootstepDustEmitter;
		
		public function Player(x:int,y:int) 
		{
			
			//SPRITE MAP 
			spriteMapOfBody = new Spritemap(AssetManager.imgPlayer, 48, 32);
			
			//EMITTER
			footstepDustEmitter = new FootstepDustEmitter(footstepDustEmitterName_str);
			
			//ASSIGN ONE GRAPHIC LAYERS (RENDERS FIRST = LOWEST)
			graphic = new Graphiclist (footstepDustEmitter, spriteMapOfBody);
			
			
			//ADJUST SCALE IF 'WORLD' NEEDS THE PLAYER TO BE SMALLER THAN THE SPRITESHEET
			spriteMapOfBody.scaleX = .5;
			spriteMapOfBody.scaleY = .5;

			
			//set our x and y position (this.x,this.y) to the x and y that are given upon creaton
			this.x = x;
			this.y = y;
			
			//create the different animations
			spriteMapOfBody.add("standLeft", 		[0, 1, 2, 3, 4, 5],		FRAME_RATE, true);
			spriteMapOfBody.add("standRight", 	[0, 1, 2, 3, 4, 5], 	FRAME_RATE, true);
			spriteMapOfBody.add("walkLeft", 		[6, 7, 8, 9, 10, 11], 	FRAME_RATE, true);
			spriteMapOfBody.add("walkRight", 		[6, 7, 8, 9, 10, 11], 	FRAME_RATE, true);
			
			//select the animation we should play, and set the graphic to our spritemap
			spriteMapOfBody.play("standRight");
			
			
			//define the different controls
			Input.define("left", Key.LEFT);
			Input.define("right", Key.RIGHT);
			Input.define("jump", Key.Z, Key.UP);
			
			//set our hitbox
			setHitbox(48/2, 32/2);
		}
		
		//update function, occurs every frame of the game
		override public function update():void
		{
			//if we're frozen, exit the update function before anything can happen
			if (frozen) { return; }
			
			if (collide("Wall", x, y + 1) && speed.x != 0) {
				emitParticles();
			}
			
			//If we're holding left ...
			if (Input.check("left"))
			{

				spriteMapOfBody.play("walkLeft")	//set our animation to walk right
				if (spriteMapOfBody.flipped == false ) {
					spriteMapOfBody.flipped = true;
				}
				speed.x -= acceleration;		//descrease our horizontal speed (making it negative, so we move left)
			}
			//If we're holding right ...
			if (Input.check("right"))
			{
				spriteMapOfBody.play("walkRight")	//set our animation to walk right
				if (spriteMapOfBody.flipped == true ) {
					spriteMapOfBody.flipped = false;
				}
				speed.x += acceleration;		//increase our horizontal speed (making it positive, so we move right)
			}
			
			//if we're holing jump, and there's a floor below us, jump
			if (Input.check("jump") && collide("Wall", x, y + 1)) { speed.y = - jump; }
			
			//if we're moving upwards, and we're not holding jump, make us fall faster (variable jumping)
			if (!Input.check("jump") && speed.y < 0) { speed.y += gravity; }
			
			//increase vertical speed (gravity)
			speed.y += gravity;
			
			/* this makes the player move left/right. The loop below makes it so that the player has pixel
			 * perfect collisions. What we do, is run through each pixel that he is going to move, and check
			 * if there is a solid thing in the way. If there is, we stop moving, and set our speed to 0.
			 * Otherwise, we move in whatever direction we should be moving */
			for (var i:int = 0; i < Math.abs(speed.x); i += 1)
			{
				//Check if there is a wall 1 pixel left/right of us
				//FP.sign returns 1 if speed.x is positive, -1 is speed.x is negative, and 0 if speed.x is 0
				if (!collide("Wall", x + FP.sign(speed.x), y)) 
				{
					//no wall? Move 1 pixel left/right
					x += FP.sign(speed.x); 
				}
				else 
				{ 
					//oh, thre is a wall? Set our animation to the standing animation
					if(speed.x > 0) { spriteMapOfBody.play("standRight"); } else { spriteMapOfBody.play("standLeft"); }
					//set our speed to nothing
					speed.x = 0; 
				}
			}
			
			//this is exactly the same as the previous loop, just for vertical movement
			for (i = 0; i < Math.abs(speed.y); i += 1)
			{
				if (!collide("Wall", x, y + FP.sign(speed.y))) { y += FP.sign(speed.y); } else { speed.y = 0; }
			}
			
			// if we're not holding right/left ...
			if (!Input.check("left") && !Input.check("right"))
			{
				//if we're moving right
				if (speed.x > 0) 
				{ 
					//descrease speed by friction, play the standRight animation
					spriteMapOfBody.play("standRight");
					speed.x -= friction;
					if (speed.x < 0) { speed.x = 0; }
				}
				
				//if we're moving left
				if (speed.x < 0) 
				{
					//increase speed by friction, play the standLeft animation
					spriteMapOfBody.play("standLeft");
					speed.x += friction;
					if (speed.x > 0) { speed.x = 0; }
				}
			}
			
			
			/* if our speed is larger than max speed, set our speed to the max speed.
			 * this may look kind of confusing, but it's quite simple
			 * Math.abs returns the absolute of any value (ex. Math.abs(-7) returns 7, Math.abs(3) returns 3
			 * So if the absolute of speed.x is larger than max speed, we set speed.x to the max speed * the direction of the speed. */
			if (Math.abs(speed.x) > maxspeed) { speed.x = FP.sign(speed.x) * maxspeed; }
			
			//if we hit the finish line, freeze us, and tell the game we're done
			if (collide("Finish", x, y)) {
				frozen = true;
				Game.finished = true;
			}
			
			//camera
			var isFollowingWithCamera_boolean : Boolean = false;
			if (isFollowingWithCamera_boolean) {
				FP.camera.x += Math.round(((x - FP.width / 2) - FP.camera.x) / 10);
				FP.camera.y += Math.round(((y - FP.height / 2) - FP.camera.y) / 10);
			}
			
			//if we fell out of the room, tell the game to reset, and freeze us.
			if (y > FP.height * 4) { Game.restart = true; frozen = true; }
		}
		
		private function emitParticles():void
		{
			// TODO Auto Generated method stub
			for (var j: uint = 0; j <= 40; j++) {
				footstepDustEmitter.emit(footstepDustEmitterName_str, x + width/2, y + height);
			}
			
		}
		
	}

}