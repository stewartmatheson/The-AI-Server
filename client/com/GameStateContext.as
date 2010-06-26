package com {
    import flash.display.Stage;
	import com.states.Battle;
	import flash.net.*;
	import flash.events.*;
	
	public class GameStateContext {
		
		// Constants:
		// Public Properties:
		// Private Properties:
		private var currentStage:Stage;
	
		// Initialization:
		public function GameStateContext(s:Stage)
		{
			currentStage = s;
			
			//time to load the config. Both the states need config to be loaded before they can be used.
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, loadedConfig);
			loader.load(new URLRequest("config.xml"));
		}

		private function loadedConfig(e:Event):void
		{
			var myXML:XML = XML(e.target.data);
			myXML.ignoreWhite = true;
			
			trace(myXML.childNodes);
			//for now we are jumping right in to the level. However this is where the 
		    //menu code will go. That is when it's written
		    var b:Battle = new Battle(currentStage);
		}
	}
	
}