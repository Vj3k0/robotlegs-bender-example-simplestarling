package robotlegs.bender.example.simplestarling
{
	import robotlegs.bender.example.simplestarling.config.GameConfig;
	import robotlegs.bender.example.simplestarling.views.MainView;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import robotlegs.bender.bundles.starling.StarlingBundle;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	
	import starling.core.Starling;
	
	[SWF(width="320", height="480", frameRate="60", backgroundColor="#222222")]
	public class RSDemo extends Sprite
	{
		private var _starling:Starling;
		private var _context:IContext;
		
		public function RSDemo()
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			_starling = new Starling(MainView, stage);
			
			_context = new Context();
			_context.extend(StarlingBundle).configure(GameConfig, _starling.stage);
			
			_starling.start();
			stage.stage3Ds[0].addEventListener(Event.CONTEXT3D_CREATE, onContextCreated);
		}
		
		private function onContextCreated(event:Event):void
		{
			if (Starling.context.driverInfo.toLowerCase().indexOf("software") != -1)
				Starling.current.nativeStage.frameRate = 30;
		}
	}
}