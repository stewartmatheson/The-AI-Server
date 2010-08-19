package com.controllers {
	
	import com.lib.Controller;
	import com.states.Battle;
	import com.events.PlayerEvent;
	
	public class AIBattleController extends Controller {
		
		private var battleState:Battle;
		public function AIBattleController(b:Battle) { battleState = b; }
		override public function activate():void
		{
			super.activate();
			trace("AI controller active");
			
			//var endTurnEvent:PlayerEvent = new PlayerEvent(PlayerEvent.TURN_COMPLETE);
			//battleState.getCurrentTurn().dispatchEvent(endTurnEvent);
			
		}
		
		public function createMoves():void
		{
			
			
		}
	}
}