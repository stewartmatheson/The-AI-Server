﻿package com.models {		import com.lib.Model;		public class Tile extends Model {				private var type:String;		private var height:int;		private var mapOrder:int;				public function Tile(t:String, h:int, o:int) { type = t; height = h; mapOrder = o; }		public function getHeight():int { return height; }		public function getType():String { return type; }	}	}