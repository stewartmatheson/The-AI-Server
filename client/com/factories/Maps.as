package com.factories {
	
	import com.models.Map;
	import com.views.*;
	import flash.display.Stage;
	
	public class Maps {
	
		// Public Methods:
		public static function small(s:Stage):Map
		{
			var t:Array = parseMapString("GGRL");
			var mV:MapView = new MapView(2, 2);
			s.addChild(mV); 
			var m:Map = new Map(mV);
		    mV.setTiles(t);
		    return m;
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
					case "R":
		                tiles.push(new RockTile());
						break;
					case "L":
			            tiles.push(new LightGrassTile());
						break;
				}
			}
			return tiles;
		}
	}
}