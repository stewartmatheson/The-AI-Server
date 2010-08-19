package com.factories {
	import com.models.Turn;
	import com.states.Battle;
	import com.events.PlayerEvent;
	import flash.events.Event;
	
	public class Turns {
		public static function create(battleState:Battle):Turn
		{
			var t:Turn = new Turn(battleState.getCurrentController().getPlayer(), battleState.currentTurnCount());
			t.addEventListener(PlayerEvent.TURN_COMPLETE, battleState.turnComplete);
			t.addEventListener(Event.COMPLETE, battleState.nextTurnReady); 
			return t;
		}
	}
}