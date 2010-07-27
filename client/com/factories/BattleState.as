package com.factories {
	
	import com.states.Battle;
	import flash.display.Stage;
	import com.models.*;
	import com.views.*;
	import flash.events.MouseEvent;
	import com.controllers.PlayerBattleController;
	import com.factories.*;
	import com.events.StateEvent;
	import com.factories.Controllers;
	import com.geom.MapPoint;
	import flash.geom.ColorTransform;
	import com.Config;
	
	public class BattleState {
		
		public static function create(mapData:Array, currentStage:Stage):Battle 
		{
			var b:Battle = new Battle(currentStage);
			b.display();
			b.setBattleHud(Huds.battle());
			b.addEventListener(StateEvent.READY, b.ready);

			//create the players
			var humanPlayer:Player = Players.create(new MapPoint(0, 0));
			var aiPlayer:Player = Players.create(new MapPoint(mapData["width"] - 1, mapData["height"] - 1));
			
			//add the controllers for each player to the battle state.
			var playerController:PlayerBattleController = Controllers.playerBattleController(currentStage, b, humanPlayer);
			b.addController(playerController);
			b.addController(Controllers.aiBattleController(currentStage, b, aiPlayer));
			
			//create the map for the battle
			var m:Map = Maps.createModel(mapData);
			var mapView:MapView = Maps.createView(m, playerController);
			b.setMap(m);
			b.addView(mapView);
			
			/*
			for(var j:int = 0; j < mapData["units"].length; j++)
			{
				//create the unit for the first player
				var currentUnit:Unit = Units.createModel(mapData["units"][j], humanPlayer, b, currentUnitId);
				currentUnitId++;
				var currentUnitView:UnitView = Units.createView(currentUnit, mapView, currentStage, humanPlayer, b, blueTransform);
				
				//create the same unit for the second player
				currentUnit = Units.createModel(mapData["units"][j], aiPlayer, b, currentUnitId);
				currentUnitId++;
				currentUnitView = Units.createView(currentUnit, mapView, currentStage, aiPlayer, b, redTransform);
			}
			*/
			
			var matchData:Array = Config.getValue("currentMatch") as Array;
			var currentUnit:Unit;
			var currentUnitView:UnitView;
			
			for(var j:int = 0; j < matchData["match_units"].length; j++)
			{
				currentUnit = Units.createModel(matchData["match_units"][j], humanPlayer, aiPlayer, b);
				currentUnitView = Units.createView(currentUnit, mapView, currentStage, b);
			}
			
			b.addPlayer(humanPlayer);
			b.addPlayer(aiPlayer);
			return b;
		}
	}
}