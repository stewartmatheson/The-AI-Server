﻿package com.factories {		import com.states.Battle;	import flash.display.Stage;	import com.models.*;	import com.views.*;	import flash.events.MouseEvent;	import com.controllers.PlayerBattleController;	import com.factories.*;	import com.events.StateEvent;	import com.factories.Controllers;		public class BattleState {				public static function create(mapData:Array, currentStage:Stage):Battle 		{			var b:Battle = new Battle(currentStage);			b.setPlayerController(Controllers.playerBattleController(currentStage, b));			b.display();			b.setBattleHud(Huds.battle());			b.addEventListener(StateEvent.READY, b.ready);						var m:Map = Maps.createModel(mapData);			var mapView:MapView = Maps.createView(m, b.getPlayerController());			b.setMap(m);			b.addView(mapView);						//now create the player controller and bind events to it			var playerController = b.getPlayerController();						var firstPlayer:Player = Players.create(1, mapData);			var secondPlayer:Player = Players.create(2, mapData);						for(var j:int = 0; j < mapData["units"].length; j++)			{				var currentUnit:Unit = Units.createModel(mapData["units"][j], firstPlayer, b);				var currentUnitView:UnitView = Units.createView(currentUnit, mapView, currentStage, firstPlayer, b);								currentUnit = Units.createModel(mapData["units"][j], secondPlayer, b);				currentUnitView = Units.createView(currentUnit, mapView, currentStage, secondPlayer, b);			}			b.addPlayer(firstPlayer);			b.addPlayer(secondPlayer);			return b;		}	}}