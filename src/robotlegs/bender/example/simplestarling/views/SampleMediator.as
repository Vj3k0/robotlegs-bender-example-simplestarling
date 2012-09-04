package robotlegs.bender.example.simplestarling.views
{
	import robotlegs.bender.example.simplestarling.events.SampleEvent;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class SampleMediator extends Mediator
	{
		[Inject]
		public var view:ISampleView;
		
		override public function initialize():void
		{
			SampleView(view).addEventListener(SampleViewEvent.VIEW_TRIGGERED, handleTriggered);
			addContextListener(SampleEvent.UPDATE_COLOR, onUpdateColor);
		}
		
		override public function destroy():void
		{
			SampleView(view).removeEventListener(SampleViewEvent.VIEW_TRIGGERED, handleTriggered);
			removeContextListener(SampleEvent.UPDATE_COLOR, onUpdateColor);
		}
		
		private function handleTriggered(event:SampleViewEvent):void
		{
			dispatch(new SampleEvent(SampleEvent.ACTIVATED));
		}
		
		private function onUpdateColor(event:SampleEvent):void
		{
			view.changeColor();
		}
		
	}
}