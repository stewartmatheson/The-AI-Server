﻿package com.models {		import com.geom.MapPoint;	import com.models.Unit;		public class Player {				private var name:String;		private var color:uint;		private var startLocation:MapPoint;		private var units:Array;				public function Player() { }		public function setStartPoint(m:MapPoint):void { startLocation = m; }		public function getStartPoint():MapPoint { return startLocation; }		public function addUnit(u:Unit)		{			if(units == null)				units = new Array();			units.push(u);		}	}}