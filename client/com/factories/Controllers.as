﻿package com.factories {		import com.controllers.PlayerBattleController	import flash.display.Stage;	import flash.events.KeyboardEvent;	import com.states.Battle;		public class Controllers {		public static function playerBattleController(currentStage:Stage, currentState:Battle):PlayerBattleController		{			var p:PlayerBattleController = new PlayerBattleController(currentState);			currentStage.addEventListener(KeyboardEvent.KEY_DOWN, p.keyPressed)			return p;		}	}	}