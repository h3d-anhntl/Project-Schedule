package net.projectschedule.service
{
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	
	import net.projectschedule.models.Employee;
	

	public class EmployeeService extends ServiceBase
	{
		public var employees:ArrayCollection = new ArrayCollection;
		public function EmployeeService()
		{ 
			url = "http://localhost:9090/web/employees";
			super();
		}
		
		private static var _serviceCal:EmployeeService;
		
		public static function getInstance():EmployeeService{
			if(_serviceCal == null){
				_serviceCal = new EmployeeService;
			}
			return _serviceCal;
		}
		
		
		
		/*public function getAll(type:Class ,completeFuntionCallBack:Function = null):ArrayCollection
		{
			var results:ArrayCollection = new ArrayCollection;
			this.send(
				function(event:ResultEvent):void{
					var temp:Array = convertXmlToArray(String(event.result));
					for each (var item:Object in temp)
						results.addItem(Employee.fromObject(item));
						
					if(completeFuntionCallBack != null ){
						completeFuntionCallBack(event);
					}
				}
			);
			return results;
		}*/
		
		
	}
}