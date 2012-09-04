package robotlegs.bender.example.simplestarling.views
{
	import flash.display.BitmapData;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class SampleView extends Sprite implements ISampleView
	{
		private var _image:Image;
		
		public function SampleView()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			
			init();
		}
		
		private function onRemovedFromStage(event:Event):void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			kill();
		}
		
		
		protected function init():void
		{
			_image = new Image(Texture.fromBitmapData(drawRandomColoredRectangle()));
			_image.addEventListener(TouchEvent.TOUCH, handleTouch);
			addChild(_image);
		}
		
		protected function kill():void
		{
			_image.removeEventListener(TouchEvent.TOUCH, handleTouch);
			removeChild(_image, true);
		}
		
		private function drawRandomColoredRectangle():BitmapData
		{
			var gfx:flash.display.Sprite = new flash.display.Sprite();
			gfx.graphics.beginFill(Math.random() * 0xFFFFFF);
			gfx.graphics.drawRect(0, 0, 400, 300);
			gfx.graphics.endFill();
			var bd:BitmapData = new BitmapData(400, 300, true, 0xFF0000);
			bd.draw(gfx);
			return bd;
		}
		
		private function handleTouch(event:TouchEvent):void
		{
			if (Touch(event.touches[0]).phase == TouchPhase.BEGAN)
				dispatchEvent(new SampleViewEvent(SampleViewEvent.VIEW_TRIGGERED));
		}
		
		public function changeColor():void {
			_image.texture = Texture.fromBitmapData(drawRandomColoredRectangle());
		}

	}
}