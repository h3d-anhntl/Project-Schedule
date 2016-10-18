package utils
{
	import mx.collections.ArrayCollection;
	
	import models.Employee;
	[Bindable]
	public class SampleDataUtil
	{
		public function getEmployees():ArrayCollection
		{
			var e1:Employee = new Employee();
			e1.id = "1";
			e1.name = "Nhung";
			e1.address = "Hà Nội";
			e1.dateOfBirth = new Date(1989, 8, 28);
			e1.phoneNumber = "0987678767";
			
			var e2:Employee = new Employee();
			e2.id = "2";
			e2.name = "Hà";
			e2.address = "Phú Thọ";
			e2.dateOfBirth = new Date(1989, 8, 28);
			e2.phoneNumber = "0987678767";
			
			var e3:Employee = new Employee();
			e3.id = "3";
			e3.name = "Quốc";
			e3.address = "Quảng Ninh";
			e3.dateOfBirth = new Date(1989, 8, 28);
			e3.phoneNumber = "0987678767";
			
			var e4:Employee = new Employee();
			e4.id = "4";
			e4.name = "Đại";
			e4.address = "Hải Đảo";
			e4.dateOfBirth = new Date(1989, 8, 28);
			e4.phoneNumber = "0987678767";
			
			var e5:Employee = new Employee();
			e5.id = "5";
			e5.name = "Chung";
			e5.address = "Hà Nội";
			e5.dateOfBirth = new Date(1989, 8, 28);
			e5.phoneNumber = "0987678767";
			
			var e6:Employee = new Employee();
			e6.id = "6";
			e6.name = "Thanh";
			e6.address = "Hà Nội";
			e6.dateOfBirth = new Date(1989, 8, 28);
			e6.phoneNumber = "0987678767";
			
			var e7:Employee = new Employee();
			e7.id = "7";
			e7.name = "Nhgọc";
			e7.address = "Hà Nội";
			e7.dateOfBirth = new Date(1989, 8, 28);
			e7.phoneNumber = "0987678767";
			
			var e8:Employee = new Employee();
			e8.id = "8";
			e8.name = "Thành";
			e8.address = "Hà Nội";
			e8.dateOfBirth = new Date(1989, 8, 28);
			e8.phoneNumber = "0987678767";
			
			return new ArrayCollection([e1, e2, e3, e4, e5, e6, e7, e8]);
		}
		public function getEmployeeCalendarMon():ArrayCollection{
			var obj2:ArrayCollection = new ArrayCollection;
			obj2.addItem("Đại");
			obj2.addItem("Chung");
			obj2.addItem("Thành");
			obj2.addItem("Ngọc");
			obj2.addItem("Tú");
			
			var obj3:ArrayCollection = new ArrayCollection;
			obj2.addItem("Đại");
			obj2.addItem("Tú");
			obj2.addItem("Thành");
			obj2.addItem("Ngọc");
			obj2.addItem("Thanh");
			
			var obj4:ArrayCollection = new ArrayCollection;
			obj2.addItem("Đại");
			obj2.addItem("Tuấn");
			obj2.addItem("Loan");
			obj2.addItem("Minh");
			obj2.addItem("Tú");
			
			var obj5:ArrayCollection = new ArrayCollection;
			obj2.addItem("Đại");
			obj2.addItem("Chung");
			obj2.addItem("Thành");
			obj2.addItem("Ngọc");
			obj2.addItem("Tú");
			
			var obj6:ArrayCollection = new ArrayCollection;
			obj2.addItem("Đại");
			obj2.addItem("Nguyên");
			obj2.addItem("Thành");
			obj2.addItem("Việt");
			obj2.addItem("Tú");
			
			var obj7:ArrayCollection = new ArrayCollection;
			obj2.addItem("Đại");
			obj2.addItem("Chung");
			obj2.addItem("Thành");
			obj2.addItem("Ngọc");
			obj2.addItem("Tú");
			
			return new ArrayCollection([obj2, obj3, obj4, obj5, obj6, obj7]);
		}
		
		public function getEmployeeCalendarAft():ArrayCollection{
			var obj2:ArrayCollection = new ArrayCollection;
			obj2.addItem("Đại");
			obj2.addItem("Chung");
			obj2.addItem("Thành");
			obj2.addItem("Ngọc");
			obj2.addItem("Tú");
			
			var obj3:ArrayCollection = new ArrayCollection;
			obj2.addItem("Đại");
			obj2.addItem("Tú");
			obj2.addItem("Thành");
			obj2.addItem("Ngọc");
			obj2.addItem("Thanh");
			
			var obj4:ArrayCollection = new ArrayCollection;
			obj2.addItem("Đại");
			obj2.addItem("Tuấn");
			obj2.addItem("Loan");
			obj2.addItem("Minh");
			obj2.addItem("Tú");
			
			var obj5:ArrayCollection = new ArrayCollection;
			obj2.addItem("Đại");
			obj2.addItem("Chung");
			obj2.addItem("Thành");
			obj2.addItem("Ngọc");
			obj2.addItem("Tú");
			
			var obj6:ArrayCollection = new ArrayCollection;
			obj2.addItem("Đại");
			obj2.addItem("Nguyên");
			obj2.addItem("Thành");
			obj2.addItem("Việt");
			obj2.addItem("Tú");
			
			var obj7:ArrayCollection = new ArrayCollection;
			obj2.addItem("Đại");
			obj2.addItem("Chung");
			obj2.addItem("Thành");
			obj2.addItem("Ngọc");
			obj2.addItem("Tú");
			
			return new ArrayCollection([obj2, obj3, obj4, obj5, obj6, obj7]);
		}
		
	}
}