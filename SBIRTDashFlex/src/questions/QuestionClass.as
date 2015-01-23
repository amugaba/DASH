package questions
{
	import flash.display.InteractiveObject;
	
	import flashx.textLayout.elements.LinkElement;
	import flashx.textLayout.events.FlowElementMouseEvent;
	
	import mx.binding.utils.BindingUtils;
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayList;
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.validators.Validator;
	
	import spark.components.FormItem;
	import spark.components.Label;

	public class QuestionClass extends BetterFormItem
	{
		public var skipQuestions:Array = new Array();
		public var skipAnswers:Array = new Array();
		public var skipPatterns:Array = new Array();
		public var validator:Validator = null;
		public var inline:Boolean = false;
		public var isSkipped:Boolean = false;
		public var baseLabel:String;
		public var bindTargets:ArrayList = new ArrayList();
		public var replaceStrings:ArrayList = new ArrayList();
		public var helpText:String;
		
		public function QuestionClass(questionLabel:String = "")
		{
			super(helpPopup);
			baseLabel = questionLabel;
			this.label = questionLabel;
			this.multiline = true;
		}
		
		public function get answer():String
		{
			return "";
		}
		
		public function set answer(value:String):void
		{
			//to be overidden
		}
		
		public function restoreDefault():void
		{
			//to be overridden
		}
		
		public function get inputControl():UIComponent
		{
			return null;
		}
		
		public function doSkip():void
		{
			for each (var q:QuestionClass in skipQuestions)
			{
				q.restoreDefault();
				q.disable();
			}
		}
		public function undoSkip():void
		{
			for each (var q:QuestionClass in skipQuestions)
			{
				q.enable();
			}
		}
		
		public function enable():void
		{
			isSkipped = false;
		}
		public function disable():void
		{
			isSkipped = true;	
		}
		
		public function bindFunction(func:Function):void
		{
			var watcherSetter:ChangeWatcher = BindingUtils.bindSetter(func, inputControl, "text");
		}
		
		public function bindVariable(target:Object, prop:String):void
		{
			var watcherSetter:ChangeWatcher = BindingUtils.bindProperty(target, prop, inputControl, "text");
		}
		
		public function bindToQuestionLabel(target:QuestionClass, replaceStr:String):void
		{
			bindTargets.addItem(target);
			replaceStrings.addItem(replaceStr);
		}
		
		public function replaceLabel(val:String):void
		{
			for(var i:int = 0; i < bindTargets.length; i++)
			{
				var bindTarget:QuestionClass = bindTargets.getItemAt(i) as QuestionClass;
				var replaceString:String = replaceStrings.getItemAt(i) as String;
				if(val != null && val.length > 0)
				{
					var newLabel:String = bindTarget.baseLabel.replace(replaceString,val);
					bindTarget.label = newLabel;
				}
				else
					bindTarget.label = bindTarget.baseLabel;
			}
		}
		
		protected function helpPopup(evt:FlowElementMouseEvent):void {
			var linkEl:LinkElement = evt.flowElement as LinkElement;
			Alert.show(helpText);
			evt.stopImmediatePropagation();
			evt.preventDefault();
		}
	}
}