package feedback
{
	import mx.collections.ArrayList;

	public class DataConcern
	{
		public var summary:String;
		public var explanation:String;
		public var importance:Number;
		
		public var goal:Number = 0;
		public var isAverageGoal:Boolean = true;
		public var stdDev:Number = 0;
		public var currentValue:Number;
		public var isPercent:Boolean = false;
		public var minAcceptableDeviation:Number = Number.MIN_VALUE;
		public var maxAcceptableDeviation:Number = Number.MAX_VALUE;
		public var score:Number = 0;
		
		public var solutions:ArrayList = new ArrayList();
		
		public function DataConcern(summary:String, importance:int, averageGoal:Boolean, percentValue:Boolean, explanation:String)
		{
			this.summary = summary;
			this.explanation = explanation;
			this.importance = importance;
			this.isAverageGoal = averageGoal;
			this.isPercent = percentValue;
		}
		
		//the percent difference between the current value and the goal
		//the deviation will be negative if current value is less than the goal
		public function deviation():Number
		{
			if(isAverageGoal && goal != 0)
				return (currentValue - goal)/goal;
			else
				return (currentValue - goal);
		}
		
		public function calculateScore():void
		{
			if(deviation() > minAcceptableDeviation && deviation() < maxAcceptableDeviation)
				score = 0;
			else
				score = Math.abs(deviation()) * importance;
		}
		
		public function toString():String
		{
			return summary + " - Dev = " + deviation() + ", Score = " + score;
		}
	}
}