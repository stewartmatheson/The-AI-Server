﻿package com.geom {
	
	public class MapPoint {
		
		private var xpos:int;
		private var ypos:int;
		
		public function MapPoint(xp:int, yp:int) { xpos = xp; ypos = yp; } 
		public function getXPos():int { return xpos; }
		public function getYPos():int { return ypos; } 
		public function equals(m:MapPoint):Boolean
		{
			if(m.getXPos() == xpos && m.getYPos() == ypos)
				return true;
			else
				return false;
		} 

	}
	
}