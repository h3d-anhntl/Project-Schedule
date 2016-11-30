package net.projectschedule.handing
{
	import mx.collections.ArrayCollection;
	
	import net.projectschedule.models.Calendar;
	import net.projectschedule.models.Dayoff;
	import net.projectschedule.models.Employee;
	import net.projectschedule.utils.DataUtil;

	public class EmployeeHanding
	{
		public var employeesOfDay:ArrayCollection = new ArrayCollection;		
		public var calendars:CalendarHanding = new CalendarHanding;
		public var dayoff:DayoffHanding = new DayoffHanding;
		
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
				var employeeId:int = calendar.employeeId;
				var employees:ArrayCollection = DataUtil.employees;
				for each (var employee:Employee in employees)
				{
					if (employee.id == employeeId)
						result.addItem(employee);
				}
			}
			return result;
		}
		
		public function getEmployeeCalendarOfWeek(calendarsOfWeek:ArrayCollection):ArrayCollection
		{
			var result:ArrayCollection = new ArrayCollection;
			var employees:ArrayCollection = DataUtil.employees;
			for each(var arr:ArrayCollection in calendarsOfWeek)
			{
				var r1:ArrayCollection = new ArrayCollection;
				for each(var cal:Calendar in arr)
				{
					for each(var employee:Employee in employees)
					{
						if (employee.id == cal.employeeId)
							r1.addItem(employee);
					}
				}
				result.addItem(r1);
			}
			return result;
			
		}
		
		public function getEmployeeCalendarMonOfWeek():ArrayCollection
		{
			var calendarsMonOfWeek:ArrayCollection = calendars.getCalendarMonOfWeek();
			return getEmployeeCalendarOfWeek(calendarsMonOfWeek);
			
		}
		
		public function getEmployeeCalendarAftOfWeek():ArrayCollection
		{
			var calendarsAftOfWeek:ArrayCollection = calendars.getCalendarAftOfWeek();
			return getEmployeeCalendarOfWeek(calendarsAftOfWeek);
			
		}
		
		public function getEmployeeDayOff(day:Date):ArrayCollection
		{
			var employees:ArrayCollection = DataUtil.employees;
			var dayoffs:ArrayCollection = dayoff.dayoffByDay(day);
			var employeeDayoff:ArrayCollection = new ArrayCollection;
			for each(var emp:Employee in employees)
			{
				for each(var d:Dayoff in dayoffs)
				{
					if(emp.id == d.employeeId)
						employeeDayoff.addItem(emp);
				}
			}
			
			return employeeDayoff;
		}
		
	}
}