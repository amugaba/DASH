package questions
{
	import flash.display.InteractiveObject;
	
	import mx.collections.ArrayList;
	import mx.events.ValidationResultEvent;
	
	import spark.components.DropDownList;
	import spark.components.TextInput;
	import spark.events.IndexChangeEvent;
	
	public class QuestionTextRefusable extends QuestionText
	{
		public var refuseInput:DropDownList;
		
		public function QuestionTextRefusable(label:String, defaultValue:String, editable:Boolean=true)
		{
			super(label, defaultValue, editable);
			this.input.width = 50;
			refuseInput = new DropDownList();
			refuseInput.dataProvider = new ArrayList(["","Missing Data"]);
			this.addElement(refuseInput);
			refuseInput.width = 90;
			this.direction = "horizontal";
			refuseInput.addEventListener(IndexChangeEvent.CHANGE,refusedHandler);
		}
		
		public override function get answer():String
		{
			if(refuseInput.selectedIndex == 1)
				return "-9";
			return input.text;
		}
		public override function set answer(value:String):void
		{
			if(value == "-9")
			{
				refuseInput.selectedIndex = 1;
				input.text = defaultValue;
				input.enabled = false;
				if(validator != null)
				{
					var evt:ValidationResultEvent = new ValidationResultEvent(ValidationResultEvent.VALID);
					validator.dispatchEvent(evt);
				}
			}
			else
				input.text = value;
		}
		
		public override function restoreDefault():void
		{
			input.text = defaultValue;
			refuseInput.selectedIndex = 0;
			input.enabled = true;
		}
		
		public function refusedHandler(event:IndexChangeEvent):void
		{
			if(refuseInput.selectedIndex > 0)
			{
				input.text = defaultValue;
				input.enabled = false;
				if(validator != null)
				{
					var evt:ValidationResultEvent = new ValidationResultEvent(ValidationResultEvent.VALID);
					validator.dispatchEvent(evt);
				}
			}
			else
			{
				if(!isSkipped)
					input.enabled = true;
			}
		}
		
		public override function enable():void
		{
			super.enable();
			if(inline)
			{
				if(refuseInput.selectedIndex == 0)
					input.enabled = true;
				refuseInput.enabled = true;
			}
		}
		public override function disable():void
		{
			super.disable();
			if(inline)
				refuseInput.enabled = false;
		}
	}
}