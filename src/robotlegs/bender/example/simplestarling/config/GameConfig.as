package robotlegs.bender.example.simplestarling.config
{
	import robotlegs.bender.example.simplestarling.commands.SampleCommand;
	import robotlegs.bender.example.simplestarling.commands.SetupCommand;
	import robotlegs.bender.example.simplestarling.events.SampleEvent;
	import robotlegs.bender.example.simplestarling.views.ISampleView;
	import robotlegs.bender.example.simplestarling.views.MainView;
	import robotlegs.bender.example.simplestarling.views.MainViewMediator;
	import robotlegs.bender.example.simplestarling.views.SampleMediator;
	import robotlegs.bender.example.simplestarling.views.SampleView;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IStarlingMediatorMap;
	import robotlegs.bender.extensions.viewManager.impl.StarlingViewManager;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.LogLevel;
	
	import starling.display.DisplayObjectContainer;

	public class GameConfig
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject]
		public var context:IContext;

		[Inject]
		public var mediatorMap:IStarlingMediatorMap;
		
		[Inject]
		public var commandMap:IEventCommandMap;
		
		[Inject]
		public var injector:Injector;
		
		[Inject]
		public var contextView:DisplayObjectContainer;
		
		//---------------------------------------------------------------
		// Configuration
		//---------------------------------------------------------------
		
		[PostConstruct]
		public function init():void
		{
			context.logLevel = LogLevel.DEBUG;
			
			commandMap
			.map(SampleEvent.SETUP_COMPLETE)
				.toCommand(SetupCommand);
			commandMap
			.map(SampleEvent.ACTIVATED, SampleEvent)
				.toCommand(SampleCommand);
			
			mediatorMap
				.map(ISampleView)
				.toMediator(SampleMediator);
			mediatorMap
				.map(MainView)
				.toMediator(MainViewMediator);
				
		}
	}
}