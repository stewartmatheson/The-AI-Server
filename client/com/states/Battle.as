﻿package com.states {
	
	import flash.display.*;
	import com.models.*;
	import com.factories.*;
	import com.lib.State;
	import com.controllers.*;
	import com.views.*;
	import com.events.*;
	
	public class Battle extends State {

		private var gameMap:Map;
		private var humanController:PlayerBattleController;
		private var aiController:AIBattleController = new AIBattleController();
		private var players:Array;
		private var turns:Array;
		private var hud:BattleHud;
		public function Battle(s:Stage) { super(s); }
		public function setMap(m:Map):void { gameMap = m; }
		public function getMap():Map { return gameMap; }
		public function getPlayerController():PlayerBattleController { return humanController; }
		public function setPlayerController(c:PlayerBattleController):void { humanController = c; }
		public function setBattleHud(h:BattleHud):void { hud = h; addView(hud); }
		public function getHud():BattleHud { return hud; }
		public function getSelectedUnit():Unit { return getCurrentTurn().getSelectedUnit(); }
		public function getCurrentTurn():Turn { return turns[turns.length - 1]; }
		
		public function addPlayer(p:Player):void
		{
			if(players == null)
				players = new Array();
			players.push(p);
		}
		
		public function ready(e:StateEvent):void
		{
			currentStage.focus = currentStage;
			nextTurn();
		}
		
		public function nextTurn():void
		{
			var currentPlayer:Player;
			var currentTurn:Turn;
			
			if(turns == null)
			{
				turns = new Array();
				currentPlayer = players[0];
			}
			else
			{
				if(!(turns.length & 1))
				 	currentPlayer = players[1];
				else
					currentPlayer = players[0];
			}
			currentTurn = new Turn(currentPlayer);
			currentTurn.selectNextUnit();
			turns.push(currentTurn);
		}
		
		public function moveComplete(e:UnitEvent):void
		{
			var completeMove:Move = Moves.create(e.currentTarget as Unit, 
												 e.getStartLocation(), 
												 e.getTargetLocation(), 
												 getCurrentTurn()
												 );
			getCurrentTurn().addCompleteMove(completeMove);
			getCurrentTurn().selectNextUnit();
		}
		
		public function turnComplete(e:PlayerEvent):void
		{
			trace("turn complete battle state");
		}
	}
}