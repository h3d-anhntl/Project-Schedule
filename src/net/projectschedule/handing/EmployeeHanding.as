package net.projectschedule.handing
{
	import mx.collections.ArrayCollection;
	
	import net.projectschedule.models.Calendar;
	import net.projectschedule.models.Employee;
	import net.projectschedule.utils.DataUtil;

	public class EmployeeHanding
	{
		public var employeesOfDay:ArrayCollection = new ArrayCollection;		
		public var calendars:CalendarHanding = new CalendarHanding;
		
		[Bindable]
		public var employeeCalendarMonOfWeek:ArrayCollection = new ArrayCollection;
		
		[Bindable]
		public var employeeCalendarAftOfWeek:ArrayCollection = new ArrayCollection;

		[Bindable]
		public var employeeCalendarAftOfDay:ArrayCollection = new ArrayCollection;
		
		public function EmployeeHanding()
		{
		}
		
		public function getEmployeeCalendarMonOfDay(day:int):ArrayCollection
		{
			var calendarMonOfDay:ArrayCollection = calendars.getCalendarMonOfDay(day);
			return getWorkingEmployeeByDay(calendarMonOfDay);
		}
		
		public function getEmployeeCalendarAftOfDay(day:int):ArrayCollection
		{
			var calendarAftOfDay:ArrayCollection = calendars.getCalendarAftOfDay(day);
			return getWorkingEmployeeByDay(calendarAftOfDay);
		}
		
		public function getWorkingEmployeeByDay(calendarMonOfDay:ArrayCollection):ArrayCollection
		{
			var result:ArrayCollection = new ArrayCollection;
			
			for each (var calendar:Calendar in calendarMonOfDay)
			{
				var employeeId:String = calendar.employeeId;
				var employees:ArrayCollection = DataUtil.employees;
				for each (var employee:Employee in employees)
				{
					if (employee.id == employeeId)
						result.addItem(employee);
				}
			}
			return result;
		}
		
		public function getEmployeeCalendarMonOfWeek():ArrayCollection
		{
			return this.employeeCalendarMonOfWeek;
		}
		
		public function getEmployeeCalendarAftOfWeek():ArrayCollection
		{
			return this.employeeCalendarAftOfWeek;
		}
		
		
		
	}
}