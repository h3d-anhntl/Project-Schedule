package service
{
	import mx.collections.ArrayCollection;
	import mx.rpc.http.mxml.HTTPService;
	
	import models.Calendar;
	import models.Employee;
	
	import utils.ServiceBase;

	public class EmployeeService extends ServiceBase
	{
		public var employees:ArrayCollection = new ArrayCollection;
		public var employeesOfDay:ArrayCollection = new ArrayCollection;		
		public var calendars:CalendarService = new CalendarService;
		
		[Bindable]
		public var employeeCalendarMonOfWeek:ArrayCollection = new ArrayCollection;
		
		[Bindable]
		public var employeeCalendarAftOfWeek:ArrayCollection = new ArrayCollection;
		
		[Bindable]
		public var employeeCalendarMonOfDay:ArrayCollection = new ArrayCollection;
		
		[Bindable]
		public var employeeCalendarAftOfDay:ArrayCollection = new ArrayCollection;
		
		public function EmployeeService()
		{ 
			httpService = new HTTPService("http://localhost:9090/web/employees");
		}
		
		private static var _serviceCal:EmployeeService;
		
		public static function getInstance():EmployeeService{
			if(_serviceCal == null){
				_serviceCal = new EmployeeService;
			}
			return _serviceCal;
		}
		
		public function getEmployee(_id:String):Employee
		{
			var id:int = Number(_id);
			return employees.getItemAt(id) as Employee;
		}
		
		public function getAllEmpoyee():ArrayCollection
		{
			return employees;
		}
		
		public function getEmployeeCalendarMonOfWeek():ArrayCollection
		{
			return this.employeeCalendarMonOfWeek;
		}
		
		public function getEmployeeCalendarAftOfWeek():ArrayCollection
		{
			return this.employeeCalendarAftOfWeek;
		}
		
		public function getEmployeeCalendarMonOfDay(day:int):ArrayCollection
		{
			for(var i:int = 0; i< calendars.getCalendarMonOfDay(day).length; i++)
			{
				var employeeId:String = Calendar(calendars.getCalendarMonOfDay(day).getItemAt(i)).employeeId;
				for(var j:int=0; j < employees.length; j++)
				{
					if( Employee( employees.getItemAt(j)).id == employeeId)
					{
						employeeCalendarMonOfDay.addItem(employees.getItemAt(j));
					}
				}
					
			}
			return employeeCalendarMonOfDay;
		}
		
		public function getEmployeeCalendarAftOfDay(day:int):ArrayCollection
		{
			for(var i:int = 0; i< calendars.getCalendarAftOfDay(day).length; i++)
			{
				var employeeId:String = Calendar(calendars.getCalendarAftOfDay(day).getItemAt(i)).employeeId;
				for(var j:int = 0; j < employees.length; j++)
				{
					if( Employee( employees.getItemAt(j)).id == employeeId)
					{
						employeeCalendarAftOfDay.addItem(employees.getItemAt(j));
					}
				}
				
			}
			return this.employeeCalendarAftOfDay;
		}
		
		
	}
}