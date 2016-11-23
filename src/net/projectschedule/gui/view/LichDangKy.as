package net.projectschedule.gui.view
{
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.DateField;
	import mx.core.ClassFactory;
	import mx.events.FlexEvent;
	import mx.rpc.events.ResultEvent;
	
	import spark.components.Button;
	import spark.components.ComboBox;
	import spark.components.List;
	import spark.components.supportClasses.SkinnableComponent;
	import spark.events.IndexChangeEvent;
	
	import net.fproject.di.Injector;
	import net.projectschedule.gui.components.CheckBoxItemRender;
	import net.projectschedule.models.Calendar;
	import net.projectschedule.models.Employee;
	import net.projectschedule.service.CalendarService;
	import net.projectschedule.service.EmployeeService;
	import net.projectschedule.utils.DataUtil;
	
	[EventHandling(event="creationComplete",handler="module_creationCompleteHandler")]
	
	public class LichDangKy extends SkinnableComponent
	{
		
		public var emp:Employee;
		public var mor:ArrayCollection = new ArrayCollection([{"id":0,"selected":true},{"id":2,"selected":false},{"id":4,"selected":false},{"id":6,"selected":false},{"id":8,"selected":false},{"id":10,"selected":false}]);
		public var aft:ArrayCollection = new ArrayCollection([{"id":0,"selected":false},{"id":2,"selected":false},{"id":4,"selected":true},{"id":6,"selected":false},{"id":8,"selected":false},{"id":10,"selected":false}]);
		
		public function get calendarService():CalendarService
		{
			return CalendarService.getInstance();	
		}
		
		public function LichDangKy()
		{
			Injector.inject(this);
		}
		
		public function get employeeService():EmployeeService
		{
			return EmployeeService.getInstance();
		}
		
		public function module_creationCompleteHandler(event:FlexEvent):void
		{
			var day:Date = new Date;
			tuNgay.selectedDate = day;
			denNgay.selectedDate = day;
			listMon.dataProvider = mor;
			listAft.dataProvider = aft;
			DataUtil.calendars = calendarService.getAll(Calendar,
				function(event:ResultEvent):void
				{
					DataUtil.employees = employeeService.getAll(Employee);
				}
			);
			myCB.dataProvider = DataUtil.employees;
			myCB.labelField = "name";
		}
		
		public function dangkyBtn_clickHandler(event:MouseEvent):void
		{
			var data:Object = {"startDate": null,"endDate": null,"schedule": "4,6,5,9,2,7,8","isWorking": 1,"employeeId": 2};
			var cal:Calendar = new Calendar;
			if(emp){
				cal.employeeId = emp.id;
				cal.startDate = null;
				cal.isWorking = true;
				cal.endDate = null;
				cal.schedule = new ArrayCollection;
				
			}
				calendarService.save(emp);
		}
		
		
		public function myCB_changeHandler(event:IndexChangeEvent):void
		{
			if(myCB.selectedItem is Employee)
				emp = Employee (myCB.selectedItem);
			
		}
		
		public var listCheckBoxItemRender:ClassFactory = new ClassFactory(CheckBoxItemRender);
		
		[SkinPart(required="true")]
		public var tuNgay:DateField;
		
		[SkinPart(required="true")]
		public var denNgay:DateField;
		
		[SkinPart(required="true")]
		[EventHandling(event="click",handler="dangkyBtn_clickHandler")]
		public var dangkyBtn:Button;
		
		
		[SkinPart(required="true")]
		
		[EventHandling(event="change",handler="myCB_changeHandler")]
		public var myCB:ComboBox;
		
		[SkinPart(required="true")]
		[PropertyBinding(itemRenderer="listCheckBoxItemRender")]
		public var listMon:List;
		
		[SkinPart(required="true")]
		[PropertyBinding(itemRenderer="listCheckBoxItemRender")]
		public var listAft:List;
	}
}