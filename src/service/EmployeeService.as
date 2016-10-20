package service
{
	import mx.collections.ArrayCollection;
	
	import models.Employee;

	public class EmployeeService
	{
		public var employees:ArrayCollection = new ArrayCollection;
		public var employeeCalendarMon:ArrayCollection = new ArrayCollection;
		public var employeeCalendarAft:ArrayCollection = new ArrayCollection;
		public function EmployeeService()
		{
			var names:Array = ["Nhung", "Hà", "Quốc", "Đại", "Chung", "Thanh", "Ngọc", "Thành"];
			var i:int = 0;
			var name:String;
			for each (name in names)
			{
				var employEee:Employee = new Employee;
				employEee.name = name;
				employEee.dateOfBirth = new Date;
				employEee.id = String(i);
				employEee.phoneNumber = '0165323515';
				employees.addItem(employEee);
			}
			
			for (var j:int = 0; j< 6; j++)
			{
				var list1:ArrayCollection = new ArrayCollection;
				var list2:ArrayCollection = new ArrayCollection;
				var ranNumber:Number;
				for each (name in names)
				{
					ranNumber = Math.floor(Math.random() * 8);
					if (ranNumber > 2)
						list1.addItem(name);
					if (ranNumber < 6)
						list2.addItem(name);
				}
				employeeCalendarMon.addItem(list1);
				employeeCalendarAft.addItem(list2);
			}
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
		
		public function getEmployeeCalendarMon():ArrayCollection{
			return this.employeeCalendarMon;
		}
		
		public function getEmployeeCalendarAft():ArrayCollection{
			return this.employeeCalendarAft;
		}
	}
}