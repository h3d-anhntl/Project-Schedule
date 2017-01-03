package net.projectschedule.handing
{
	import mx.collections.ArrayCollection;
	
	import net.fproject.core.Time;
	import net.fproject.core.TimeUnit;
	import net.fproject.utils.DateTimeUtil;
	import net.projectschedule.models.Dayoff;
	import net.projectschedule.utils.DataUtil;

	public class DayoffHanding
	{
		public function DayoffHanding()
		{
		}
		
		public function dayoffByDay(day:Date):ArrayCollection
		{
			var dayoffs:ArrayCollection = DataUtil.dayoff;
			var listdayoffByDay:ArrayCollection = new ArrayCollection;
			for each(var d:Dayoff in dayoffs)
			{
				//DateTimeUtil.compareDatePart(d.day_off,day)
				if(DateTimeUtil.compareDatePart(d.day_off,day) == 0)
					listdayoffByDay.addItem(d);
			}
			return listdayoffByDay;
		}
	}
}