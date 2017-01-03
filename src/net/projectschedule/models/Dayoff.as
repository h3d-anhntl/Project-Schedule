package net.projectschedule.models
{
	import mx.controls.DateField;
	
	import net.fproject.model.AbstractModel;

	[RemoteClass(alias="FDayoff")]
	public class Dayoff extends AbstractModel
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
		
		/*public function convertDate(day:Date):Date
		{
			var d:Date = DateField.stringToDate(day,"YYYY-MM-DD");
			return d;
		}*/
	}
}