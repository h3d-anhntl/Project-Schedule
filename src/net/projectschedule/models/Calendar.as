package net.projectschedule.models
{
	import mx.collections.ArrayCollection;
	import mx.controls.DateField;

	[Bindable]
	public class Calendar
	{
		public var id:String;
		public var startDate:Date;
		public var endDate:Date;
		public var employeeId:String;
		public var schedule:ArrayCollection;
		public var isWorking:Boolean = true;
		
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
			if(item.startDate == null){
				calendar.startDate = null;
			}else{
				calendar.startDate = DateField.stringToDate(item.startDate,"YYYY-MM-DD");
			}
			
			if(item.endDate == null){
				calendar.endDate = null;
			}else{
				calendar.endDate = DateField.stringToDate(item.endDate,"YYYY-MM-DD");
			}
			calendar.isWorking = item.isWorking;
			calendar.employeeId = item.employeeId;
			calendar.schedule = new ArrayCollection;
			var array:Array = item.schedule.split(',');
			for each(var str:String in array)
			{
				
				calendar.schedule.addItem(int(str));
			}
			
			return calendar;
		}
		
	}
}