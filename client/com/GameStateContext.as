package com {
    import flash.display.Stage;
	import com.states.Battle;
	
	public class GameStateContext {
		
		// Constants:
		// Public Properties:
		// Private Properties:
	
		// Initialization:
		public function GameStateContext(s:Stage)
		{
		    //for now we are jumping right in to the level. However this is where the 
		    //menu code will go. That is when it's written
		    var b:Battle = new Battle(s);
			com.Config.unitsUri();
		}
	
		// Public Methods:
		// Protected Methods:
	}
	
}