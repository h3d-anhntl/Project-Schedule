package net.projectschedule.gui.view
{
	import mx.controls.DateField;
	import mx.core.ClassFactory;
	import mx.events.FlexEvent;
	
	import spark.components.DataGroup;
	import spark.components.supportClasses.SkinnableComponent;
	
	import net.fproject.di.Injector;
	import net.projectschedule.gui.components.ListLabel;
	
	[EventHandling(event="creationComplete",handler="module_creationCompleteHandler")]
	
	public class LichTongQuat extends SkinnableComponent
	{
		public function LichTongQuat()
		{
			Injector.inject(this);
		}
		
		public function module_creationCompleteHandler(event:FlexEvent):void
		{
			var day:Date = new Date;
			tuNgay.selectedDate = day;
			denNgay.selectedDate = day;
		}
		
		public var ListLabelItemRender:ClassFactory = new ClassFactory(ListLabel);
		
		[SkinPart(required="true")]
		public var tuNgay:DateField;
		
		[SkinPart(required="true")]
		public var denNgay:DateField;
		
		[SkinPart(required="true")]
		[PropertyBinding(itemRenderer="ListLabelItemRender")]
		public var mon:DataGroup;
		
		[SkinPart(required="true")]
		[PropertyBinding(itemRenderer="ListLabelItemRender")]
		public var aft:DataGroup;
	}
}