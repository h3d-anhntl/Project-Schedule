package net.projectschedule.service
{
	import net.fproject.active.ActiveDataProvider;
	import net.fproject.active.ActiveService;
	import net.fproject.active.DbCriteria;

	[RemoteObject(destination="schedule-server", modelClass="net.projectschedule.models.Dayoff", uri="/employees")]
	public class DayoffService extends ActiveService
	{
		private static var _serviceDayoff:DayoffService;
		public static function getInstance():DayoffService{
			if(_serviceDayoff == null){
				_serviceDayoff = new DayoffService;
			}
			return _serviceDayoff;
		}
		
		public function getDayoffs():ActiveDataProvider
		{
			
			var criteria:DbCriteria = new DbCriteria(
				{
					condition: "@findAllCondition"
				});
			
			return this.createDataProvider(criteria) as ActiveDataProvider;
		}
	}
}