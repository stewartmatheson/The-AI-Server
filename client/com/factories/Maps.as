package com.factories {
	
	import com.models.Map;
	import com.views.*;
	import flash.display.Stage;
	
	public class Maps {
	
		// Public Methods:
		public static function small(s:Stage):Map
		{
			var t:Array = parseMapString("GGGGGGGGG");
			var mV:MapView = new MapView(3, 3);
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
				}
			}
			return tiles;
		}
	}
}