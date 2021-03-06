﻿package com.models {
	
	import com.models.*;
	import com.geom.MapPoint;
	import com.lib.Model;
	
	public class Move extends Model{
		
		private var movedUnit:Unit;
		private var currentTurn:Turn;
		private var startLocation:MapPoint;
		private var endLocation:MapPoint;
		
		public function Move() { }
		public function getUnit():Unit { return movedUnit; }
		public function setStartPoint(s:MapPoint):void { startLocation = s; }		
		public function setEndPoint(e:MapPoint):void { endLocation = e; }
		public function setUnit(u:Unit):void { movedUnit = u; }
		public function setTurn(t:Turn):void { currentTurn = t; }
		public function getStartPoint():MapPoint { return startLocation; }
		public function getEndPoint():MapPoint { return endLocation; }
	}	
}