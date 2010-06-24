package com.factories {
	
	import com.models.Map;
	import com.views.GrassTile;
	import flash.display.Stage;
	
	public class Maps {
	
		// Public Methods:
		public static function small(s:Stage):Map
		{
		    var g:Map = new Map(3, 3);
		    var t:Array = parseMapString("GGGGGGGGG"); 
		    
		    //now I want to assign the tiles to the stage. I have to loop the 
		    //array again but I would prefer to do this rather than to worry about
		    //it in the parse string method.
		    for(var i:int = 0; i < t.length; i++)
		    {
		        s.addChild(t[i]);
		    }
		    g.setTiles(t);
		    return g;
		}
		
		private static function parseMapString(ms:String):Array
		{
			var tiles:Array = new Array();
			for(var i:int = 0; i < ms.length; i++)
	    	{
				switch(ms.charAt(i))
				{
	            	case "G":
	                	tiles.push(new GrassTile());
						break;
				}
			}
			return tiles;
		}
	}
}