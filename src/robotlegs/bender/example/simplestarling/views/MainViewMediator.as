package robotlegs.bender.example.simplestarling.views
{
	import robotlegs.bender.example.simplestarling.events.SampleEvent;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class MainViewMediator extends Mediator
	{
		[Inject]
		public var view:MainView;
		
		override public function initialize():void
		{
			view.addEventListener(MainViewEvent.INITIALIZED, onInitialized);
		}
		
		override public function destroy():void
		{
			view.removeEventListener(MainViewEvent.INITIALIZED, onInitialized);
		}
		
		private function onInitialized(event:MainViewEvent):void
		{
			dispatch(new SampleEvent(SampleEvent.SETUP_COMPLETE));
		}
		
	}
}