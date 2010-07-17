package com.models {
	import com.lib.Model;
	import com.models.Tile;
	import com.geom.MapPoint;
	
	public class Map extends Model
	{
		private var mapHeight:int;
		private var mapWidth:int;
		private var tiles:Array;
		private var rallyPoints:Array;
		
		public function Map(w:int, h:int) { mapHeight = h; mapWidth = w; }
		public function getHeight():int { return mapHeight; }
		public function getWidth():int { return mapWidth; }
		public function getTiles():Array { return tiles; }
		public function getRallyPoints():Array { return rallyPoints; }
	
		public function pushBackTile(t:Tile):void
		{
			if(tiles == null)
				tiles = new Array();
				
			tiles.push(t);
		}
		
		public function canMoveToPoint(p:MapPoint):Boolean
		{

			if(p.getXPos() < 0)
				return false;
				
			if(p.getYPos() < 0)
				return false;

			if(p.getXPos() >= mapWidth)
				return false;
				
			if(p.getYPos() >= mapHeight)
				return false;
				
			if(getTileAtPoint(p).getType() == "Water")
				return false;
			
			return true;
		}
		
		public function getTileAtPoint(mapP:MapPoint):Tile
		{
			var foundTile:Tile;
			var findTileByMapPointCallback:Function = function(t:Tile, index:int, array:Array):Boolean
			{
				if(t.getMapPoint().equals(mapP))
				{
					foundTile = t;
					return true;
				}
				return false;
			}
			tiles.some(findTileByMapPointCallback);
			return foundTile;
		}
		
		public function addRallyPoint(r:RallyPoint):void
		{
			if(rallyPoints == null)
				rallyPoints = new Array();
			rallyPoints.push(r);
		}
	}	
}