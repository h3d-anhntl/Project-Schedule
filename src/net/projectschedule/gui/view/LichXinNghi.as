package net.projectschedule.gui.view
{
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.DateField;
	import mx.core.ClassFactory;
	import mx.events.FlexEvent;
	import mx.rpc.events.ResultEvent;
	
	import spark.components.Button;
	import spark.components.CheckBox;
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
	
	public class LichXinNghi extends SkinnableComponent
	{
		public function LichXinNghi()
		{
			Injector.inject(this);
		}
		
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
			/*DataUtil.calendars = calendarService.getAll(Calendar,
				function(event:ResultEvent):void
				{
					DataUtil.employees = employeeService.getAll(Employee);
				}
			);*/
			myCB.dataProvider = DataUtil.employees;
			myCB.labelField = "name";
		}
		
		public function button1_clickHandler(event:MouseEvent):void
		{
			
		}
		
		public function dangkyBtn_clickHandler(event:MouseEvent):void
		{
			
		}
		
		public var listCheckBoxItemRender:ClassFactory = new ClassFactory(CheckBoxItemRender);
		
		[SkinPart(required="true")]
		public var tuNgay:DateField;
		
		[SkinPart(required="true")]
		public var myCB:ComboBox
		
		[SkinPart(required="true")]
		[EventHandling(event="click",handler="dangkyBtn_clickHandler")]
		public var dangkyBtn:Button;
		
		[SkinPart(required="true")]
		public var mon:CheckBox;
		
		[SkinPart(required="true")]
		public var aft:CheckBox;
	}
}