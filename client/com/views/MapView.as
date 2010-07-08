﻿package com.views {		import flash.display.MovieClip;	import flash.events.Event;	import flash.display.StageAlign;	import flash.display.StageScaleMode;	import com.models.*;	import com.geom.MapPoint;		public class MapView extends MovieClip 	{		private var tiles:Array;		private var mapModel:Map;		public function MapView(m:Map)		{ 			mapModel = m;			addEventListener(Event.ADDED_TO_STAGE, addedToStage); 		}			public function setTiles(t:Array):void		{		    tiles = t;			var cols:int = 0;			var rows:int = 0;					    for(var i:int; i < tiles.length; i++)		    {		        addChild(tiles[i]);				tiles[i].x = (tiles[i].width / 2) * cols - ((tiles[i].width / 2) * rows) + 																	(((mapModel.getHeight() - 1) * tiles[i].width) / 2); 								tiles[i].y = rows * 17 + cols * 18 + (mapModel.getTiles()[i].getHeight() * 5);				cols++;				if(cols >= mapModel.getWidth())				{					rows++;					cols = 0;				}		    }		}				function resizeHandler(e:Event):void		{			centerToStage();		}				function addedToStage(e:Event):void		{			stage.align = StageAlign.TOP_LEFT;			stage.scaleMode = StageScaleMode.NO_SCALE;						centerToStage();			stage.addEventListener(Event.RESIZE, resizeHandler);		}				function centerToStage():void		{						x = (stage.stageWidth / 2) - (width / 2 );			y = (stage.stageHeight / 2) - (height / 2);			//x = 0; y = 0;		}				public function getTiles():Array { return tiles; }		public function getModel():Map { return mapModel; }				public function getTileAtPoint(mapP:MapPoint):TileView		{			var t:Tile = mapModel.getTileAtPoint(mapP);			return tiles[t.getMapOrder() - 1];		}	}	}