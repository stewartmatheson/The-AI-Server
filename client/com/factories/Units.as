package com.factories {
	
	import com.models.*;
	import com.views.UnitView;
	import com.views.units.*;
	import com.events.UnitEvent;
	import com.views.MapView;
	import flash.display.Stage;
	import com.states.Battle;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	
	public class Units {
		
		/*
		public static function createModel(unitData:Array, owner:Player, currentState:Battle, id:int):Unit
		{
			var u:Unit = new Unit(unitData["type"],
								  unitData["attack"],
								  unitData["defence"],
								  unitData["movement"],
								  id);
								
			u.setOwner(owner);
			owner.addUnit(u);
			u.setLocation(owner.getStartPoint());
			u.addEventListener(UnitEvent.MOVEMENT_COMPLETE, currentState.moveComplete);
			return u;
		}
		*/	
		
		public static function createModel(unitData:Array, humanPlayer:Player, aiPlayer:Player, currentState:Battle):Unit
		{
			var u:Unit = new Unit(unitData["type"],
								  unitData["attack"],
								  unitData["defence"],
								  unitData["movement"],
								  unitData["id"],
								  unitData["player"]);
								
			if(unitData["player"] == "AI")
			{
				u.setOwner(aiPlayer);
				aiPlayer.addUnit(u);
			}
			else
			{
				u.setOwner(humanPlayer);
				humanPlayer.addUnit(u);
			}
			
			u.addEventListener(UnitEvent.MOVEMENT_COMPLETE, currentState.moveComplete);
			return u;
		}
		
		
		
		public static function createView(u:Unit, mV:MapView, currentStage:Stage, b:Battle):UnitView
		{
			
			var transform:ColorTransform = new ColorTransform();
			transform.blueOffset = 0;
			transform.redOffset = 100;
			transform.greenOffset = 0;
			
			if(u.getPlayerType() == "AI")
			{
				transform.blueOffset = 100;
				transform.redOffset = 0;
			}			
			
			var currentView:UnitView;
			switch(u.getType())
			{
				case "Infantry" :
					currentView = new Infantry();
				break;
				
				case "Armor" :
					currentView = new Armor();
				break;
				
				case "Artillery" :
					currentView = new Artillery();
				break;
			}

			u.addEventListener(UnitEvent.SELECTED, currentView.selected);
			u.addEventListener(UnitEvent.SELECTED, b.getBattleHud().displayUnitStatus);
			u.addEventListener(UnitEvent.MOVEMENT, b.getBattleHud().displayUnitStatus);
			u.addEventListener(UnitEvent.MOVEMENT, currentView.moved);
			u.addEventListener(UnitEvent.DESELECTED, currentView.deselected);
			mV.addEventListener(Event.ADDED_TO_STAGE, currentView.moved);
			currentStage.addEventListener(Event.RESIZE, currentView.moved);
			currentView.setModel(u);
			currentView.setMapView(mV);
			currentView.setColorTransform(transform);
			u.setLocation(u.getOwner().getStartPoint());
			b.addView(currentView);
			return currentView;
		}
	}
}