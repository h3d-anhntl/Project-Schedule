package net.projectschedule.service
{
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	
	import net.projectschedule.models.Calendar;
	

	public class CalendarService extends ServiceBase
	{
		public var workingEmpoloyee:ArrayCollection = new ArrayCollection;
		public var leaveEmployee:ArrayCollection = new ArrayCollection;
		public function CalendarService()
		{
			url = "http://localhost:9090/web/calendars";
			super();
		}
		
		private static var _serviceCal:CalendarService;
		public static function getInstance():CalendarService{
			if(_serviceCal == null){
				_serviceCal = new CalendarService;
			}
			return _serviceCal;
		}	
		/**
		 * null: today
		 */
		public function getWorkingEmp():ArrayCollection
		{
			return workingEmpoloyee;
		}
		
		/**
		 * null --> today
		 */
		public function getLeaveEmp():ArrayCollection
		{
			return leaveEmployee;
		}
		/*public function getAll(completeFuntionCallBack:Function = null):ArrayCollection{
			var results:ArrayCollection = new ArrayCollection;
			this.send(
				function (event:ResultEvent):void{
					var temp:Array = convertXmlToArray(String(event.result));
					for each(var item:Object in temp){
						results.addItem(Calendar.fromObject(item));
					}
					
					if(completeFuntionCallBack != null){
						completeFuntionCallBack(event);
					}
				}				
			)
			
			return results;
		}*/
	}
}