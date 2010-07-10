package com.controllers {
	
	import com.lib.Controller;
	import com.states.Battle;
	
	public class AIBattleController extends Controller {
		
		private var battleState:Battle;
		public function AIBattleController(b:Battle) { battleState = b; }
		override public function activate():void
		{
			super.activate();
			trace("AI controller active");
		}
	}
}