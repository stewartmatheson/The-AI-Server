﻿package com.states {
	
	import flash.net.*;
	import flash.events.*;
	import com.events.StateEvent;
	import com.Config;
	import com.states.WelcomeScreen;
	import com.lib.State;
	import flash.display.Stage;
	import com.views.StatusComplete;
	
	public class Loader extends State {
		
		private var mapLoader:URLLoader;
		private var statusDisplay:StatusComplete;
	
		public function Loader(s:Stage)
		{
			super(s);
			
			Config.setValue("server_base_uri", "localhost:3000");
			Config.setValue("maps_uri", "/maps.xml");
			Config.setValue("units_uri", "/units.xml");
			
			currentStage.addEventListener(Event.ENTER_FRAME, frameEntered);
			
			mapLoader = new URLLoader();
			mapLoader.addEventListener(Event.COMPLETE, loadedMaps);
			mapLoader.load(new URLRequest("http://" + Config.getValue("server_base_uri") + 
																			Config.getValue("maps_uri")));
			
			statusDisplay = new StatusComplete();
			statusDisplay.x = (currentStage.stageWidth / 2) - (statusDisplay.width / 2 );
			statusDisplay.y = (currentStage.stageHeight / 2) - (statusDisplay.height / 2);
			addView(statusDisplay);
			display();
		}
		
		private function frameEntered(e:Event):void
		{
			statusDisplay.bar.width = loaderCompletePercent();
			statusDisplay.percentLabel.text = loaderCompletePercent().toString();			
			if(loaderCompletePercent() == 100 && Config.getValue("maps") != null)
			{
				currentStage.removeEventListener(Event.ENTER_FRAME, frameEntered);
				var nextStateEvent:StateEvent = new StateEvent(StateEvent.COMPLETE);
				var w:WelcomeScreen = new WelcomeScreen(currentStage);
				nextStateEvent.setNextState(w);
				dispatchEvent(nextStateEvent);
			}
		}
		
		private function loaderCompletePercent():int
		{
			var total:Number = currentStage.loaderInfo.bytesTotal + mapLoader.bytesTotal;
			var loaded:Number = currentStage.loaderInfo.bytesLoaded + mapLoader.bytesLoaded;
			return Math.floor((loaded / total) * 100);
		}
		
		private function loadedMaps(e:Event):void
		{
			var mapsXML:XML = XML(e.target.data);
			mapsXML.ignoreWhite = true;
			var maps:Array = new Array();
			for each (var map:XML in mapsXML.map)
			{
				var singleMap:Array = new Array();
				var mapTiles:Array = new Array();
				
				for each(var tile:XML in map.tiles.tile)
				{
					var singleTile:Array = new Array();
					singleTile["type"] = tile["tile-type"].toString();
					singleTile["height"] = int(tile["height"]);
					singleTile["order"] = int(tile["map-order"]);
					mapTiles.push(singleTile);
				}
				
				var startUnits:Array = new Array();
				for each(var startunit:XML in map.units.unit)
				{
					var singleStartUnit:Array = new Array();
					singleStartUnit["attack"] = int(startunit["attack"]);
					singleStartUnit["defence"] = int(startunit["defence"]);
					singleStartUnit["type"] = startunit["name"].toString();
					singleStartUnit["movement"] = int(startunit["movement"]);
					startUnits.push(singleStartUnit);
				}
				
				var rallyPoints:Array = new Array();
				for each(var rallyPoint:XML in map.rallypoints.rallypoint)
				{
					var singleRallyPoint:Array = new Array();
					singleRallyPoint["xpos"] = int(rallyPoint["xpos"]);
					singleRallyPoint["ypos"] = int(rallyPoint["ypos"]);
					rallyPoints.push(singleRallyPoint);
				}
				
				singleMap["id"] = int(map["id"]);
				singleMap["name"] = map["name"].toString();
				singleMap["height"] = int(map["height"]);
				singleMap["width"] = int(map["width"]);
				singleMap["tiles"] = mapTiles;
				singleMap["units"] = startUnits;
				singleMap["rallypoints"] = rallyPoints;
				
				maps.push(singleMap);
			}
			Config.setValue("maps", maps);
		}
	}
}
