package com.lib {

	import flash.events.*;
	import flash.net.*;
	import com.Config;

	public class Model extends EventDispatcher {
		private var saveLoader:URLLoader;
		protected var restPath:String = "";
		 
		public function saveOnServer():void
		{
			if(!getPostData())
				throw new Error("No post data to save the model");
			
			var saveLoaderRequest:URLRequest = new URLRequest("http://" + Config.getValue("server_base_uri") + "/" + restPath + ".xml");
			saveLoaderRequest.method = URLRequestMethod.POST;	
			saveLoaderRequest.data = getPostData();
			saveLoader = new URLLoader();
			saveLoader.addEventListener(Event.COMPLETE, saveRequestDone);
			saveLoader.load(saveLoaderRequest);
		}
		
		private function saveRequestDone(e:Event):void { dispatchEvent(e); }		
		protected function getPostData():URLVariables { return null; }
	}	
}