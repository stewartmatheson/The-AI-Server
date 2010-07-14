package com.models {
	
	import com.models.Player;
	import com.events.*;
	import com.lib.Model;
	import flash.net.URLVariables;
	import com.Config;
	
	public class Turn extends Model {
		
		private var activePlayer:Player;
		private var selectedUnit:Unit;
		private var moves:Array;
		
		public function Turn(p:Player) 
		{
			activePlayer = p; 
			restPath = "turns";
			moves = new Array();
		}
		
		public function selectNextUnit():void
		{
			if(selectedUnit)
			{
				var deselectEvent:UnitEvent = new UnitEvent(UnitEvent.DESELECTED);
				selectedUnit.dispatchEvent(deselectEvent);
			}
			
			var movedFunction:Function = function(item:Unit, index:int, array:Array):Boolean
			{
				if(moves == null)
					return true;
				
				for(var i:int = 0; i < moves.length; i++)
				{
					if(moves[i].getUnit() == item)
						return false;
				}
				
				return true;
			}
			
			var unitsToBeMoved:Array = activePlayer.getUnits().filter(movedFunction);
			if(unitsToBeMoved.length > 0)
			{
				var e:UnitEvent = new UnitEvent(UnitEvent.SELECTED);
				selectedUnit = unitsToBeMoved[0];
				unitsToBeMoved[0].dispatchEvent(e);
			}
			else
			{
				var endTurnEvent:PlayerEvent = new PlayerEvent(PlayerEvent.TURN_COMPLETE);
				dispatchEvent(endTurnEvent);
			}
		}
		public function getSelectedUnit():Unit { return selectedUnit; }
		public function addCompleteMove(m:Move):void { moves.push(m); }
		
		override protected function getPostData():URLVariables 
		{ 
			var postData:URLVariables = new URLVariables();
			var matchData:Array = Config.getValue("currentMatch") as Array;
			postData["turn[match_id]"] = matchData["id"];
			for(var i:int = 0; i < moves.length; i++) 
			{
				postData["moves[" + i.toString() + "][type]"] = moves[i].getUnit();
				postData["moves[" + i.toString() + "][unit_id]"] = moves[i].getUnit().getId();
			}
			
			return postData;
		}
	}
}