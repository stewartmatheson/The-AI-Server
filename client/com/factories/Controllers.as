package com.factories {
	
	import com.controllers.*;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import com.states.Battle;
	import com.models.Player;
	
	public class Controllers {

		public static function playerBattleController(currentStage:Stage, currentState:Battle, currentPlayer:Player):PlayerBattleController
		{
			var p:PlayerBattleController = new PlayerBattleController(currentState);
			currentStage.addEventListener(KeyboardEvent.KEY_DOWN, p.keyPressed);
			p.setPlayer(currentPlayer);
			return p;
		}
		
		public static function aiBattleController(currentStage:Stage, currentState:Battle, currentPlayer:Player):AIBattleController
		{
			var p:AIBattleController = new AIBattleController(currentState);
			p.setPlayer(currentPlayer);
			return p;
		}

	}
	
}