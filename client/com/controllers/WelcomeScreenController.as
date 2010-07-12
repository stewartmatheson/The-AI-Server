package com.controllers {
	
	import flash.events.MouseEvent;
	import com.states.*;
	import com.events.StateEvent;
	import com.Config;
	import com.factories.*;
	import com.models.Map;
	import com.views.MapView;
	
	public class WelcomeScreenController {
		
		// Constants:
		// Public Properties:
		// Private Properties:
		var currentState:WelcomeScreen;
	
		// Initialization:
		public function WelcomeScreenController(s:WelcomeScreen) { currentState = s; }
	
		// Public Methods:
		public function newBattle(e:MouseEvent):void
		{
			var currentMap:Array;
			var findMap:Function = function(element:*, index:int, arr:Array):Boolean {
				if(element["name"].toLowerCase() == e.currentTarget.getText().toLowerCase())
				{
					currentMap = element;
					return true;
				}
				else
					return false;
			};
						
			if(Config.getValue("maps").some(findMap))
			{
				Config.setValue("selectedMap", currentMap);
				/*
				var nextStateEvent:StateEvent = new StateEvent(StateEvent.COMPLETE);
				nextStateEvent.setNextState(BattleState.create(currentMap, currentState.getStage()));
				currentState.dispatchEvent(nextStateEvent);
				*/
				var nextStateEvent:StateEvent = new StateEvent(StateEvent.COMPLETE);
				nextStateEvent.setNextState(new GameLoader(currentState.getStage()));
				currentState.dispatchEvent(nextStateEvent);
			}
			else
				throw new Error("Selected map not found in loaded config."); 
		}
		
		// Protected Methods:
		
		
	}
	
}