package components.questions
{
	import mx.core.UIComponent;
	import mx.events.ValidationResultEvent;
	
	import spark.components.Group;
	import spark.components.TextArea;

	public class QuestionTextArea extends QuestionClass
	{
		public var input:TextArea;
		public var defaultValue:String;		
		
		public function QuestionTextArea(label:String,defaultValue:String,editable:Boolean=true)
		{
			super("",label);
			var group:Group = new Group();
			addElement(group);
			input = new TextArea();
			group.addElement(input);
			this.defaultValue = defaultValue;
			input.text = defaultValue;
			this.enabled = editable;
			input.width = 500;
			input.height = 150;
			input.x = -400;
			input.y = 20;
		}
		
		public override function get answer():String
		{
			return input.text;
		}
		public override function set answer(value:String):void
		{
			input.text = value;
		}
		
		public override function restoreDefault():void
		{
			input.text = defaultValue;
		}
		
		public override function get inputControl():UIComponent
		{
			return input;
		}
		
		public override function removeErrorMessage():void
		{
			input.errorString = "";
		}
		
		public override function enable():void
		{
			isSkipped = false;
			if(!inline)
				enabled = true;
			else
				input.enabled = true;
		}
		public override function disable():void
		{
			isSkipped = true;
			if(!inline)
				enabled = false;
			else
				input.enabled = false;	
			if(validator != null)
			{
				var evt:ValidationResultEvent = new ValidationResultEvent(ValidationResultEvent.VALID);
				validator.dispatchEvent(evt);
			}
		}
	}
}