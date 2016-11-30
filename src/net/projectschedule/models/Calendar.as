package net.projectschedule.models
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="FCalendar")]
	public class Calendar
	{
		[Bindable]
		public var id:int;
		
		[Bindable]
		public var employeeId:int;
		
		[Bindable]
		public var schedule:String;
		
		public static const MON_MOR:int = 0;
		public static const MON_AFT:int = 1;
		public static const TUE_MOR:int = 2;
		public static const TUE_AFT:int = 3;
		public static const WED_MOR:int = 4;
		public static const WED_AFT:int = 5;
		public static const THU_MOR:int = 6;
		public static const THU_AFT:int = 7;
		public static const FRI_MOR:int = 8;
		public static const FRI_AFT:int = 9;
		public static const SAT_MOR:int = 10;
		public static const SAT_AFT:int = 11;
		public static const SUN_MOR:int = 12;
		public static const SUN_AFT:int = 13;
		
		public static function fromObject(item:Object):Calendar
		{
			var calendar:Calendar;
		
			calendar = new Calendar(); 
			calendar.id = item.id;
			calendar.employeeId = item.employeeId;
			calendar.schedule = item.schedule;
			return calendar;
		}
		
		public function scheduleConvertToArray( str:String):ArrayCollection
		{
			var scheduleArrayCollection:ArrayCollection = new ArrayCollection;
			var array:Array = str.split(',');
			for each(var str1:String in array)
			{			
				scheduleArrayCollection.addItem(int(str1));
			}
			return scheduleArrayCollection;
			
		}
		
	}
}