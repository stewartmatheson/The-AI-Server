package com.events {
	
	import flash.events.Event;
	
	public class PlayerEvent extends flash.events.Event {
		
		public static const TURN_COMPLETE:String = "turn_complete";
		public static const READY:String = "ready";
		
		public function PlayerEvent(command:String)
		{
			super(command);
		}
	}
}