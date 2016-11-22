package net.projectschedule.events
{
	import flash.events.Event;
	
	public class CheckBoxEvent extends Event
	{
		public var userS
		public function CheckBoxEvent(type:String, bubbles:Boolean=true)
		{
			super(type, bubbles);
		}
	}
}