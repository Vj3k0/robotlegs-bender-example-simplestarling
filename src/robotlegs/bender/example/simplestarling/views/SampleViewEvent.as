package robotlegs.bender.example.simplestarling.views
{
	import starling.events.Event;
	
	public class SampleViewEvent extends Event
	{
		public static const VIEW_TRIGGERED:String = "robotlegs.bender.example.simplestarling.view.SampleViewEvent.VIEW_TRIGGERED";
		
		public function SampleViewEvent(type:String)
		{
			super(type);
		}
	}
}