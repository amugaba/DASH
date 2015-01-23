package feedback
{
	import valueObjects.DataReportVO;

	public class DataReportDetailed
	{
		public var month:int;
		public var year:int;
		public var uniquePatients:int;
		public var patientsEligible:int;
		public var prescreens:int;
		public var validPrescreens:int;
		public var alcoholPrescreens:int;
		public var drugPrescreens:int;
		public var bothPrescreens:int;
		public var screens:int;
		public var isNotScreening:int;
		public var possibleScreens:int;
		public var screensOfPossible:int;
		public var educationScores:int;
		public var biScores:int;
		public var btScores:int;
		public var rtScores:int;
		public var bis:int;
		public var bts:int;
		public var rts:int;
		public var otherComments:String;
		
		//Advanced Stats
		public var monthYear:int;
		public var aodPrescreens:int;
		public var negativePrescreens:int;
		public var positiveScreens:int;
		public var invalidPrescreens:int;
		public var missedPrescreens:int;
		public var services:int;
		
		public var alcoholRate:Number;
		public var drugRate:Number;
		
		public var prescreenCaptureRate:Number = 0;
		public var screenCaptureRate:Number = 0;
		public var serviceCaptureRate:Number = 0;
		public var positivePrescreenRate:Number;
		public var positiveScreenRate:Number;

		public function DataReportDetailed(report:DataReportVO)
		{
			month = report.month;
			year = report.year;
			uniquePatients = report.uniquePatients;
			patientsEligible = report.patientsEligible;
			prescreens = report.prescreens;
			validPrescreens = report.validPrescreens;
			alcoholPrescreens = report.alcoholPrescreens;
			drugPrescreens = report.drugPrescreens;
			bothPrescreens = report.bothPrescreens;
			screens = report.screens;
			isNotScreening = report.isNotScreening;
			possibleScreens = report.possibleScreens;
			screensOfPossible = report.screensOfPossible;
			educationScores = report.educationScores;
			biScores = report.biScores;
			btScores = report.btScores;
			rtScores = report.rtScores;
			bis = report.bis;
			bts = report.bts;
			rts = report.rts;
			otherComments = report.otherComments;
			
			generateStats();			
		}
		
		//Generate advanced statistics
		private function generateStats():void
		{
			aodPrescreens = sumWithMissing([alcoholPrescreens, drugPrescreens, bothPrescreens]);
			
			if(prescreens >= 0 && alcoholPrescreens >= 0 && drugPrescreens >= 0 && bothPrescreens >= 0)
				negativePrescreens = prescreens - aodPrescreens;
			else
				negativePrescreens = -9;
			
			positiveScreens = sumWithMissing([biScores, btScores, rtScores]);
			
			if(prescreens >= 0 && validPrescreens >= 0)
				invalidPrescreens = prescreens - validPrescreens;
			else
				invalidPrescreens = -9;
			
			if(patientsEligible >= 0 && validPrescreens >= 0)
				missedPrescreens = patientsEligible - validPrescreens;
			else
				missedPrescreens = -9;
			
			services = sumWithMissing([bis, bts, rts]);
			
			if(prescreens >= 0)
			{
				alcoholRate = sumWithMissing([alcoholPrescreens, bothPrescreens])*1.0/prescreens;
				drugRate = sumWithMissing([drugPrescreens, bothPrescreens])*1.0/prescreens;
				positivePrescreenRate = aodPrescreens*1.0/prescreens;
			}
			else
			{
				alcoholRate = -9;
				drugRate = -9;
				positivePrescreenRate = -9;
			}
			
			if(screens >= 0)
				positiveScreenRate = positiveScreens*1.0/screens;
			else
				positiveScreenRate = -9;
			
			if(patientsEligible > 0 && validPrescreens >= 0)
				prescreenCaptureRate = validPrescreens*1.0/patientsEligible;
			
			//If screening everyone, use the total screens / positive prscreens 
			if(isNotScreening == 1)
			{
				if(aodPrescreens > 0 && screens >= 0)
					screenCaptureRate = screens*1.0/(aodPrescreens);
			}
			else //If not screening everyone, use the screensOfPossible / possibleScreens
			{
				if(screensOfPossible > 0 && possibleScreens >= 0)
					screenCaptureRate = screensOfPossible*1.0/(possibleScreens);
			}
			
			if(positiveScreens > 0 && services >= 0)
				serviceCaptureRate = services*1.0/positiveScreens;
		}
		
		private function sumWithMissing(args:Array):int
		{
			var sum:int = 0;
			for(var i:int = 0; i< args.length; i++)
			{
				if(args[i] > 0)
					sum += args[i];
			}
			return sum;
		}
	}
}