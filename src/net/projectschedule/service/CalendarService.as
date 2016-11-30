package net.projectschedule.service
{
	import mx.collections.ArrayCollection;
	
	import net.fproject.active.ActiveDataProvider;
	import net.fproject.active.ActiveService;
	import net.fproject.active.DbCriteria;
	

	[RemoteObject(destination="schedule-server", modelClass="net.projectschedule.models.Calendar", uri="/calendars")]
	public class CalendarService extends ActiveService
	{
		private static var _serviceCal:CalendarService;
		public static function getInstance():CalendarService{
			if(_serviceCal == null){
				_serviceCal = new CalendarService;
			}
			return _serviceCal;
		}
		
		public function getCalendars():ActiveDataProvider
		{
			
			var criteria:DbCriteria = new DbCriteria(
				{
					condition: "@findAllCondition"
				});
			
			return this.createDataProvider(criteria) as ActiveDataProvider;
		}
	}
}