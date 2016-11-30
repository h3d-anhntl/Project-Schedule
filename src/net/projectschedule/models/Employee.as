package net.projectschedule.models
{
	import mx.controls.DateField;
	
	[RemoteClass(alias="FEmployee")]
	public class Employee
	{
		[Bindable]
		public var id:int;
		[Bindable]
		public var name:String;
		[Bindable]
		public var dateOfBirth:Date;
		[Bindable]
		public var address:String;
		[Bindable]
		public var phoneNumber:String;
		
		public static function fromObject(item:Object):Employee{
			var employee:Employee = new Employee; 
			//employee.id = item.hasOwnProperty('id') ? item['id'] : ""; 
			employee.address = item.hasOwnProperty('address') ? item['address'] : "";
			employee.dateOfBirth = item.hasOwnProperty('dateOfBirth') ? DateField.stringToDate(item['dateOfBirth'],"YYYY-MM-DD") : null;
			employee.name = item.hasOwnProperty('name') ? item['name'] : "";
			employee.phoneNumber = item.hasOwnProperty('phoneNumber') ? item['phoneNumber'] : "";
			return employee;
		}
		
	}
}