package com.factories {
	
	import com.models.Map;
	public class Maps {
		
		// Constants:
		// Public Properties:
		// Private Properties:
	
		// Initialization:
		public function Maps() { }
	
		// Public Methods:
		public static function small():Map
		{
		    var g:Map = new Map(20, 20);
		    return g;
		}
		
		// Protected Methods:
	}
	
}