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
	
	import net.fproject.di.Injector;
	import net.projectschedule.gui.components.CheckBoxItemRender;
	import net.projectschedule.models.Calendar;
	import net.projectschedule.models.Employee;
	import net.projectschedule.service.CalendarService;
	import net.projectschedule.service.EmployeeService;
	import net.projectschedule.utils.DataUtil;
	
	[EventHandling(event="creationComplete",handler="module_creationCompleteHandler")]
	
	public class TraCuuLichCaNhan extends SkinnableComponent
	{
		public function TraCuuLichCaNhan()
		{
			Injector.inject(this);
		}
		
		public var mor:ArrayCollection = new ArrayCollection([{"id":0,"selected":false},{"id":2,"selected":false},{"id":4,"selected":false},{"id":6,"selected":false},{"id":8,"selected":false},{"id":10,"selected":false}]);
		public var aft:ArrayCollection = new ArrayCollection([{"id":1,"selected":false},{"id":3,"selected":false},{"id":5,"selected":false},{"id":7,"selected":false},{"id":9,"selected":false},{"id":11,"selected":false}]);
		
		
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
		/*	DataUtil.calendars = calendarService.getAll(Calendar,
				function(event:ResultEvent):void
				{
					DataUtil.employees = employeeService.getAll(Employee);
				}
			);*/
			myCB.dataProvider = DataUtil.employees;
			myCB.labelField = "name";
			
			listMon.dataProvider = mor;
			listAft.dataProvider = aft;
		}
		
		public function button1_clickHandler(event:MouseEvent):void
		{
			
		}
		
		public var listCheckBoxItemRender:ClassFactory = new ClassFactory(CheckBoxItemRender);
		
		[SkinPart(required="true")]
		public var tuNgay:DateField;
		
		[SkinPart(required="true")]
		public var denNgay:DateField;
		
		[SkinPart(required="true")]
		//[PropertyBinding(itemRenderer="lisNameEmployeeItemRenderer")]
		public var myCB:ComboBox
		
		[SkinPart(required="true")]
		[EventHandling(event="click",handler="button1_clickHandler")]
		public var traCuu:Button
		
		[SkinPart(required="true")]
		[PropertyBinding(itemRenderer="listCheckBoxItemRender")]
		public var listMon:List;
		
		[SkinPart(required="true")]
		[PropertyBinding(itemRenderer="listCheckBoxItemRender")]
		public var listAft:List;
		
	}
}