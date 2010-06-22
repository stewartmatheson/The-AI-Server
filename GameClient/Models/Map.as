package Models {
	
	public class Map {
		
		// Constants:
		// Public Properties:
		// Private Properties:
		private var width:Integer;
		private var height:Integer;
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