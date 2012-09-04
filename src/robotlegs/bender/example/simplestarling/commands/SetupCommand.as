package robotlegs.bender.example.simplestarling.commands
{
	import robotlegs.bender.example.simplestarling.views.SampleView;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	import starling.display.DisplayObjectContainer;
	
	public class SetupCommand extends Command
	{
		[Inject]
		public var contextView:DisplayObjectContainer;
		
		override public function execute():void
		{
			contextView.addChild(new SampleView());
		}
		
	}
}