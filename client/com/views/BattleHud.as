package com.views {
	
	import flash.display.MovieClip;
	import com.views.*;
	import com.models.*;
	import com.events.UnitEvent;
	
	public class BattleHud extends MovieClip {
		
		private var tileInfo:TileInfoBubble;
		private var unitInfo:UnitInfoBubble;
		private var workingDisplay:WorkingView;
		private var BORDER:int = 20;
		
		public function BattleHud() { }
		
		public function setTileInfoBubble(t:TileInfoBubble)
		{ 
			tileInfo = t;
			tileInfo.visible = false; 
			addChild(tileInfo);
		}
		
		public function setUnitInfoBubble(t:UnitInfoBubble) 
		{
			unitInfo = t; 
			unitInfo.visible = false;
			addChild(unitInfo); 
		}

		public function setWorkingDisplay(d:WorkingView) 
		{
			workingDisplay = d; 
			workingDisplay.visible = false;
			addChild(workingDisplay);
		}
		
		public function displayUnitStatus(e:UnitEvent):void
		{
			var u:Unit = e.currentTarget as Unit;
			unitInfo.y = stage.stageHeight - unitInfo.height - BORDER;
			unitInfo.x = BORDER;
			unitInfo.visible = true;
			unitInfo.unitName.text = u.getType();
			unitInfo.attack.text = u.getAttack().toString();
			unitInfo.defence.text = u.getDefence().toString();
			unitInfo.movementRate.text = u.getMovement().toString();
			unitInfo.movementLeft.text = u.getMovementLeft().toString();
		}
		
		public function displayTileStatus(t:Tile):void
		{
			tileInfo.title.text = t.getType();
			tileInfo.body.text = "";
			tileInfo.titleRight.text = t.getMapPoint().getXPos().toString() + ", " + t.getMapPoint().getYPos().toString();
			tileInfo.visible = true;
		}
		
		public function hideTileStatus():void {  tileInfo.visible = false; }
		
		public function displayWorkingStatus():void 
		{
			workingDisplay.x = (stage.stageWidth / 2) - (workingDisplay.width / 2 );
			workingDisplay.y = (stage.stageHeight / 2) - (workingDisplay.height / 2) - 200;
			workingDisplay.play();
			workingDisplay.visible = true;
		}
		
		public function hideWorkingStatus():void { workingDisplay.visible = false; workingDisplay.stop(); }
	}
	
}