package robotlegs.bender.example.simplestarling.views
{
	import starling.events.Event;
	
	public class MainViewEvent extends Event
	{
		public static const INITIALIZED:String = "robotlegs.bender.example.simplestarling.views.MainViewEvent.INITIALIZED";
		
		public function MainViewEvent(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
		}
	}
}