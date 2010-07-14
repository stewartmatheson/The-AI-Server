﻿package com.factories {
	
	import com.views.*;
	
	public class Huds {
		
		public static function battle():BattleHud
		{
			var b:BattleHud = new BattleHud();
			b.setTileInfoBubble(new TileInfoBubble());
			b.setUnitInfoBubble(new UnitInfoBubble());
			b.setWorkingDisplay(new WorkingView());
			return b;
		}
	}
	
}