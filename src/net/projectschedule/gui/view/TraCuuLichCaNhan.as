package net.projectschedule.gui.view
{
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.core.ClassFactory;
	import mx.events.FlexEvent;
	
	import spark.components.Alert;
	import spark.components.Button;
	import spark.components.ComboBox;
	import spark.components.List;
	import spark.components.supportClasses.SkinnableComponent;
	import spark.events.IndexChangeEvent;
	
	import net.fproject.di.Injector;
	import net.fproject.di.InstanceFactory;
	import net.projectschedule.gui.components.CheckBoxItemRender;
	import net.projectschedule.handing.CalendarHanding;
	import net.projectschedule.models.Calendar;
	import net.projectschedule.models.Checkbox;
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
		
		[Bindable]
		public var mor:ArrayCollection = new ArrayCollection([new Checkbox(0, false), new Checkbox(2, false), new Checkbox(4, false), new Checkbox(6, false), new Checkbox(8, false), new Checkbox(10, false)]);
		
		[Bindable]
		public var aft:ArrayCollection = new ArrayCollection([new Checkbox(1, false), new Checkbox(3, false), new Checkbox(5, false), new Checkbox(7, false), new Checkbox(9, false), new Checkbox(11, false)]);
		
		[Bindable]
		public var emp:Employee = new Employee;
		
		public function get employeeService():EmployeeService
		{
			return InstanceFactory.getInstance(EmployeeService);
		}
		
		public function get calendarService():CalendarService
		{
			return InstanceFactory.getInstance(CalendarService);
		}
		
		public function module_creationCompleteHandler(event:FlexEvent):void
		{
			myCB.dataProvider = DataUtil.employees;
			myCB.labelField = "name";
			
			listMon.dataProvider = mor;
			listAft.dataProvider = aft;
		}
		
		public function button1_clickHandler(event:MouseEvent):void
		{
			var schedule:ArrayCollection = new ArrayCollection;
			var calendarHanding:CalendarHanding = new CalendarHanding;
			schedule = calendarHanding.getCalendarOfEmployee(emp);
			for each (var s:int in schedule)
			{
				for each (var m:Checkbox in mor )
				{
					if(s == int(m['id']))
					{
						m['selected'] = true;
					}
				}
				
				for each (var a:Checkbox in aft )
				{
					if(s == int(a['id']))
					{
						a['selected'] = true;
					}
				}
			}
			listMon.dataProvider = mor;
			listAft.dataProvider = aft;
		}
		
		public function myCB_changeHandler(event:IndexChangeEvent):void
		{
			if(myCB.selectedItem is Employee)
				emp = Employee(myCB.selectedItem);
		}
		
		public var listCheckBoxItemRender:ClassFactory = new ClassFactory(CheckBoxItemRender);
		
		
		[SkinPart(required="true")]		
		[EventHandling(event="change",handler="myCB_changeHandler")]
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