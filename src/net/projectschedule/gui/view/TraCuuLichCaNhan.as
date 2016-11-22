package net.projectschedule.gui.view
{
	import flash.events.MouseEvent;
	
	import mx.controls.DateField;
	import mx.core.ClassFactory;
	import mx.events.FlexEvent;
	import mx.rpc.events.ResultEvent;
	
	import spark.components.Button;
	import spark.components.ComboBox;
	import spark.components.supportClasses.SkinnableComponent;
	
	import net.fproject.di.Injector;
	import net.projectschedule.gui.components.ABorderContainerCheckBox;
	import net.projectschedule.gui.components.ListNameEmployeeByDay;
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
					DataUtil.employees = employeeService.getAll(Employee);
				}
			);
			myCB.dataProvider = DataUtil.employees;
			myCB.labelField = "name";
			//myCB.labelFunction = mycb_labelFunction;
		}
		
		/*public function mycb_labelFunction(item:Object):String
		{
			return (item && item.hasOwnProperty("name")) ? item["name"]+"test":"";
		}*/
		
		public function button1_clickHandler(event:MouseEvent):void
		{
			
		}
		
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
		public var st2:ABorderContainerCheckBox;
		
		[SkinPart(required="true")]
		public var st3:ABorderContainerCheckBox;
		
		[SkinPart(required="true")]
		public var st4:ABorderContainerCheckBox;
		
		[SkinPart(required="true")]
		public var st5:ABorderContainerCheckBox;
		
		[SkinPart(required="true")]
		public var st6:ABorderContainerCheckBox;
		
		[SkinPart(required="true")]
		public var st7:ABorderContainerCheckBox;
		
		[SkinPart(required="true")]
		public var ct2:ABorderContainerCheckBox;
		
		[SkinPart(required="true")]
		public var ct3:ABorderContainerCheckBox;
		
		[SkinPart(required="true")]
		public var ct4:ABorderContainerCheckBox;
		
		[SkinPart(required="true")]
		public var ct5:ABorderContainerCheckBox;
		
		[SkinPart(required="true")]
		public var ct6:ABorderContainerCheckBox;
		
		[SkinPart(required="true")]
		public var ct7:ABorderContainerCheckBox;
		
	}
}