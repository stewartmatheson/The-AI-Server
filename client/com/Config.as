package com {
	
	import flash.events.Event;
	import flash.net.*;
	
	public class Config {
		
		private static var configXml:XML;
		private static var isLoaded:Boolean = false;
		
		private static function ifLoad():void
		{
			if(!isLoaded)
			{
				var loader:URLLoader = new URLLoader();
				loader.addEventListener(Event.COMPLETE, loadXML);
				loader.load(new URLRequest("config.xml"));
			}
		}
		
		public static function unitsUri():String
		{
			ifLoad();
			
			//trace(configXml.firstChild.childNodes[0]);
			//return firstChild.childNodes[0];
			return configXml.firstChild;
		}
		
		private static function loadXML(e:Event):void
		{
		        configXml = new XML(e.target.data);
				isLoaded = true;
		}
	}
}