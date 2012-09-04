package robotlegs.bender.example.simplestarling.commands
{
	import robotlegs.bender.example.simplestarling.events.SampleEvent;
	
	import flash.events.IEventDispatcher;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class SampleCommand extends Command
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		override public function execute():void
		{
			eventDispatcher.dispatchEvent(new SampleEvent(SampleEvent.UPDATE_COLOR));
		}
		
	}
}