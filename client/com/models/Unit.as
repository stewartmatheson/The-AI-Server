package com.models {
	
	import com.lib.Model;
	import com.models.Player;
	import com.geom.MapPoint;
	import com.events.UnitEvent;
	
	public class Unit extends Model {
		
		private var unitType:String;
		private var attack:int;
		private var defence:int;
		private var movement:int;
		private var owner:Player;
		private var currentLocation:MapPoint;
		private var movesLeftThisTurn;
		private var startLocation;
		private var id:int;
		private var playerType:String
	
		public function Unit(t:String, a:int, d:int, m:int, i:int, pt:String)
		{
		  	unitType = t;
		  	attack = a;
		  	defence = d;
		  	movement = m;
			movesLeftThisTurn = movement;
			id = i;
			playerType = pt;
		}
		
		public function setLocation(m:MapPoint)
		{
			if(currentLocation == null)
				startLocation = m;
			else
			{
				if(!m.equals(currentLocation))
					movesLeftThisTurn--;
			}
			
			currentLocation = m;
			var e:UnitEvent = new UnitEvent(UnitEvent.MOVEMENT);
			e.setTargetLocation(currentLocation);
			dispatchEvent(e);
			
			if(movesLeftThisTurn <= 0)
			{
				var movementCompleteEvent:UnitEvent = new UnitEvent(UnitEvent.MOVEMENT_COMPLETE);
				movementCompleteEvent.setStartLocation(startLocation);
				movementCompleteEvent.setTargetLocation(currentLocation);
				startLocation = m;
				movesLeftThisTurn = movement;
				dispatchEvent(movementCompleteEvent);
			}
		}
		
		public function setOwner(o:Player) { owner = o; }
		public function getOwner():Player { return owner; }
		public function getType():String { return unitType; }
		public function getMapPoint():MapPoint { return currentLocation; }
		public function getAttack():int { return attack;}
		public function getDefence():int { return defence;}
		public function getMovement():int { return movement;}
		public function getMovementLeft():int { return movesLeftThisTurn; }
		public function getId():int { return id; }
		public function getPlayerType():String { return playerType; }
	}
	
}