package com.factories {
	
	import com.models.Player;
	import com.geom.MapPoint;
	
	public class Players {
		
		public static function create(startingPoint:MapPoint):Player
		{
			var p:Player = new Player();			
			p.setStartPoint(startingPoint);
			return p;
		}
	}
	
}