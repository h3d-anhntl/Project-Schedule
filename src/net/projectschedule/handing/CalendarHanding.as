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
			for(var i:int=0; i< DataUtil.calendars.length; i++){
				if(getDay(2*dayOfWeek-1,2*dayOfWeek -2,Calendar(DataUtil.calendars.getItemAt(i)).schedule)){
					calendarsByDay.addItem(Calendar(DataUtil.calendars.getItemAt(i)));
				}
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
				for(var i:int = 0; i < cal.schedule.length ; i++)
				{
					if(cal.schedule.getItemAt(i) == dayOfWeek){
						calendarsMonByDay.addItem(cal);
					}
				}
			}
			return calendarsMonByDay;
		}
	}
}