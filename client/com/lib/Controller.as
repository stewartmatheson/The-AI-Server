package com.lib {
	
	public class Controller {
		
		protected var active:Boolean = false;
		
		public function Controller() { }
		public function activate():void { active = true; }
		public function deactivate():void { active = false; }
	}
	
}