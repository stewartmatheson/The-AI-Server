package com.states {
	import com.lib.State;
	import com.views.StatusComplete;
	import flash.display.Stage;
	import flash.events.*;
	import flash.net.*;
	import com.factories.BattleState;
	import com.Config;
	import com.events.StateEvent;
	
	public class GameLoader extends State {
		
		private var gameCreator:URLLoader;
		private var statusDisplay:StatusComplete;
		
		public function GameLoader(s:Stage)
		{
			super(s);
			var currentMap:Array = Config.getValue("selectedMap") as Array;
			var matchCreateRequest:URLRequest = new URLRequest("http://" + Config.getValue("server_base_uri") + "/matches.xml");
            var postData:URLVariables = new URLVariables();
			postData["match[map_id]"] = currentMap["id"]; 
            matchCreateRequest.data = postData;
            matchCreateRequest.method = URLRequestMethod.POST;			
			currentStage.addEventListener(Event.ENTER_FRAME, frameEntered);
			
			gameCreator = new URLLoader();
			gameCreator.addEventListener(Event.COMPLETE, serverGameCreated);
			gameCreator.load(matchCreateRequest);
			
			statusDisplay = new StatusComplete();
			statusDisplay.statusLabel.text = "Creating Game";
			statusDisplay.x = (currentStage.stageWidth / 2) - (statusDisplay.width / 2 );
			statusDisplay.y = (currentStage.stageHeight / 2) - (statusDisplay.height / 2);
			addView(statusDisplay);
			display();
			
		}
		
		private function serverGameCreated(e:Event):void
		{
			var matchXML:XML = new XML(e.target.data);
			matchXML.ignoreWhite = true;
			
			var currentMatchData:Array = new Array();
			currentMatchData["id"] = matchXML["id"];
			
			var matchUnitData:Array = new Array();
			for each(var currentUnit:XML in matchXML['units']["game-unit"])
			{
				var singleCurrentUnit:Array = new Array();
				singleCurrentUnit["id"] = int(currentUnit["id"]);
				singleCurrentUnit["type"] = currentUnit["name"].toString();
				singleCurrentUnit["defence"] = int(currentUnit["defence"]);
				singleCurrentUnit["attack"] = int(currentUnit["attack"]);
				singleCurrentUnit["movement"] = int(currentUnit["movement"]);
				singleCurrentUnit["player"] = currentUnit["player"].toString();
				matchUnitData.push(singleCurrentUnit);
			}
			currentMatchData["match_units"] = matchUnitData;
			Config.setValue("currentMatch", currentMatchData);
			
			currentStage.removeEventListener(Event.ENTER_FRAME, frameEntered);
			var nextStateEvent:StateEvent = new StateEvent(StateEvent.COMPLETE);
			nextStateEvent.setNextState(BattleState.create(Config.getValue("selectedMap") as Array,  getStage()));
			dispatchEvent(nextStateEvent);
		}
		
		private function frameEntered(e:Event):void
		{
			statusDisplay.bar.width = loaderCompletePercent();
			statusDisplay.percentLabel.text = loaderCompletePercent().toString();
		}
		
		private function loaderCompletePercent():int
		{
			var total:Number = gameCreator.bytesTotal;
			var loaded:Number = gameCreator.bytesLoaded;
			return Math.floor((loaded / total) * 100);
		}
		
	}
}