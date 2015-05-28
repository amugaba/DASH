package components
{
	import flash.geom.Rectangle;
	
	import mx.olap.aggregators.MaxAggregator;
	
	import spark.layouts.BasicLayout;
	
	public class FastScrollLayout extends BasicLayout
	{
		public var scrollSpeed:Number = 1;
		
		public function FastScrollLayout()
		{
			super();
		}
		
		public override function getVerticalScrollPositionDelta(navigationUnit:uint):Number
		{
			var maxScrollHeight:Number = target.contentHeight - target.height;
			var delta:Number = super.getVerticalScrollPositionDelta(navigationUnit) * scrollSpeed;
			if(delta + verticalScrollPosition < 0)
				return -verticalScrollPosition;
			else if(delta + verticalScrollPosition > maxScrollHeight)
				return maxScrollHeight - verticalScrollPosition;
			else
				return delta;
		}
	}
}