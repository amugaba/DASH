package components
{
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
			return super.getVerticalScrollPositionDelta(navigationUnit) * scrollSpeed;
		}
	}
}