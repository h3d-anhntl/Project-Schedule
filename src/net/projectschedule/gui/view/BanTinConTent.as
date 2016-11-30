package net.projectschedule.gui.view
{
	import flash.events.MouseEvent;
	
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayCollection;
	import mx.controls.DateField;
	import mx.core.ClassFactory;
	import mx.events.CalendarLayoutChangeEvent;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.rpc.events.ResultEvent;
	
	import spark.components.Button;
	import spark.components.List;
	import spark.components.supportClasses.SkinnableComponent;
	
	import net.fproject.active.ActiveDataProvider;
	import net.fproject.di.Injector;
	import net.fproject.di.InstanceFactory;
	import net.projectschedule.gui.components.ListNameEmployeeByDay;
	import net.projectschedule.handing.EmployeeHanding;
	import net.projectschedule.service.CalendarService;
	import net.projectschedule.service.DayoffService;
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
		public var dataEmployeeOffDataProvider:ArrayCollection;
		
		[Bindable]
		public var employeeHandling:EmployeeHanding = new EmployeeHanding;
		
		[Bindable]
		public var selectedDay:int = 0;
		
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
			var date:Date = new Date;
			DataUtil.calendars = calendarService.getCalendars() as ArrayCollection;
			ChangeWatcher.watch(DataUtil.calendars,'paginationResult',
				function (e:PropertyChangeEvent):void
				{
					DataUtil.employees = employeeService.getEmployees() as ArrayCollection;
					ChangeWatcher.watch(DataUtil.employees,'paginationResult',
						function(e:PropertyChangeEvent):void
						{
							DataUtil.dayoff = dayoffService.getDayoffs() as ArrayCollection;
							ChangeWatcher.watch(DataUtil.dayoff,'paginationResult',
								function(e:PropertyChangeEvent):void
								{
									dataMonDataProvider = ArrayCollection (employeeHandling.getEmployeeCalendarMonOfDay(int(date.day)));
									dataAftDataProvider = ArrayCollection(employeeHandling.getEmployeeCalendarAftOfDay(int(date.day)));
									dataEmployeeOffDataProvider = ArrayCollection(employeeHandling.getEmployeeDayOff(date));
								}
							)
						}
					)
				}
			)
		}
		
		public function chonNgay_changeHandler(event:CalendarLayoutChangeEvent):void
		{
			var date:Date = new Date;
			if (DateField(event.currentTarget).selectedDate){				
				selectedDay = int(DateField(event.currentTarget).selectedDate.getDay());
				date = DateField(event.currentTarget).selectedDate;
			}
			dataMonDataProvider = employeeHandling.getEmployeeCalendarMonOfDay(selectedDay);
			var d:String = date.getFullYear()+"-"+date.getMonth()+"-"+date.getDay();
			dataAftDataProvider = employeeHandling.getEmployeeCalendarAftOfDay(selectedDay);
			//dataEmployeeOffDataProvider = employeeHandling.getEmployeeDayOff(date);
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
		
		[SkinPart(required="true")]
		[PropertyBinding(dataProvider="dataAftDataProvider@")]
		[PropertyBinding(itemRenderer="lisNameEmployeeItemRenderer")]
		public var aftData:List;
		
		[SkinPart(required="true")]
		[PropertyBinding(dataProvider="dataEmployeeOffDataProvider@")]
		[PropertyBinding(itemRenderer="lisNameEmployeeItemRenderer")]
		public var unyokeData:List;
		
	}
}