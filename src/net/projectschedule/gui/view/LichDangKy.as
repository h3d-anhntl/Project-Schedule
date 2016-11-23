package net.projectschedule.gui.view
{
	import flash.events.MouseEvent;
	
	import mx.controls.DateField;
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	import spark.components.supportClasses.SkinnableComponent;
	
	import net.fproject.di.Injector;
	import net.projectschedule.service.CalendarService;
	
	[EventHandling(event="creationComplete",handler="module_creationCompleteHandler")]
	
	public class LichDangKy extends SkinnableComponent
	{
		public function get calendarService():CalendarService
		{
			return CalendarService.getInstance();	
		}
		
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
		
		public function dangkyBtn_clickHandler(event:MouseEvent):void
		{
			var data:Object = {"startDate": null,"endDate": null,"schedule": "4,6,5,9,2,7,8","isWorking": 1,"employeeId": 2};
			calendarService.save(data);
		}
		
		[SkinPart(required="true")]
		public var tuNgay:DateField;
		
		[SkinPart(required="true")]
		public var denNgay:DateField;
		
		[SkinPart(required="true")]
		[EventHandling(event="click",handler="dangkyBtn_clickHandler")]
		public var dangkyBtn:Button;
	}
}