﻿package com.events {
	
	import flash.events.Event;
	import com.lib.State;
	
	public class StateEvent extends flash.events.Event {
		
		public static const COMPLETE:String = "complete";
		public static const READY:String = "ready";
		private var nextState:State;
		
		public function StateEvent(command:String)
		{
			super(command);
		}
		
		public function setNextState(s:State):void
		{
			nextState = s;
		}
		
		public function getNextState():State
		{
			return nextState;
		}
	}
}