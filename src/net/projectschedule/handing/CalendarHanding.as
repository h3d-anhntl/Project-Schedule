package net.projectschedule.handing
{
	import mx.collections.ArrayCollection;
	
	import net.projectschedule.models.Calendar;
	import net.projectschedule.utils.DataUtil;

	public class CalendarHanding
	{
		public function CalendarHanding()
		{
			super();
		}
		
		public function getDay(mor:int, aft:int, schedule:ArrayCollection):Boolean{
			for(var i:int = 0; i <= schedule.length-1 ; i++){
				if((int(schedule.getItemAt(i)) == mor) || (int(schedule.getItemAt(i)) == aft)){
					return true;
				}
			}
			return false;
		}
		
		/*Dua ra cac lich cua moi ng trong ngay can tim*/
		public function searchCalenerByDay(dayOfWeek:int):ArrayCollection{
			var calendarsByDay:ArrayCollection = new ArrayCollection;
			var calendars:ArrayCollection = DataUtil.calendars;
			for each(var cal:Calendar in DataUtil.calendars)
			{
				var scheduleArray:ArrayCollection = Calendar(cal).scheduleConvertToArray(Calendar(cal).schedule);
				if(getDay(2*dayOfWeek-1,2*dayOfWeek -2,scheduleArray))
					calendarsByDay.addItem(cal as Calendar);	
			}
			return calendarsByDay;
		}
		
		/*Dua ra cac lich vao buoi chieu theo ngay can tim*/
		public function getCalendarAftOfDay(dayOfWeek:int):ArrayCollection{
			return getCalenderOfDay(2*dayOfWeek-1);
		}
		
		/*Dua ra cac lich vao buoi sang theo ngay can tim*/
		public function getCalendarMonOfDay(dayOfWeek:int):ArrayCollection
		{
			return getCalenderOfDay(2*dayOfWeek-2);
		}
		
		public function getCalenderOfDay(dayOfWeek:int):ArrayCollection
		{
			var calendarsMonByDay:ArrayCollection = new ArrayCollection;
			for(var j:int = 0 ; j< searchCalenerByDay((dayOfWeek+2)/2).length; j++)
			{
				var cal:Calendar = searchCalenerByDay((dayOfWeek+2)/2).getItemAt(j) as Calendar;
				var scheduleArray:ArrayCollection = cal.scheduleConvertToArray(cal.schedule);
				for(var i:int = 0; i < scheduleArray.length ; i++)
				{
					if(scheduleArray.getItemAt(i) == dayOfWeek){
						calendarsMonByDay.addItem(cal);
					}
				}
			}
			return calendarsMonByDay;
		}
		
		public var mor:ArrayCollection = new ArrayCollection([0 ,2 ,4 ,6 ,8 ,10 ]);
		public var aft:ArrayCollection = new ArrayCollection([1 ,3 ,5 ,7 ,9 ,11 ]);
		//ham dua ra danh sach lich cua moi ng theo buoi 
		//tham so truyen vao la buoi sang hoac chieu + mang cac buoi trong ngay
		public function getCalendarOfWeek(choseArray:ArrayCollection):ArrayCollection
		{
			var calendarOfWeek:ArrayCollection = new ArrayCollection;
			var calendars:ArrayCollection = DataUtil.calendars;
			for each (var m:int in choseArray){
				var monOfWeek:ArrayCollection = new ArrayCollection;
				for each(var cal:Calendar in calendars)
				{
					var scheduleArray:ArrayCollection = cal.scheduleConvertToArray(cal.schedule);
					for each(var i:int in scheduleArray)
					{
						if(i == m)
							monOfWeek.addItem(cal);
					}
				}
				calendarOfWeek.addItem(monOfWeek);
			}
			
			return calendarOfWeek;
		}
		
		public function getCalendarMonOfWeek():ArrayCollection
		{
			return getCalendarOfWeek(mor);
		}
		
		public function getCalendarAftOfWeek():ArrayCollection
		{
			return getCalendarOfWeek(aft);
		}
	}
}