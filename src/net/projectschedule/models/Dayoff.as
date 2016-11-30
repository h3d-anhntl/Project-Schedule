package net.projectschedule.models
{
	[RemoteClass(alias="FDayoff")]
	public class Dayoff
	{
		[Bindable]
		public var id:int;
		
		[Bindable]
		public var day_off:Date;
		
		[Bindable]
		public var morning:Boolean;
		
		[Bindable]
		public var afternoon:Boolean;
		
		[Bindable]
		public var employeeId:int;
		
		[Bindable]
		public var createtime:Date;
		/*public static function fromObject(item:Object):Dayoff
		{
			var dayoff:Dayoff
			
			dayoff = new Dayoff();
			dayoff.id = item.hasOwnProperty('id') ? item['id'] : "";
			dayoff.day_off = item.hasOwnProperty('day_off') ? DateField.stringToDate(item['day_off'],"YYYY-MM-DD") : null;
			dayoff.morning = item.hasOwnProperty('morning') ? item['morning'] : "";
			dayoff.afternoon = item.hasOwnProperty('afternoon') ? item['afternoon'] : "";
			dayoff.employeeId = item.hasOwnProperty('employeeId') ? item['employeeId'] : "";
			dayoff.createtime = item.hasOwnProperty('createtime') ? DateField.stringToDate(item['createtime'],"YYYY-MM-DD") : null;
			return dayoff;
		}*/
	}
}