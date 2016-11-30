package net.projectschedule.service
{
	import flash.xml.XMLDocument;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	import mx.rpc.xml.SimpleXMLDecoder;
	
	import net.fproject.serialize.Serializer;
	import net.projectschedule.models.Calendar;
	import net.projectschedule.models.Dayoff;
	import net.projectschedule.models.Employee;

	public class ServiceBase 
	{
		protected var url:String;
		public var httpService:HTTPService;
		
		public function ServiceBase(){
			httpService = new HTTPService();
			httpService.url = url;
			httpService.resultFormat = "e4x";
			httpService.addEventListener(ResultEvent.RESULT, onResultHttpServiceCal);
			httpService.addEventListener(FaultEvent.FAULT, onFaultHttpServiceCal);
			
		}
		public function convertXmlToArray(file:String):Array
		{
			var xml:XMLDocument = new XMLDocument(file);
			var decoder:SimpleXMLDecoder = new SimpleXMLDecoder;
			var data:Object = decoder.decodeXML((xml));
			if(data.response.item is Array){
				
				var items:Array = data.response.item;
			}
			else{
				items = new Array;
				items.push(data.response.item);
			}
			return items;
		}
		
		private var _completeHandler:Function;
		private var _faultHandler:Function;
		
		public function send(completeHandler:Function = null, faultHandler:Function = null):void{
			_completeHandler = completeHandler;
			_faultHandler = faultHandler;
			httpService.method = "GET";
			httpService.send();
		}
		
		public function save(data:Object, completeHandler:Function = null, faultHandler:Function = null):void{
			_completeHandler = completeHandler;
			_faultHandler = faultHandler;
			httpService.method = "POST";
			httpService.contentType = "application/json";
			httpService.resultFormat = "text";
			httpService.useProxy = false;
			httpService.makeObjectsBindable = true;
			httpService.showBusyCursor = true;
			httpService.send( Serializer.getInstance().toJSON(data));
		}
		
		public function onResultHttpServiceCal(event:ResultEvent):void
		{
			if (_completeHandler != null)
				_completeHandler(event);
		}
		
		public function onFaultHttpServiceCal(event:FaultEvent):void
		{
			if (_faultHandler != null)
				_faultHandler(event);
				
		}
		public function getAll(type:Class ,completeFuntionCallBack:Function = null):ArrayCollection
		{
			var results:ArrayCollection = new ArrayCollection;
			this.send(
				function(event:ResultEvent):void{
					var temp:Array = convertXmlToArray(String(event.result));
					for each (var item:Object in temp)
					{
						if(type == Employee){
							results.addItem(Employee.fromObject(item));
						}
						else if(type == Calendar){
							results.addItem(Calendar.fromObject(item));
						}
						else if(type == Dayoff){
							results.addItem(Dayoff.fromObject(item));
						}
					}
						
					
					if(completeFuntionCallBack != null ){
						completeFuntionCallBack(event);
					}
				}
			);
			return results;
		}
			
	}
}