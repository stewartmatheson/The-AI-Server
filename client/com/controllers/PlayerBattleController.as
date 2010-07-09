package com.controllers {
	
	import flash.events.*;
	import com.states.Battle;
	import com.models.Tile;	
	import com.geom.MapPoint;
	import com.events.UnitEvent;
	import com.lib.Controller;
	
	public class PlayerBattleController extends Controller {
		private var battleState:Battle;
		
		public function PlayerBattleController(b:Battle) { battleState = b; }
		public function keyPressed(e:KeyboardEvent):void 
		{
			if(!active)
				return;
			
			switch(e.keyCode)
			{
				case 57 : //topright
					attemptMove(0, -1);
				break;
				
				case 56 : //top
					attemptMove(-1, -1);
				break;
				
				case 52 : //left
					attemptMove(-1, +1);
				break;
				
				case 55 : //topleft
					attemptMove(-1, 0);
				break;
				
				case 49 : //downleft
					attemptMove(0, +1);
				break;
				
				case 50 : //down
					attemptMove(1, 1);
				break;
				
				case 51 : //downright
					attemptMove(+1, 0);
				break;
				
				case 54 : //right
					attemptMove(+1, -1);
				break;
			}
		}
		
		public function mouseOverTile(e:MouseEvent):void
		{
			battleState.getHud().displayTileStatus(e.currentTarget.getModel());
		}
		
		public function mouseOutTile(e:MouseEvent):void
		{
			battleState.getHud().hideTileStatus();
		}
		
		private function attemptMove(xChagne:Number, yChange:Number):void
		{
			var currentMapLocation:MapPoint = battleState.getSelectedUnit().getMapPoint();
			var newMapPoint:MapPoint = new MapPoint(currentMapLocation.getXPos() + xChagne, 
																				currentMapLocation.getYPos() + yChange);
			
			if(battleState.getMap().canMoveToPoint(newMapPoint))
				battleState.getSelectedUnit().setLocation(newMapPoint);
		}
	}
	
}