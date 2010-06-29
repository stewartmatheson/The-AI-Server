package com.views {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class MapView extends MovieClip 
	{
		private var tiles:Array;
		private var mapWidth:int;
		private var mapHeight:int;

		public function MapView(h:int, w:int) { mapHeight = h; mapWidth = w; }
	
		public function setTiles(t:Array):void
		{
		    tiles = t;
			var cols:int = 0;
			var rows:int = 0;
			
		    for(var i:int; i < tiles.length; i++)
		    {
		        addChild(tiles[i]);
				tiles[i].x = (tiles[i].width / 2) * cols - ((tiles[i].width / 2) * rows);
				tiles[i].y = rows * 17 + cols * 18;
				
				cols++;
				if(cols >= mapWidth)
				{
					rows++;
					cols = 0;
				}
		    }
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			x = (stage.stageWidth / 2) - (width / 2);
			y = (stage.stageHeight / 2) - (height / 2);
			stage.addEventListener(Event.RESIZE, resizeHandler);
		}
		
		function resizeHandler(e:Event):void
		{
			x = (stage.stageWidth / 2) - (width / 2);
			y = (stage.stageHeight / 2) - (height / 2);
		}
		
		
		public function getTiles():Array { return tiles; }
	}
	
}