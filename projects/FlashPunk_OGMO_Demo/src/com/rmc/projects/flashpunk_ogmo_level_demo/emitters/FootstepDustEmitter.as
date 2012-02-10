package com.rmc.projects.flashpunk_ogmo_level_demo.emitters
{
	import flash.display.BitmapData;
	
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.utils.Ease;
	
	public class FootstepDustEmitter extends Emitter
	{
		public function FootstepDustEmitter(aTypeName : String)
		{
			super(new BitmapData (1,1), 1, 1);
			relative = false;
			newType(aTypeName, [0]);
			setAlpha(aTypeName,		1,			0);
			setColor(aTypeName, 0xFFFFFF, 	0xFF0000 );
			
			//MOTION
			var angle : Number = 45;
			var distance : Number  = 5;
			var duration : Number  = 5;
			var angleRange : Number  = 90;
			var distanceRange : Number  = 10;
			var durationRange : Number  = -5;
			var easing : Function = Ease.quadOut;
			setMotion (aTypeName, angle, distance, duration, angleRange, distanceRange, durationRange, easing);
		}
	}
}