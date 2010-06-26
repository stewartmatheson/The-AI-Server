package com {

	public class Config {
		
		private static var values:Array;
		
		public static function getValue(k:String):String
		{
			return values[v];
		}
		
		public static function setValue(k:String, v:String):String
		{
			values[k] = v;
		}
		
	}
}