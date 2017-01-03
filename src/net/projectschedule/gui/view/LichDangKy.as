package net.projectschedule.gui.view
{
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.core.ClassFactory;
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	import spark.components.ComboBox;
	import spark.components.List;
	import spark.components.supportClasses.SkinnableComponent;
	import spark.events.IndexChangeEvent;
	
	import net.fproject.di.Injector;
	import net.fproject.di.InstanceFactory;
	import net.projectschedule.gui.components.CheckBoxItemRender;
	import net.projectschedule.models.Calendar;
	import net.projectschedule.models.Employee;
	import net.projectschedule.service.CalendarService;
	import net.projectschedule.utils.DataUtil;
	
	[EventHandling(event="creationComplete",handler="module_creationCompleteHandler")]
	
	public class LichDangKy extends SkinnableComponent
	{
		
		public var emp:Employee;
		public var mor:ArrayCollection = new ArrayCollection([{"id":0,"selected":false},{"id":2,"selected":false},{"id":4,"selected":false},{"id":6,"selected":false},{"id":8,"selected":false},{"id":10,"selected":false}]);
		public var aft:ArrayCollection = new ArrayCollection([{"id":1,"selected":false},{"id":3,"selected":false},{"id":5,"selected":false},{"id":7,"selected":false},{"id":9,"selected":false},{"id":11,"selected":false}]);
		
		public function LichDangKy()
		{
			Injector.inject(this);
		}
		
		public function get calendarService():CalendarService
		{
			return InstanceFactory.getInstance(CalendarService);
		}
		
		public function module_creationCompleteHandler(event:FlexEvent):void
		{
			listMon.dataProvider = mor;
			listAft.dataProvider = aft;
			myCB.dataProvider = DataUtil.employees;
			myCB.labelField = "name";
		}
		
		public function dangkyBtn_clickHandler(event:MouseEvent):void
		{
			var cal:Calendar = new Calendar;
			if(emp){
				cal.employeeId = emp.id;
				var scheduleArray:ArrayCollection = new ArrayCollection;
				for each(var i:Object in mor){
					if (i.hasOwnProperty("selected") && i['selected'] && i.hasOwnProperty("id"))
						scheduleArray.addItem(i["id"]);
				}
				for each(var k:Object in aft){
					if (k.hasOwnProperty("selected") && k['selected'] && k.hasOwnProperty("id"))
						scheduleArray.addItem(k["id"]);
				}				
				cal.schedule = scheduleArray.toString();
				
			}
			calendarService.save(cal);
			
		}
		
		
		public function myCB_changeHandler(event:IndexChangeEvent):void
		{
			if(myCB.selectedItem is Employee)
				emp = Employee (myCB.selectedItem);
			
		}
		
		public var listCheckBoxItemRender:ClassFactory = new ClassFactory(CheckBoxItemRender);
		
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