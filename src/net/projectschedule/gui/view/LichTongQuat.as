package net.projectschedule.gui.view
{
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayCollection;
	import mx.core.ClassFactory;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.rpc.events.ResultEvent;
	
	import spark.components.DataGroup;
	import spark.components.supportClasses.SkinnableComponent;
	
	import net.fproject.di.Injector;
	import net.fproject.di.InstanceFactory;
	import net.projectschedule.gui.components.ListLabel;
	import net.projectschedule.handing.EmployeeHanding;
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
			return InstanceFactory.getInstance(EmployeeService);
		}
		
		public function get calendarService():CalendarService
		{
			return InstanceFactory.getInstance(CalendarService);
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
							dataMonDataProvider = ArrayCollection(employeeHandling.getEmployeeCalendarMonOfWeek());
							dataAftDataProvider = ArrayCollection(employeeHandling.getEmployeeCalendarAftOfWeek());
						}
					)
				}
			)
		}
		
		public function onGetAllEmployee_Complete(event:ResultEvent):void{
			var date:Date = new Date;
			dataMonDataProvider = employeeHandling.getEmployeeCalendarMonOfWeek();
			dataAftDataProvider = employeeHandling.getEmployeeCalendarAftOfWeek();
		}		
		public var ListLabelItemRender:ClassFactory = new ClassFactory(ListLabel);
		
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