package models {
	import flash.display.MovieClip; 
	public class Map {
		
		// Constants:
		// Public Properties:
		// Private Properties:
		private var width:int;
		private var height:int;
		private var tiles:Array;
	
		// Initialization:
		public function Map(w:int, h:int) 
		{
		    height = h; 
		    width = w;
		    tiles = new Array();
	    }
	
		// Public Methods:
		public function addTile(t:MovieClip):void
		{
		    tiles.push(t);
		}
		// Protected Methods:
	}	
}