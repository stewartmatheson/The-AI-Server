﻿package com.states {
	
	import flash.display.*;
	import com.models.*;
	import com.factories.*;
	import com.lib.*;
	import com.controllers.*;
	import com.views.*;
	import com.events.*;
	
	public class Battle extends State {

		private var gameMap:Map;
		private var players:Array;
		private var controllers:Array;
		private var turns:Array;
		private var hud:BattleHud;

		public function Battle(s:Stage)
		{ 
			super(s); 
			turns = new Array();
		}
		
		public function setMap(m:Map):void { gameMap = m; }
		public function getMap():Map { return gameMap; }
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
		
		public function addController(c:Controller):void 
		{
			if(controllers == null)
				controllers = new Array();
			controllers.push(c);	
		}
		
		public function ready(e:StateEvent):void
		{
			currentStage.focus = currentStage;
			nextTurn();
		}
		
		public function nextTurn():void
		{
			getCurrentController().deactivate();
			var currentTurn:Turn = new Turn(getCurrentController().getPlayer());
			currentTurn.addEventListener(PlayerEvent.TURN_COMPLETE, turnComplete);
			currentTurn.selectNextUnit();
			turns.push(currentTurn);
			getCurrentController().activate();
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
			nextTurn();
			trace("next turn hit");
		}
		
		private function getCurrentController():Controller
		{
			if(!(turns.length & 1))
				return controllers[1];
			else
				return controllers[0];
		}
	}
}