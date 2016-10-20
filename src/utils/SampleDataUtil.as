package utils
{
	import mx.collections.ArrayCollection;
	
	import models.Calendar;
	import models.Employee;
	

	[Bindable]
	public class SampleDataUtil
	{
		
		public function getEmployee(id:String):Employee{
			for(var i:int = 0; i< getEmployees().length-1 ; i++){
				var em:Employee = Employee(getEmployees().getItemAt(i));
				if(em.id == id){
					return em;
				}
			}
			return null;
		}
		
		public function getDay(mor:String, aft:String, schedule:ArrayCollection):Boolean{
			for(var i:int = 0; i < schedule.length-1 ; i++){
				if(schedule.getItemAt(i) == mor || schedule.getItemAt(i) == aft){
					return true;
				}
			}
			return false;
		}
		public function getEmployeebyDay(dayOfWeek:String):ArrayCollection{
			var dataEmployeeDay:ArrayCollection = new ArrayCollection;
			if(dayOfWeek == "1"){
				for(var i1:int=0; i1< searchDay().length-1; i1++){
					if(getDay("0","1",Calendar(searchDay().getItemAt(i1)).schedule)){
						dataEmployeeDay.addItem(getEmployee(Calendar(searchDay().getItemAt(i1)).employeeId));
					}
				}
			}
			else if(dayOfWeek == "2"){
				for(var i2:int=0; i2< searchDay().length-1; i2++){
					if(getDay("2","3",Calendar(searchDay().getItemAt(i2)).schedule)){
						dataEmployeeDay.addItem(getEmployee(Calendar(searchDay().getItemAt(i2)).employeeId));
					}
				}
			}
			else if(dayOfWeek == "3"){
				for(var i3:int=0; i3< searchDay().length-1; i3++){
					if(getDay("4","5",Calendar(searchDay().getItemAt(i3)).schedule)){
						dataEmployeeDay.addItem(getEmployee(Calendar(searchDay().getItemAt(i3)).employeeId));
					}
				}
			}
			else if(dayOfWeek == "4"){
				for(var i4:int=0; i4< searchDay().length-1; i4++){
					if(getDay("6","7",Calendar(searchDay().getItemAt(i4)).schedule)){
						dataEmployeeDay.addItem(getEmployee(Calendar(searchDay().getItemAt(i4)).employeeId));
					}
				}
			}
			else if(dayOfWeek == "5"){
				for(var i5:int=0; i5< searchDay().length-1; i5++){
					if(getDay("8","9",Calendar(searchDay().getItemAt(i5)).schedule)){
						dataEmployeeDay.addItem(getEmployee(Calendar(searchDay().getItemAt(i5)).employeeId));
					}
				}
			}
			else if(dayOfWeek == "6"){
				for(var i6:int=0; i6< searchDay().length-1; i6++){
					if(getDay("10","11",Calendar(searchDay().getItemAt(i6)).schedule)){
						dataEmployeeDay.addItem(getEmployee(Calendar(searchDay().getItemAt(i6)).employeeId));
					}
				}
			}
			return dataEmployeeDay;
		}
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
			obj3.addItem("Đại");
			obj3.addItem("Tú");
			obj3.addItem("Thành");
			obj3.addItem("Ngọc");
			obj3.addItem("Thanh");
			
			var obj4:ArrayCollection = new ArrayCollection;
			obj4.addItem("Đại");
			obj4.addItem("Tuấn");
			obj4.addItem("Loan");
			obj4.addItem("Minh");
			obj4.addItem("Tú");
			
			var obj5:ArrayCollection = new ArrayCollection;
			obj5.addItem("Đại");
			obj5.addItem("Chung");
			obj5.addItem("Thành");
			obj5.addItem("Ngọc");
			obj5.addItem("Tú");
			
			var obj6:ArrayCollection = new ArrayCollection;
			obj6.addItem("Đại");
			obj6.addItem("Nguyên");
			obj6.addItem("Thành");
			obj6.addItem("Việt");
			obj6.addItem("Tú");
			
			var obj7:ArrayCollection = new ArrayCollection;
			obj7.addItem("Đại");
			obj7.addItem("Chung");
			obj7.addItem("Thành");
			obj7.addItem("Ngọc");
			obj7.addItem("Tú");
			
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
			obj3.addItem("Đại");
			obj3.addItem("Tú");
			obj3.addItem("Thành");
			obj3.addItem("Ngọc");
			obj3.addItem("Thanh");
			
			var obj4:ArrayCollection = new ArrayCollection;
			obj4.addItem("Đại");
			obj4.addItem("Tuấn");
			obj4.addItem("Loan");
			obj4.addItem("Minh");
			obj4.addItem("Tú");
			
			var obj5:ArrayCollection = new ArrayCollection;
			obj5.addItem("Đại");
			obj5.addItem("Chung");
			obj5.addItem("Thành");
			obj5.addItem("Ngọc");
			obj5.addItem("Tú");
			
			var obj6:ArrayCollection = new ArrayCollection;
			obj6.addItem("Đại");
			obj6.addItem("Nguyên");
			obj6.addItem("Thành");
			obj6.addItem("Việt");
			obj6.addItem("Tú");
			
			var obj7:ArrayCollection = new ArrayCollection;
			obj7.addItem("Đại");
			obj7.addItem("Chung");
			obj7.addItem("Thành");
			obj7.addItem("Ngọc");
			obj7.addItem("Tú");
			
			return new ArrayCollection([obj2, obj3, obj4, obj5, obj6, obj7]);
		}
		
		public function searchDay():ArrayCollection{
			var obj1:Calendar = new Calendar;
			obj1.id = "1";
			obj1.employeeId = "1";
			obj1.schedule = new ArrayCollection;
			obj1.schedule.addItem(Calendar.MON_MOR);
			obj1.schedule.addItem(Calendar.SAT_MOR);
			obj1.schedule.addItem(Calendar.FRI_MOR);			
			obj1.schedule.addItem(Calendar.TUE_MOR);
			
			var obj2:Calendar = new Calendar;
			obj2.id = "2";
			obj2.employeeId = "2";
			obj2.schedule = new ArrayCollection;
			obj2.schedule.addItem(Calendar.MON_AFT);
			obj2.schedule.addItem(Calendar.SAT_AFT);
			obj2.schedule.addItem(Calendar.FRI_AFT);
			obj2.schedule.addItem(Calendar.THU_AFT);
			
			var obj3:Calendar = new Calendar;
			obj3.id = "3";
			obj3.employeeId = "3";
			obj3.schedule = new ArrayCollection;
			obj3.schedule.addItem(Calendar.MON_MOR);
			obj3.isWorking = false;
			
			return new ArrayCollection([obj1, obj2, obj3])
		}
		
	}
}