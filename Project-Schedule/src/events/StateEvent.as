package events
{
	import flash.events.Event;
	
	public class StateEvent extends Event
	{
		
		public var idBt:String;
		public function StateEvent(type:String, idbt:String)
		{
			super(type, true);
			this.idBt = idbt;
		}
	}
}