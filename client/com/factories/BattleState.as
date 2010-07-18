﻿package com.factories {
	
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
	
	public class BattleState {
		
		public static function create(mapData:Array, currentStage:Stage):Battle 
		{
			var b:Battle = new Battle(currentStage);
			b.display();
			b.setBattleHud(Huds.battle());
			b.addEventListener(StateEvent.READY, b.ready);

			//create the players
			var firstPlayer:Player = Players.create(new MapPoint(0, 0));
			var secondPlayer:Player = Players.create(new MapPoint(mapData["width"] - 1, mapData["height"] - 1));
			
			//add the controllers for each player to the battle state.
			var playerController:PlayerBattleController = Controllers.playerBattleController(currentStage, b, firstPlayer);
			b.addController(playerController);
			b.addController(Controllers.aiBattleController(currentStage, b, secondPlayer));
			
			//create the map for the battle
			var m:Map = Maps.createModel(mapData);
			var mapView:MapView = Maps.createView(m, playerController);
			b.setMap(m);
			b.addView(mapView);
			
			
			//add the units for the players
			var currentUnitId:int = 1;
			
			var redTransform:ColorTransform = new ColorTransform();
			redTransform.blueOffset = 0;
			redTransform.redOffset = 100;
			redTransform.greenOffset = 0;
			
			var blueTransform:ColorTransform = new ColorTransform();
			blueTransform.blueOffset = 100;
			blueTransform.redOffset = 0;
			blueTransform.greenOffset = 0;

			
			for(var j:int = 0; j < mapData["units"].length; j++)
			{
				//create the unit for the first player
				var currentUnit:Unit = Units.createModel(mapData["units"][j], firstPlayer, b, currentUnitId);
				currentUnitId++;
				var currentUnitView:UnitView = Units.createView(currentUnit, mapView, currentStage, firstPlayer, b, blueTransform);
				
				//create the same unit for the second player
				currentUnit = Units.createModel(mapData["units"][j], secondPlayer, b, currentUnitId);
				currentUnitId++;
				currentUnitView = Units.createView(currentUnit, mapView, currentStage, secondPlayer, b, redTransform);
			}

			b.addPlayer(firstPlayer);
			b.addPlayer(secondPlayer);
			return b;
		}
	}
}