package net.projectschedule.service
{
	import mx.collections.ArrayCollection;
	
	import net.fproject.active.ActiveDataProvider;
	import net.fproject.active.ActiveService;
	import net.fproject.active.DbCriteria;
	

	[RemoteObject(destination="schedule-server", modelClass="net.projectschedule.models.Employee", uri="/employees")]
	public class EmployeeService extends ActiveService
	{
		public var employees:ArrayCollection = new ArrayCollection;
		public function EmployeeService()
		{ 
			//url = "http://localhost:9090/web/employees";
			super();
		}
		
		private static var _serviceCal:EmployeeService;
		
		public static function getInstance():EmployeeService{
			if(_serviceCal == null){
				_serviceCal = new EmployeeService;
			}
			return _serviceCal;
		}
		
		public function getEmployees():ActiveDataProvider
		{
			
			var criteria:DbCriteria = new DbCriteria(
				{
					condition: "@findAllCondition"
				});
			
			return this.createDataProvider(criteria) as ActiveDataProvider;
		}
		
		
	}
}