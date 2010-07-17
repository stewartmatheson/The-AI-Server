package com.views {
	
	import flash.display.MovieClip; 
	import com.models.RallyPoint;

	public class RallyPointView extends MovieClip {
		
		private var model:RallyPoint;
		public function setModel(m:RallyPoint):void { model = m; }
		public function getModel():RallyPoint { return model; }
	}
}