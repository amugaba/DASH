package feedback
{
	import mx.collections.ArrayCollection;
	
	import spark.collections.Sort;
	import spark.collections.SortField;
	
	import valueObjects.DataReportVO;
	import valueObjects.UserVO;

	public class ReportWriter
	{
		public var activeReport:DataReportDetailed;
		public var user:UserVO;
		public var reports:ArrayCollection = new ArrayCollection([]);
		public var reportPeriodLabel:String;
		
		private var monthValues:ArrayCollection = new ArrayCollection(["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]);
		
		private var avgPrescreenCaptureRate:Number;
		private var avgScreenCaptureRate:Number;
		private var avgServiceCaptureRate:Number;
		
		public var prescreenCaptureText:String;
		public var prescreenDistributionText:String;
		public var screenCaptureText:String;
		public var screenDistributionText:String;
		public var serviceCaptureText:String;
		public var serviceDistributionText:String;
		//public var commentsText:String;
		
		public function ReportWriter(report:DataReportVO, reportsAll:ArrayCollection, userTemp:UserVO)
		{
			activeReport = new DataReportDetailed(report);
			user = userTemp;
			reportPeriodLabel = monthValues.getItemAt(activeReport.month-1) + " " + activeReport.year;
			
			//use the main list to create a secondary list containing only reports prior to the current one
			for each(var rep:DataReportVO in reportsAll)
			{
				if(rep.year < activeReport.year)
					reports.addItem(new DataReportDetailed(rep));
				else if(rep.year == activeReport.year && rep.month <= activeReport.month)
					reports.addItem(new DataReportDetailed(rep));
			}
			
			var dataSortYear:SortField = new SortField();
			dataSortYear.name = "year";
			dataSortYear.numeric = true;
			var dataSortMonth:SortField = new SortField();
			dataSortMonth.name = "month";
			dataSortMonth.numeric = true;
			
			//Sort reports by date, oldest to newest
			var numericDataSort:Sort = new Sort();
			numericDataSort.fields = [dataSortYear,dataSortMonth];
			reports.sort = numericDataSort;
			reports.refresh();
			
			//compute group statistics
			avgPrescreenCaptureRate = 0.0;
			avgScreenCaptureRate = 0.0;
			avgServiceCaptureRate = 0.0;
			
			for each(var reportTemp:DataReportDetailed in reports)
			{
				//combine the year with the month to get an int value to plot on a chart
				reportTemp.monthYear = (reportTemp.year - activeReport.year)*12 + reportTemp.month;
				
				//Average the capture rates
				avgPrescreenCaptureRate += reportTemp.prescreenCaptureRate;
				avgScreenCaptureRate += reportTemp.screenCaptureRate;
				avgServiceCaptureRate += reportTemp.serviceCaptureRate;
			}
			avgPrescreenCaptureRate /= reports.length;
			avgScreenCaptureRate /= reports.length;
			avgServiceCaptureRate /= reports.length;
			
			generateNarrative();
		}
		
		protected function generateNarrative():void
		{
			//Higher than average strings
			var prescreenCaptureHigherAverage:String = activeReport.prescreenCaptureRate > avgPrescreenCaptureRate ? "higher" : "lower";
			var screenCaptureHigherAverage:String = activeReport.screenCaptureRate > avgScreenCaptureRate ? "higher" : "lower";
			var serviceCaptureHigherAverage:String = activeReport.serviceCaptureRate > avgServiceCaptureRate ? "higher" : "lower";
			
			//If there is a last month, generate higher than strings
			var hasLastMonth:Boolean = false;
			if(reports.length > 1)
			{
				hasLastMonth = true;
				var reportLastMonth:DataReportDetailed = reports[reports.length-2] as DataReportDetailed;
				
				var captureHigherLastMonth:String = activeReport.prescreenCaptureRate > reportLastMonth.prescreenCaptureRate ? "higher" : "lower";
				var screenHigherLastMonth:String = activeReport.screenCaptureRate > reportLastMonth.screenCaptureRate ? "higher" : "lower";
				var servicesHigherLastMonth:String = activeReport.serviceCaptureRate > reportLastMonth.serviceCaptureRate ? "higher" : "lower";
			}
			
			//Prescreening Text
			prescreenCaptureText = "During this report period, <b>" + parseMissing(activeReport.patientsEligible) + "</b> patients had not received SBIRT services during the " +
				"last year and so were due to be prescreened. We prescreened <b>" + parseMissing(activeReport.validPrescreens) + "</b> of those patients, for a prescreen capture" +
				" rate of <b>" + percentLabel(activeReport.prescreenCaptureRate) + "</b>. ";
			
			if(hasLastMonth)
			{
				prescreenCaptureText += "The prescreen capture rate for this period is <b>" + captureHigherLastMonth + "</b> than last month's rate and  <b>" + 
					prescreenCaptureHigherAverage + "</b> " + "than our site's average capture rate of <b>" + percentLabel(avgPrescreenCaptureRate) + "</b>.";
			}
			else
				prescreenCaptureText += "Only one month of data has been collected so far. When two or more months have been collected, comparison data will be generated.";
			
			prescreenDistributionText = "We performed a total of <b>" + parseMissing(activeReport.prescreens) + "</b> prescreens. (This includes <b>" + parseMissing(activeReport.invalidPrescreens) + 
				"</b> prescreens that were conducted with patients who were not yet due for their annual screening.)<br /><br />The number of patients in each prescreen category were:<br />" +
				"     <b>" + parseMissing(activeReport.alcoholPrescreens) + "</b> positive for alcohol but negative for drugs<br />" +
				"     <b>" + parseMissing(activeReport.drugPrescreens) + "</b> positive for drugs but negative for alcohol<br />" +
				"     <b>" + parseMissing(activeReport.bothPrescreens) + "</b> positive for both alcohol and drugs<br />" +
				"     <b>" + parseMissing(activeReport.negativePrescreens) + "</b> negative for both alcohol and drugs" +
				"<br /><br />The overall positive prescreening rate was <b>" + percentLabel(activeReport.positivePrescreenRate) + "</b>.";
			
			//Screening Text
			screenCaptureText = "In total, <b>" + parseMissing(activeReport.aodPrescreens) + "</b> patients prescreened positive and were therefore eligible to receive a full screening. We " +
				"screened <b>" + parseMissing(activeReport.screens) + "</b> of those patients, for a screening capture rate of <b>" + percentLabel(activeReport.screenCaptureRate) + "</b>.";
			
			if(hasLastMonth)
			{
				screenCaptureText += "The screening capture rate was <b>" + screenHigherLastMonth + "</b> than last month and <b>" + screenCaptureHigherAverage + 
					"</b> than our average screening rate of <b>" + percentLabel(avgScreenCaptureRate) + "</b>.";
			}
			else
				screenCaptureText += "Only one month of data has been collected so far. When two or more months have been collected, comparison data will be generated.";
			
			screenDistributionText = "We performed a total of <b>" + parseMissing(activeReport.screens) + "</b> screenings.<br /><br />" +
				"The numbers of patients in each screening category were:<br />" +
				"     <b>" + parseMissing(activeReport.educationScores) + "</b> scored 'Education'<br />" +
				"     <b>" + parseMissing(activeReport.biScores) + "</b> scored 'Brief Intervention'<br />" +
				"     <b>" + parseMissing(activeReport.btScores) + "</b> scored 'Brief Treatment'<br />" +
				"     <b>" + parseMissing(activeReport.rtScores) + "</b> scored 'Referral to Treatment'<br /><br />" +
				"The overall positive screening rate was <b>" + percentLabel(activeReport.positiveScreenRate) + "</b>.";
			
			//Service Text
			serviceCaptureText = "In total, <b>" + parseMissing(activeReport.positiveScreens) + "</b> patients screened positive and were therefore indicated to receive an SBIRT service. We provided " +
				"services to <b>" + parseMissing(activeReport.services) + "</b> of those patients, for a services capture rate of <b>" + percentLabel(activeReport.serviceCaptureRate) + "</b>.";
			
			if(hasLastMonth)
			{
				serviceCaptureText += "The services capture rate was <b>" + servicesHigherLastMonth + "</b> than last month and <b>" + serviceCaptureHigherAverage + 
					"</b> than our average services capture rate of <b>" + percentLabel(avgServiceCaptureRate) + "</b>.";
			}
			else
				serviceCaptureText += "Only one month of data has been collected so far. When two or more months have been collected, comparison data will be generated.";
			
			serviceDistributionText = "We performed a total of <b>" + parseMissing(activeReport.services) + "</b> SBIRT services. (This number may be higher than the number of " +
				"positive screenings, because an SBIRT provider can opt to provide a service based on clinical judgment.)<br /><br />" +
				"The numbers of patients who received each type of service were:<br />" +
				"     <b>" + parseMissing(activeReport.bis) + "</b> received a Brief Intervention<br />" +
				"     <b>" + parseMissing(activeReport.bts) + "</b> received a Brief Treatment<br />" +
				"     <b>" + parseMissing(activeReport.rts) + "</b> received a Referral to Treatment";
			
			//Do free response page
			//commentsText = activeReport.otherComments;
		}
		
		private function parseMissing(val:int):String
		{
			if(val < 0)
				return "unknown";
			else
				return val.toString();
		}
		
		private function percentLabel(value:Number):String
		{
			if(value < 0)
				return "unknown";
			return (value*100).toFixed(1) + "%";
		}
	}
}