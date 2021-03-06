﻿package com.events {
	
	import flash.events.Event
	import com.geom.MapPoint;
	
	public class UnitEvent extends Event {
		public static const MOVEMENT:String = "movement";
		public static const SELECTED:String = "selected";
		public static const DESELECTED:String = "deselected";
		public static const MOVEMENT_COMPLETE:String = "movement_complete";
		private var targetLocation:MapPoint;
		private var startLocation:MapPoint;
		public function UnitEvent(command:String) { super(command); }
		public function getTargetLocation():MapPoint { return targetLocation; }
		public function setTargetLocation(t:MapPoint):void { targetLocation = t; }
		public function getStartLocation():MapPoint { return startLocation; }
		public function setStartLocation(t:MapPoint):void { startLocation = t; }
	}
}