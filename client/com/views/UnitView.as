﻿package com.views {
	
	import flash.display.MovieClip;
	import com.models.Unit;
	import flash.events.*;
	import com.views.MapView;
	import com.views.TileView;
	import flash.utils.Timer;
	import com.events.UnitEvent;
	import flash.geom.ColorTransform;
	
	public class UnitView extends MovieClip {
		
		protected var model:Unit;
		protected var mapV:MapView;
		private var fadeInOutTimer:Timer;
		private var fadingOut:Boolean = true;
		public function getModel():Unit { return model; }
		public function setModel(u:Unit):void { model = u; }
		public function setMapView(m:MapView):void { mapV = m; }
		
		public function moved(e:Event):void
		{
			var targetTile:TileView = mapV.getTileAtPoint(model.getMapPoint());
			x = targetTile.x + mapV.x + 5;
			y = targetTile.y + mapV.y - 15;
		}
		
		public function setColorTransform(t:ColorTransform):void 
		{ 
			transform.colorTransform = t;
		}
		
		public function selected(e:UnitEvent):void
		{
			if(fadeInOutTimer == null)
			{
				fadeInOutTimer = new Timer(20);
				fadeInOutTimer.addEventListener(TimerEvent.TIMER, tick);
			}
			fadeInOutTimer.start();
		}
		
		public function deselected(e:UnitEvent):void
		{
			fadeInOutTimer.stop();
			alpha = 1;
		}
		
		private function tick(e:TimerEvent):void
		{
			var diff:Number = .05;
			if(fadingOut)
			{
				alpha = alpha - diff;
				if(alpha < 0.2)
					fadingOut = false;
			}
			else
			{
				alpha = alpha + diff;
				if(alpha > 1)
					fadingOut = true;
			}
		}
	}
}