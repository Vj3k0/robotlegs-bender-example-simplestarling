package robotlegs.bender.example.simplestarling.views
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class MainView extends Sprite
	{
		public function MainView()
		{
			super();
			
			(stage) ? onAddedToStage() : addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event=null):void
		{
			dispatchEvent(new MainViewEvent(MainViewEvent.INITIALIZED));
		}
	}
}