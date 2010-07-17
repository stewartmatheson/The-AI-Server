package com.factories {
	
	import com.models.*;
	import com.views.*;
	import flash.display.Stage;
	import com.geom.MapPoint;
	import com.controllers.PlayerBattleController;
	import flash.events.MouseEvent;
	
	public class Maps {
	
		// Public Methods:
		public static function createModel(mapData:Array):Map
		{
			var m:Map = new Map(mapData["width"], mapData["height"]);
			var i:int = 0;
			var cols:int = 0;
			var rows:int = 0;
			
			var currentMapPoint:MapPoint;
			for each(var currentTile:Array in mapData["tiles"])
			{
				currentMapPoint = new MapPoint(cols, rows);
				m.pushBackTile(new Tile(currentTile["type"], currentTile["height"], currentTile["order"], currentMapPoint));
				i++;
				
				cols++;
				if(cols >= m.getWidth())
				{
					rows++;
					cols = 0;
				}
			}
			
			for each(var currentRallyPoint:Array in mapData["rallypoints"])
			{
				m.addRallyPoint(new RallyPoint(new MapPoint(currentRallyPoint["xpos"], currentRallyPoint["ypos"])));
			}
			
			
			return m;
		}
		
		public static function createView(m:Map, playerController:PlayerBattleController):MapView
		{
			var currentMapView:MapView = new MapView(m);
			var tileArray:Array = new Array();
			var currentTileView:TileView;
			for(var i:int = 0; i < m.getTiles().length; i++)
			{

				switch(m.getTiles()[i].getType())
				{
					case "Grass" :
						currentTileView = new GrassTile();
					break;
					
					case "Rock" :
						currentTileView = new RockTile();
					break;
					
					case "Water" :
						currentTileView = new WaterTile();
					break;
				}
				currentTileView.setModel(m.getTiles()[i]);
				currentTileView.addEventListener(MouseEvent.MOUSE_OVER, playerController.mouseOverTile);
				currentTileView.addEventListener(MouseEvent.MOUSE_OUT, playerController.mouseOutTile);
				tileArray.push(currentTileView);
			}
			currentMapView.setTiles(tileArray);
			
			for(var j:int = 0; j < m.getRallyPoints().length; j++)
			{
				var currentRallyPointView:RallyPointView = new RallyPointView();
				currentRallyPointView.setModel(m.getRallyPoints()[j]);
				currentMapView.addRallyPoint(currentRallyPointView);
			}
			
			currentMapView.placeMap();
			
			return currentMapView;
		}
	}
}