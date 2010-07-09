package com.controllers {
	
	import com.lib.Controller;
	
	public class AIBattleController extends Controller {
		
		public function AIBattleController() { }
		
		override public function activate():void
		{
			super.activate();
			trace("AI controller active");
		}
	
	}
	
}