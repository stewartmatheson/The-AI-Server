package com.models {
	
	import com.lib.Model;
	import com.geom.MapPoint;
	import com.models.Player;
	
	public class RallyPoint extends Model {
		
		private var currentMapPoint;
		private var owner:Player;
		
		public function RallyPoint(m:MapPoint)
		{
			currentMapPoint = m;
		}
		
		public function getMapPoint():MapPoint { return currentMapPoint; }
	}	
}