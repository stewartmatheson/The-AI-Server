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
		
		public static function createView(u:Unit, mV:MapView, currentStage:Stage, p:Player, b:Battle, t:ColorTransform):UnitView
		{
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
			u.addEventListener(UnitEvent.SELECTED, b.getHud().displayUnitStatus);
			u.addEventListener(UnitEvent.MOVEMENT, b.getHud().displayUnitStatus);
			u.addEventListener(UnitEvent.MOVEMENT, currentView.moved);
			u.addEventListener(UnitEvent.DESELECTED, currentView.deselected);
			mV.addEventListener(Event.ADDED_TO_STAGE, currentView.moved);
			currentStage.addEventListener(Event.RESIZE, currentView.moved);
			currentView.setModel(u);
			currentView.setMapView(mV);
			currentView.setColorTransform(t);
			u.setLocation(p.getStartPoint());
			b.addView(currentView);
			return currentView;
		}
	}
}