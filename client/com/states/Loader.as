﻿package com.states {		import flash.net.*;	import flash.events.*;	import com.events.StateEvent;	import com.Config;	import com.states.WelcomeScreen;	import com.lib.State;	import flash.display.Stage;		public class Loader extends State {				private var configLoader:URLLoader;		private var unitsLoader:URLLoader;		private var mapLoader:URLLoader;									public function Loader(s:Stage)		{			super(s);			/*			configLoader = new URLLoader();			configLoader.addEventListener(Event.COMPLETE, loadedConfig);			configLoader.load(new URLRequest("config.xml"));			*/						Config.setValue("server_base_uri", "localhost:3000");			Config.setValue("maps_uri", "/maps.xml");			Config.setValue("units_uri", "/units.xml");						mapLoader = new URLLoader();			mapLoader.addEventListener(Event.COMPLETE, loadedMaps);			mapLoader.load(new URLRequest("http://" + Config.getValue("server_base_uri") + 																			Config.getValue("maps_uri")));		}				/*		private function loadedConfig(e:Event):void		{			var configXML:XML = XML(e.target.data);			configXML.ignoreWhite = true;			Config.setValue("server_base_uri", configXML.option.(@key == "server_base_uri"));			Config.setValue("maps_uri", configXML.option.(@key == "maps_uri"));			Config.setValue("units_uri", configXML.option.(@key == "units_uri"));						//now we have all the config we can start loading the map data from the server.			mapLoader = new URLLoader();			mapLoader.addEventListener(Event.COMPLETE, loadedMaps);			mapLoader.load(new URLRequest("http://" + Config.getValue("server_base_uri") + 																			Config.getValue("maps_uri")));		}		*/				private function loadedMaps(e:Event):void		{			var mapsXML:XML = XML(e.target.data);			mapsXML.ignoreWhite = true;			var maps:Array = new Array();			for each (var map:XML in mapsXML.map)			{				var singleMap:Array = new Array();				var mapTiles:Array = new Array();								for each(var tile:XML in map.tiles.tile)				{					var singleTile:Array = new Array();					//trace(tile);					singleTile["type"] = tile["tile-type"].toString();					singleTile["height"] = int(tile["height"]);					singleTile["order"] = int(tile["map-order"]);					mapTiles.push(singleTile);				}								singleMap["name"] = map["name"].toString();				singleMap["height"] = int(map["height"]);				singleMap["width"] = int(map["width"]);				singleMap["tiles"] = mapTiles;								maps.push(singleMap);			}						Config.setValue("maps", maps);			var nextStateEvent:StateEvent = new StateEvent(StateEvent.COMPLETE);			var w:WelcomeScreen = new WelcomeScreen(currentStage);			nextStateEvent.setNextState(w);			dispatchEvent(nextStateEvent);			/*			var nextStateEvent:StateEvent = new StateEvent(StateEvent.COMPLETE);			var b:Battle = new Battle(currentStage);			nextStateEvent.setNextState(b);			dispatchEvent(nextStateEvent);			*/		}					}}