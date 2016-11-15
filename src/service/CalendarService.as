package service
{
	import mx.collections.ArrayCollection;
	import mx.rpc.http.mxml.HTTPService;
	
	import models.Calendar;
	
	import utils.ServiceBase;

	public class CalendarService extends ServiceBase
	{
		public var calendars:ArrayCollection = new ArrayCollection;
		public var workingEmpoloyee:ArrayCollection = new ArrayCollection;
		public var leaveEmployee:ArrayCollection = new ArrayCollection;
		public function CalendarService()
		{
			httpService = new HTTPService("http://localhost:9090/web/calendars");
			super();
		}
		
		private static var _serviceCal:CalendarService;
		public static function getInstance():CalendarService{
			if(_serviceCal == null){
				_serviceCal = new CalendarService;
			}
			return _serviceCal;
		}
		public function getDay(mor:int, aft:int, schedule:ArrayCollection):Boolean{
			for(var i:int = 0; i <= schedule.length-1 ; i++){
				if((int(schedule.getItemAt(i)) == mor) || (int(schedule.getItemAt(i)) == aft)){
					return true;
				}
			}
			return false;
		}
		
		/*Dua ra cac lich cua tung ng trong ngay can tim*/
		public function searchCalenerByDay(dayOfWeek:int):ArrayCollection{
			var calendarsByDay:ArrayCollection = new ArrayCollection;
			for(var i:int=0; i< calendars.length; i++){
				if(getDay(2*dayOfWeek-1,2*dayOfWeek -2,Calendar(calendars.getItemAt(i)).schedule)){
					calendarsByDay.addItem(Calendar(calendars.getItemAt(i)));
				}
			}
			return calendarsByDay;
		}
		
		/*Dua ra cac lich vao buoi chieu theo ngay can tim*/
		public function getCalendarAftOfDay(dayOfWeek:int):ArrayCollection{
			var calendarsAftByDay:ArrayCollection = new ArrayCollection;
			for(var j:int = 0 ; j< searchCalenerByDay(dayOfWeek).length; j++)
			{
				var cal:Calendar = searchCalenerByDay(dayOfWeek).getItemAt(j) as Calendar;
				for(var i:int = 0; i < cal.schedule.length-1 ; i++){
					if(cal.schedule.getItemAt(i) == 2*dayOfWeek-1){
						calendarsAftByDay.addItem(cal);
					}
				}
			}			
			return calendarsAftByDay;
		}
		
		/*Dua ra cac lich vao buoi sang theo ngay can tim*/
		public function getCalendarMonOfDay(dayOfWeek:int):ArrayCollection
		{
			var calendarsMonByDay:ArrayCollection = new ArrayCollection;
			for(var j:int = 0 ; j< searchCalenerByDay(dayOfWeek).length; j++)
			{
				var cal:Calendar = searchCalenerByDay(dayOfWeek).getItemAt(j) as Calendar;
				for(var i:int = 0; i < cal.schedule.length ; i++)
				{
					if(cal.schedule.getItemAt(i) == 2*dayOfWeek-2){
						calendarsMonByDay.addItem(cal);
					}
				}
			}
			return calendarsMonByDay;
		}
		/**
		 * null: today
		 */
		public function getWorkingEmp():ArrayCollection
		{
			/*for(var i:int = 0; i < calendarsByDay.length ; i++){
				if(Calendar(calendarsByDay.getItemAt(i)).isWorking){
					workingEmpoloyee.addItem(calendarsByDay.getItemAt(i));
				}
			}*/
			return workingEmpoloyee;
		}
		
		/**
		 * null --> today
		 */
		public function getLeaveEmp():ArrayCollection
		{
			/*for(var i:int = 0; i < calendarsByDay.length ; i++){
				if(!Calendar(calendarsByDay.getItemAt(i)).isWorking){
					leaveEmployee.addItem(calendarsByDay.getItemAt(i));
				}
			}*/
			return leaveEmployee;
		}
	}
}