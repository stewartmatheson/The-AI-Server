package com.models {
	
	import com.models.Player;
	import com.events.*;
	import com.lib.Model;
	
	public class Turn extends Model {
		
		private var activePlayer:Player;
		private var selectedUnit:Unit;
		private var moves:Array;
		
		public function Turn(p:Player) 
		{
			activePlayer = p; 
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
		public function addCompleteMove(m:Move):void 
		{ 
			if(moves == null)
				moves = new Array();
			moves.push(m);
		}
	}
}