﻿package com.models {		import com.lib.Model;	import com.models.Player;	import com.geom.MapPoint;	import com.events.UnitEvent;		public class Unit extends Model {				private var type:String;		private var attack:int;		private var defence:int;		private var movement:int;		private var owner:Player;		private var currentLocation:MapPoint;			public function Unit(t:String, a:int, d:int, m:int)		{		  	type = t;		  	attack = a;		  	defence = d;		  	movement = m;		}				public function setLocation(m:MapPoint)		{ 			currentLocation = m;			var e:UnitEvent = new UnitEvent(UnitEvent.MOVEMENT);			e.setTargetLocation(currentLocation);			dispatchEvent(e);		} 		public function setOwner(o:Player) { owner = o; }		public function getType():String { return type; }		public function getMapPoint():MapPoint { return currentLocation; }	}	}