package net.projectschedule.gui.view
{
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.DateField;
	import mx.core.ClassFactory;
	import mx.events.CalendarLayoutChangeEvent;
	import mx.events.FlexEvent;
	import mx.rpc.events.ResultEvent;
	
	import spark.components.Button;
	import spark.components.List;
	import spark.components.supportClasses.SkinnableComponent;
	
	import net.fproject.di.Injector;
	import net.projectschedule.gui.components.ListNameEmployeeByDay;
	import net.projectschedule.handing.EmployeeHanding;
	import net.projectschedule.models.Calendar;
	import net.projectschedule.models.Employee;
	import net.projectschedule.service.CalendarService;
	import net.projectschedule.service.EmployeeService;
	import net.projectschedule.utils.DataUtil;
	
	[EventHandling(event="creationComplete",handler="module_creationCompleteHandler")]
	public class BanTinConTent extends SkinnableComponent
	{
		public function BanTinConTent()
		{
			Injector.inject(this);
		}
		
		[Bindable]
		public var dataMonDataProvider:ArrayCollection;
		
		[Bindable]
		public var dataAftDataProvider:ArrayCollection;
		
		[Bindable]
		public var employeeHandling:EmployeeHanding = new EmployeeHanding;
		
		[Bindable]
		public var selectedDay:int = 0;
		
		public function get employeeService():EmployeeService
		{
			return EmployeeService.getInstance();
		}
		
		public function get calendarService():CalendarService
		{
			return CalendarService.getInstance();;
		}

		public function module_creationCompleteHandler(event:FlexEvent):void
		{
			DataUtil.calendars = calendarService.getAll(Calendar,
				function(event:ResultEvent):void
				{
					DataUtil.employees = employeeService.getAll(Employee,onGetAllEmployee_Complete);
				}
			);
			var date:Date = new Date;
			chonNgay.selectedDate = date;
		}
		
		public function onGetAllEmployee_Complete(event:ResultEvent):void{
			var date:Date = new Date;
			dataMonDataProvider = employeeHandling.getEmployeeCalendarMonOfDay(int(date.day));
			dataAftDataProvider = employeeHandling.getEmployeeCalendarAftOfDay(int(date.day));
		}
		
		public function chonNgay_changeHandler(event:CalendarLayoutChangeEvent):void
		{
			if (DateField(event.currentTarget).selectedDate)
				selectedDay = int(DateField(event.currentTarget).selectedDate.getDay());
			dataMonDataProvider = employeeHandling.getEmployeeCalendarMonOfDay(selectedDay);
		}
		
		public var lisNameEmployeeItemRenderer:ClassFactory = new ClassFactory(ListNameEmployeeByDay);
		
		public function search_clickHandler(event:MouseEvent):void
		{
		}
		
		[SkinPart(required="true")]
		[EventHandling(event="change",handler="chonNgay_changeHandler")]
		public var chonNgay:DateField;
		
		[SkinPart(required="true")]
		[EventHandling(event="click",handler="search_clickHandler")]
		public var search:Button;
		
		[SkinPart(required="true")]
		[PropertyBinding(dataProvider="dataMonDataProvider@")]
		[PropertyBinding(itemRenderer="lisNameEmployeeItemRenderer")]
		public var monData:List;
		
	}
}