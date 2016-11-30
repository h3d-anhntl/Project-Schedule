package net.projectschedule.handing
{
	import mx.collections.ArrayCollection;
	
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
				if(d.day_off == day)
					listdayoffByDay.addItem(d);
			}
			return listdayoffByDay;
		}
	}
}