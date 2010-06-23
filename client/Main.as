package  {
    import flash.display.*;
    import com.GameStateContext;
	
	public class Main extends MovieClip
	{
		// Constants:
		// Public Properties:
		// Private Properties:
	
		// Initialization:
		public function Main()
		{
		    var g:GameStateContext = new GameStateContext(getStage()); 
		}
		
		private function getStage():Stage
		{
		    var myMC:MovieClip = new MovieClip();
            addChild(myMC);
            var _stage:Stage = myMC.stage;
            return _stage;
		}   
		// Public Methods:
		// Protected Methods:
	}
}