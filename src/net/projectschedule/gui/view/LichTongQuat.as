package net.projectschedule.gui.view
{
	import mx.collections.ArrayCollection;
	//import mx.controls.DateField;
	import mx.core.ClassFactory;
	import mx.events.FlexEvent;
	import mx.rpc.events.ResultEvent;
	
	import spark.components.DataGroup;
	import spark.components.supportClasses.SkinnableComponent;
	
	import net.fproject.di.Injector;
	import net.projectschedule.gui.components.ListLabel;
	import net.projectschedule.handing.EmployeeHanding;
	import net.projectschedule.models.Calendar;
	import net.projectschedule.models.Employee;
	import net.projectschedule.service.CalendarService;
	import net.projectschedule.service.EmployeeService;
	import net.projectschedule.utils.DataUtil;
	
	[EventHandling(event="creationComplete",handler="module_creationCompleteHandler")]
	
	public class LichTongQuat extends SkinnableComponent
	{
		public function LichTongQuat()
		{
			Injector.inject(this);
		}
		
		[Bindable]
		public var dataMonDataProvider:ArrayCollection;
		
		[Bindable]
		public var dataAftDataProvider:ArrayCollection;
		
		[Bindable]
		public var employeeHandling:EmployeeHanding = new EmployeeHanding;
		
		
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
			var day:Date = new Date;
			/*tuNgay.selectedDate = day;
			denNgay.selectedDate = day;*/
			/*DataUtil.calendars = calendarService.getAll(Calendar,
				function(event:ResultEvent):void
				{
					DataUtil.employees = employeeService.getAll(Employee,onGetAllEmployee_Complete);
				}
			);*/
		}
		
		public function onGetAllEmployee_Complete(event:ResultEvent):void{
			var date:Date = new Date;
			dataMonDataProvider = employeeHandling.getEmployeeCalendarMonOfWeek();
			dataAftDataProvider = employeeHandling.getEmployeeCalendarAftOfWeek();
		}
		
		
		public var ListLabelItemRender:ClassFactory = new ClassFactory(ListLabel);
		
		/*[SkinPart(required="true")]
		public var tuNgay:DateField;
		
		[SkinPart(required="true")]
		public var denNgay:DateField;*/
		
		[SkinPart(required="true")]
		[PropertyBinding(dataProvider="dataMonDataProvider@")]
		[PropertyBinding(itemRenderer="ListLabelItemRender")]
		public var mon:DataGroup;
		
		[SkinPart(required="true")]
		[PropertyBinding(dataProvider="dataAftDataProvider@")]
		[PropertyBinding(itemRenderer="ListLabelItemRender")]
		public var aft:DataGroup;
	}
}