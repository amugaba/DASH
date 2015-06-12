package feedback
{
	import valueObjects.CostReportVO;
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
		
		//Cost Stats
		public var hasCost:Boolean = false;
		public var prescreenTime:Number = 0;
		public var screenTime:Number = 0;
		public var educationTime:Number = 0;
		public var biTime:Number = 0;
		public var rtTime:Number = 0;
		public var adminTime:Number = 0;
		public var trainingTime:Number = 0;
		public var supportTime:Number = 0;
		public var otherTime:Number = 0;
		public var tech:Number = 0;
		public var supplies:Number = 0;
		public var otherCost:Number = 0;
		public var facilityCost:Number = 0;
		public var facilityPercent:Number = 0;
		public var salaries:Object;
		public var workloadPrescreen:Object;
		public var workloadScreen:Object;
		public var workloadEducation:Object;
		public var workloadBI:Object;
		public var workloadRT:Object;
		public var workloadAdmin:Object;
		public var workloadTraining:Object;
		public var workloadSupport:Object;
		public var workloadOther:Object;
		public var comments:String = "";
		
		//Calculated cost stats
		public var prescreenRate:Number = 0;
		public var screenRate:Number = 0;
		public var educationRate:Number = 0;
		public var interventionRate:Number = 0;
		public var referralRate:Number = 0;
		public var adminRate:Number = 0;
		public var trainingRate:Number = 0;
		public var supportRate:Number = 0;
		public var otherRate:Number = 0;
		
		public var prescreenTotal:Number = 0;
		public var screenTotal:Number = 0;
		public var educationTotal:Number = 0;
		public var biTotal:Number = 0;
		public var rtTotal:Number = 0;
		public var adminTotal:Number = 0;
		public var trainingTotal:Number = 0;
		public var supportTotal:Number = 0;
		public var otherTotal:Number = 0;
		public var serviceTotal:Number = 0;
		public var nonserviceTotal:Number = 0;
		public var expenseTotal:Number = 0;
		public var grandTotal:Number = 0;
		public var perPatientCost:Number = 0;
		

		public function DataReportDetailed(dataReport:DataReportVO, costReport:CostReportVO)
		{
			month = dataReport.month;
			year = dataReport.year;
			uniquePatients = dataReport.uniquePatients;
			patientsEligible = dataReport.patientsEligible;
			prescreens = dataReport.prescreens;
			validPrescreens = dataReport.validPrescreens;
			alcoholPrescreens = dataReport.alcoholPrescreens;
			drugPrescreens = dataReport.drugPrescreens;
			bothPrescreens = dataReport.bothPrescreens;
			screens = dataReport.screens;
			isNotScreening = dataReport.isNotScreening;
			possibleScreens = dataReport.possibleScreens;
			screensOfPossible = dataReport.screensOfPossible;
			educationScores = dataReport.educationScores;
			biScores = dataReport.biScores;
			btScores = dataReport.btScores;
			rtScores = dataReport.rtScores;
			bis = dataReport.bis;
			bts = dataReport.bts;
			rts = dataReport.rts;
			otherComments = dataReport.otherComments;
			
			generateStats();
			
			if(costReport != null)
			{
				hasCost = true;
				prescreenTime = costReport.prescreenTime;
				screenTime = costReport.screenTime;
				educationTime = costReport.educationTime;
				biTime = costReport.biTime;
				rtTime = costReport.rtTime;
				adminTime = costReport.adminTime;
				trainingTime = costReport.trainingTime;
				supportTime = costReport.supportTime;
				otherTime = costReport.otherTime;
				tech = costReport.tech;
				supplies = costReport.supplies;
				otherCost = costReport.otherCost;
				facilityCost = costReport.facilityCost;
				facilityPercent = costReport.facilityPercent;
				comments = costReport.comments;
				salaries = costReport.salaries;
				workloadPrescreen = costReport.workloadPrescreen;
				workloadScreen = costReport.workloadScreen;
				workloadEducation = costReport.workloadEducation;
				workloadBI = costReport.workloadBI;
				workloadRT = costReport.workloadRT;
				workloadAdmin = costReport.workloadAdmin;
				workloadTraining = costReport.workloadTraining;
				workloadSupport = costReport.workloadSupport;
				workloadOther = costReport.workloadOther;
				
				generateCostStats();
			}
		}
		
		//Generate advanced statistics
		private function generateCostStats():void
		{
			//calculate total time
			var prescreenTimeCalc:Number = prescreens * prescreenTime;
			var screenTimeCalc:Number = screens * screenTime;
			var educationTimeCalc:Number = educationScores * educationTime;
			var interventionTimeCalc:Number = (bis + bts) * biTime;
			var referralTimeCalc:Number = rts * rtTime;
			
			prescreenRate = getSalaryPerMinute(workloadPrescreen);
			screenRate = getSalaryPerMinute(workloadScreen);
			educationRate = getSalaryPerMinute(workloadEducation);
			interventionRate = getSalaryPerMinute(workloadBI);
			referralRate = getSalaryPerMinute(workloadRT);
			
			//calculate total cost
			prescreenTotal = prescreenRate * prescreenTimeCalc;
			screenTotal = screenRate * screenTimeCalc;
			educationTotal = educationRate * educationTimeCalc;
			biTotal = interventionRate * interventionTimeCalc;
			rtTotal = referralRate * referralTimeCalc;
			
			//sum costs
			serviceTotal = prescreenTotal + screenTotal + educationTotal + biTotal + rtTotal;
			
			//Non-service activities			
			//caculate rate from salary and workload
			adminRate = getSalaryPerMinute(workloadAdmin) * 60;
			trainingRate = getSalaryPerMinute(workloadTraining) * 60;
			supportRate = getSalaryPerMinute(workloadSupport) * 60;
			otherRate = getSalaryPerMinute(workloadOther) * 60;
			
			//calculate total cost
			adminTotal = adminRate * adminTime;
			trainingTotal = trainingRate * trainingTime;
			supportTotal = supportRate * supportTime;
			otherTotal = otherRate * otherTime;
			
			//sum costs
			nonserviceTotal = adminTotal + trainingTotal + supportTotal + otherTotal;
			
			//Expenses cost
			expenseTotal = tech + supplies + otherCost + facilityCost * facilityPercent/100.0;
			
			grandTotal = serviceTotal + nonserviceTotal + expenseTotal;
			perPatientCost = grandTotal / prescreens;
		}
		
		protected function getSalaryPerMinute(keypairs:Object):Number
		{
			var yearlySalary:Number = 0;
			for(var position:String in keypairs)
			{
				var percent:Number = keypairs[position];
				yearlySalary += (salaries[position] as Number) * percent/100.0;
			}
			
			var minPerYear:Number = 240*8*60;//assuming four weeks off (240 days worked), 8 hours per day
			return yearlySalary / minPerYear;
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
			if(isNotScreening == 0)
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