package utils
{
	import flash.xml.XMLDocument;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	import mx.rpc.xml.SimpleXMLDecoder;

	public class ServiceBase 
	{
	
		public var httpService:HTTPService;/* = new HTTPService( "http://localhost:9090/web/employees");
		
		public var httpServiceCal:HTTPService = new HTTPService( "http://localhost:9090/web/calendars");*/
		
		public function ServiceBase(){
			httpService.resultFormat = "e4x";
			httpService.addEventListener(ResultEvent.RESULT, onResultHttpServiceCal);
			httpService.addEventListener(FaultEvent.FAULT, onFaultHttpServiceCal);
			
		}
		public function convertXmlToArray(file:String):Array
		{
			var xml:XMLDocument = new XMLDocument(file);
			var decoder:SimpleXMLDecoder = new SimpleXMLDecoder;
			var data:Object = decoder.decodeXML((xml));
			var items:Array = data.response.item;
			return items;
		}
		
		private var _completeHandler:Function;
		private var _faultHandler:Function;
		
		public function send(completeHandler:Function = null, faultHandler:Function = null):void{
			_completeHandler = completeHandler;
			_faultHandler = faultHandler;
			httpService.send();
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
		
		/*public function httpServiceEmpSend():void{
			httpServiceEmp.send();
		}
		
		public function httpServiceCalSend():void{
			httpServiceCal.send();
		}
		
		public function calendarDB():void
		{
			httpServiceEmpSend();
			
		}
		public function empployeeDB():void
		{
			httpServiceCal.resultFormat = "e4x";
			httpServiceCal.addEventListener(FaultEvent.FAULT, onFaultHttpServiceCal);
			httpServiceCal.addEventListener(ResultEvent.RESULT, onResultHttpServiceCal);	
			httpServiceCalSend();
		}
		
		
		
		protected function  onResultHttpServiceEmp(event:ResultEvent):void
		{
			if (_completeHandler)
				_completeHandler();
			
			var items:Array = convertXmlToArray(String(event.result));
			var employee:Employee;
			if(employeess == null)
			{
				for each (var emp:Object in items) 
				{
					employee = new Employee(); 
					employee.id = emp.id; 
					employee.address = emp.address;
					employee.dateOfBirth = DateField.stringToDate(emp.dateOfBirth,"YYYY-MM-DD");
					employee.name = emp.name;
					employee.phoneNumber = emp.phoneNumber;
					employeess.addItem(employee);
				}
			}
			
		}
		
		
		
		protected function onFaultHttpServiceEmp(event:FaultEvent):void
		{
			Alert.show(event.fault.faultString, "Fault Information");
			
		}
		
		protected function onFaultHttpServiceCal(event:FaultEvent):void
		{
			Alert.show(event.fault.faultString, "Fault Information");
			
		}*/
			
	}
}