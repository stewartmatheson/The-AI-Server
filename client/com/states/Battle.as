package com.states {
	
	import flash.display.*;
	import com.models.*;
	import com.factories.*;
	import com.lib.*;
	import com.controllers.*;
	import com.views.*;
	import com.events.*;
	import flash.events.Event;
	
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
		public function getBattleHud():BattleHud { return hud; }
		public function getSelectedUnit():Unit { return getCurrentTurn().getSelectedUnit(); }
		public function getCurrentTurn():Turn { return turns[turns.length - 1]; }
		public function currentTurnCount():int { return turns.length + 1 }
		public function getPlayers():Array { return players; }
		
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
		
		public function nextTurn(turnData:Object = null):void
		{
			trace(turnData);
			getCurrentController().deactivate();
			var currentTurn:Turn = Turns.create(this);
			currentTurn.selectNextUnit();
			turns.push(currentTurn);
			getCurrentController().activate();
		}
		
		public function moveComplete(e:UnitEvent):void
		{
			var completeMove:Move = Moves.create(e.currentTarget as Unit, e.getStartLocation(), e.getTargetLocation(), getCurrentTurn());
			getCurrentTurn().addCompleteMove(completeMove);
			getCurrentTurn().selectNextUnit();
		}
		
		public function turnComplete(e:Event):void
		{
			getCurrentTurn().saveOnServer();
			hud.displayWorkingStatus();
		}
		
		public function nextTurnReady(e:Event):void
		{
			hud.hideWorkingStatus();
			nextTurn();
		}
		
		public function getCurrentController():Controller
		{
			if(!(turns.length & 1))
				return controllers[1];
			else
				return controllers[0];
		}
	}
}