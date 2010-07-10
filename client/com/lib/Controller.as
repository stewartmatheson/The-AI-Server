package com.lib {
	
	import com.models.Player;
	
	public class Controller {
		
		protected var active:Boolean = false;
		protected var currentPlayer:Player;
		
		public function Controller() { }
		public function activate():void { active = true; }
		public function deactivate():void { active = false; }
		public function setPlayer(p:Player):void { currentPlayer = p; }
		public function getPlayer():Player { return currentPlayer; } 
	}
	
}