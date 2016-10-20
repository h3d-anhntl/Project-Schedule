package models
{
	import mx.collections.ArrayCollection;
	[Bindable]
	public class Calendar
	{
		public var id:String;
		public var startDate:Date;
		public var endDate:Date;
		public var employeeId:String;
		public var schedule:ArrayCollection;
		public var isWorking:Boolean = true;
		
		public static const MON_MOR:String = "0";
		public static const MON_AFT:String = "1";
		public static const TUE_MOR:String = "2";
		public static const TUE_AFT:String = "3";
		public static const WED_MOR:String = "4";
		public static const WED_AFT:String = "5";
		public static const THU_MOR:String = "6";
		public static const THU_AFT:String = "7";
		public static const FRI_MOR:String = "8";
		public static const FRI_AFT:String = "9";
		public static const SAT_MOR:String = "10";
		public static const SAT_AFT:String = "11";
		public static const SUN_MOR:String = "12";
		public static const SUN_AFT:String = "13";
		
		
	}
}