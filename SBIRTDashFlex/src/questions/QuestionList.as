package questions
{
	import flash.display.InteractiveObject;
	
	import mx.binding.utils.BindingUtils;
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayList;
	import mx.core.UIComponent;
	
	import spark.components.DropDownList;
	import spark.events.IndexChangeEvent;

	public class QuestionList extends QuestionClass
	{
		public var input:DropDownList;
		public var defaultValue:int;

		public function QuestionList(label:String,choices:ArrayList,defaultValue:int,editable:Boolean=true)
		{
			super(label);
			input = new DropDownList();
			this.addElement(input);
			input.dataProvider = choices;
			this.defaultValue = defaultValue;
			input.selectedIndex = defaultValue;
			this.enabled = editable;
		}
		
		public override function get answer():String
		{
			return input.selectedItem;
		}
		public override function set answer(value:String):void
		{
			if(input.dataProvider.getItemIndex(value) >= 0)
				input.selectedIndex = input.dataProvider.getItemIndex(value);
		}
		
		public function get answerIndex():int
		{
			return input.selectedIndex + 1;
		}
		
		public function set answerIndex(value:int):void
		{
			if(value > 0 && value <= input.dataProvider.length)
				input.selectedIndex = value - 1;
		}
		
		public override function restoreDefault():void
		{
			input.selectedIndex = defaultValue;
			this.input.dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE,false,false));
		}
		
		public override function get inputControl():UIComponent
		{
			return input;
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
		}
		
		public override function bindToQuestionLabel(target:QuestionClass, replaceStr:String):void
		{
			super.bindToQuestionLabel(target, replaceStr);
			var watcherSetter:ChangeWatcher = BindingUtils.bindSetter(replaceLabel, input, "selectedItem");
		}
	}
}