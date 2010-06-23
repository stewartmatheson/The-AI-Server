package com.models {
    	
	public class Map {
		
		private var mapWidth:int;
		private var mapHeight:int;
		private var tiles:Array;
	
		// Initialization:
		public function Map(w:int, h:int) 
		{
		    mapHeight = h; 
		    mapWidth = w;
		    tiles = new Array();
	    }
	
		// Public Methods:
		public function setTiles(t:Array):void
		{
		    tiles = t;
		    for(var i:int; i < tiles.length; i++)
		    {
		        tiles[i].x = tiles[i].stage.stageWidth / 2; 
		    }
		}
		
		public function getTiles():Array { return tiles; }
	}	
}