package net.projectschedule.gui.view
{
	import flash.events.MouseEvent;
	
	import mx.controls.DateField;
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	import spark.components.supportClasses.SkinnableComponent;
	
	import net.fproject.di.Injector;
	
	[EventHandling(event="creationComplete",handler="module_creationCompleteHandler")]
	
	public class LichDangKy extends SkinnableComponent
	{
		public function LichDangKy()
		{
			Injector.inject(this);
		}
		
		public function module_creationCompleteHandler(event:FlexEvent):void
		{
			var day:Date = new Date;
			tuNgay.selectedDate = day;
			denNgay.selectedDate = day;
		}
		
		public function button1_clickHandler(event:MouseEvent):void
		{
			
		}
		
		[SkinPart(required="true")]
		public var tuNgay:DateField;
		
		[SkinPart(required="true")]
		public var denNgay:DateField;
		
		[SkinPart(required="true")]
		[EventHandling(event="click",handler="button1_clickHandler")]
		public var bt1:Button;
	}
}