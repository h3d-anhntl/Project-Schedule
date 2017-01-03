package net.projectschedule.gui.view
{
	import flash.events.MouseEvent;
	
	import mx.controls.DateField;
	import mx.core.ClassFactory;
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	import spark.components.CheckBox;
	import spark.components.ComboBox;
	import spark.components.supportClasses.SkinnableComponent;
	import spark.events.IndexChangeEvent;
	
	import net.fproject.di.Injector;
	import net.fproject.di.InstanceFactory;
	import net.projectschedule.gui.components.CheckBoxItemRender;
	import net.projectschedule.models.Dayoff;
	import net.projectschedule.models.Employee;
	import net.projectschedule.service.CalendarService;
	import net.projectschedule.service.DayoffService;
	import net.projectschedule.service.EmployeeService;
	import net.projectschedule.utils.DataUtil;
	
	[EventHandling(event="creationComplete",handler="module_creationCompleteHandler")]
	
	public class LichXinNghi extends SkinnableComponent
	{
		public function LichXinNghi()
		{
			Injector.inject(this);
		}
		
		public var emp:Employee = new Employee;
		
		public function get employeeService():EmployeeService
		{
			return InstanceFactory.getInstance(EmployeeService);
		}
		
		public function get calendarService():CalendarService
		{
			return InstanceFactory.getInstance(CalendarService);
		}
		
		public function get dayoffService():DayoffService
		{
			return InstanceFactory.getInstance(DayoffService);
		}
		
		public function module_creationCompleteHandler(event:FlexEvent):void
		{
			
			myCB.dataProvider = DataUtil.employees;
			myCB.labelField = "name";
		}
		
		public function dangkyBtn_clickHandler(event:MouseEvent):void
		{
			var dayoff:Dayoff = new Dayoff;
			dayoff.employeeId = emp.id;
			dayoff.day_off = tuNgay.selectedDate;
			dayoff.createtime = new Date;
			if(mon.selected)
				dayoff.morning = true
			else 
				dayoff.morning = false;
			if(aft.selected)
				dayoff.afternoon = true;
			else
				dayoff.afternoon = false;
			dayoffService.save(dayoff);
		}
		
		public function myCB_changeHandler(event:IndexChangeEvent):void
		{
			if(myCB.selectedItem is Employee)
				emp = Employee(myCB.selectedItem);
		}
		
		public var listCheckBoxItemRender:ClassFactory = new ClassFactory(CheckBoxItemRender);
		
		[SkinPart(required="true")]
		public var tuNgay:DateField;
		
		[SkinPart(required="true")]
		[EventHandling(event="change",handler="myCB_changeHandler")]
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