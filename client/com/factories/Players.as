﻿package com.factories {		import com.models.Player;	import com.geom.MapPoint;		public class Players {				public static function create(playerNumber:int, mapData:Array):Player		{			var p:Player = new Player();			var mapP:MapPoint;			if(playerNumber == 1)				mapP = new MapPoint(mapData["width"] - 1, mapData["height"] - 1);			else				mapP = new MapPoint(0, 0);						p.setStartPoint(mapP);			return p;		}	}	}