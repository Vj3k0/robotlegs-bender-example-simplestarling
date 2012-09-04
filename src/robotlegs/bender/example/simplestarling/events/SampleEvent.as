package robotlegs.bender.example.simplestarling.events
{
	import flash.events.Event;
	
	public class SampleEvent extends Event
	{
		public static const ACTIVATED:String = "robotlegs.bender.example.simplestarling.events.SampleEvent.ACTIVATED";
		
		public static const UPDATE_COLOR:String = "robotlegs.bender.example.simplestarling.events.SampleEvent.UPDATE_COLOR";
		
		public static const SETUP_COMPLETE:String = "robotlegs.bender.example.simplestarling.events.SampleEvent.SETUP_COMPLETE";
		
		public function SampleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}