package feedback
{
	import mx.collections.ArrayCollection;
	import mx.core.FlexGlobals;
	
	import spark.collections.Sort;
	import spark.collections.SortField;
	
	import valueObjects.CostReportVO;
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
		
		private var totalPatientsEligible:int = 0;
		private var totalValidPrescreens:int = 0;
		private var totalPrescreens:int = 0;
		private var totalAODPrescreens:int = 0;
		private var totalScreens:int = 0;
		private var totalPositiveScreens:int = 0;
		private var totalBIs:int = 0;
		private var totalBTs:int = 0;
		private var totalRTs:int = 0;
		private var totalServices:int = 0;
		
		private var firstReportWithCost:DataReportDetailed = null;
		private var totalCost:Number = 0;
		private var prescreensWithCost:int = 0;
		private var servicesWithCost:int = 0;
		private var avgPrescreenCost:Number;
		private var avgServiceCost:Number;
		
		public var summaryText:String;
		public var summaryHowTo:String;
		public var summaryServicesText:String;
		public var summaryCostsText:String;
		public var prescreenCaptureText:String;
		public var prescreenDistributionText:String;
		public var screenCaptureText:String;
		public var screenDistributionText:String;
		public var serviceCaptureText:String;
		public var serviceDistributionText:String;
		//public var commentsText:String;
		
		private var global:SBIRTDashFlex = FlexGlobals.topLevelApplication as SBIRTDashFlex;
		
		public function ReportWriter(currentReport:DataReportVO, dataReports:ArrayCollection, costReports:ArrayCollection, userTemp:UserVO)
		{
			activeReport = new DataReportDetailed(currentReport, findLinkedCostReport(currentReport,costReports));
			user = userTemp;
			reportPeriodLabel = monthValues.getItemAt(activeReport.month-1) + " " + activeReport.year;
			
			//use the main list to create a secondary list containing only reports prior to the current one
			for each(var rep:DataReportVO in dataReports)
			{
				if(rep.year < activeReport.year)
					reports.addItem(new DataReportDetailed(rep, findLinkedCostReport(rep,costReports)));
				else if(rep.year == activeReport.year && rep.month <= activeReport.month)
					reports.addItem(new DataReportDetailed(rep, findLinkedCostReport(rep,costReports)));
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
				
				//Sum services
				totalPrescreens += reportTemp.prescreens;
				totalScreens += reportTemp.screens;
				totalBIs += reportTemp.bis;
				totalBTs += reportTemp.bts;
				totalRTs += reportTemp.rts;
				totalValidPrescreens += reportTemp.validPrescreens;
				totalPatientsEligible += reportTemp.patientsEligible;
				totalAODPrescreens += reportTemp.aodPrescreens;
				totalPositiveScreens += reportTemp.positiveScreens;
				totalServices += reportTemp.services;
				
				//Sum costs
				if(reportTemp.hasCost)
				{
					if(firstReportWithCost == null)
						firstReportWithCost = reportTemp;
					totalCost += reportTemp.grandTotal;
					//sum services with costs attached here
					prescreensWithCost += reportTemp.prescreens;
					servicesWithCost += reportTemp.services;
				}
			}
			
			avgPrescreenCaptureRate = totalValidPrescreens*1.0/totalPatientsEligible;
			avgScreenCaptureRate = totalScreens*1.0/totalAODPrescreens;
			avgServiceCaptureRate = totalServices*1.0/totalPositiveScreens;
			avgPrescreenCost = totalCost / prescreensWithCost;
			avgServiceCost = totalCost / servicesWithCost;
			
			generateNarrative();
		}
		
		protected function findLinkedCostReport(dataReport:DataReportVO, costReports:ArrayCollection):CostReportVO
		{
			for each(var rep:CostReportVO in costReports)
			{
				if(rep.dataReportID == dataReport.autoid)
					return rep;
			}
			return null;
		}
		
		protected function generateNarrative():void
		{
			//Summary text
			summaryText = "The SBIRT Report of Activities is an overview of what your SBIRT implementation has achieved and how well it is currently functioning. " +
				"You can use this report to identify which aspects of your process are going well and which ones need to be re-examined and improved. Click the Export to " +
				"PDF button to generate a PDF document that you can share with your staff to solicit their input.";
			
			summaryHowTo = "<b>How to Use Each Report Page:</b><br /><br />" +
				"<b>1. Summary</b> - View aggregate screening, service, and cost statistics for all months combined. Check your overall capture rates to see if you are achieving your goals. Review the cost data to see if your current cost per patient is sustainable, or if you need to plan to reduce costs or seek reimbursement.<br />" +
				"<b>2 to 4. Prescreening, Screening, and Services</b> - View the activities performed this month. The line graph tracks capture rate over time. You can check whether your capture rate is improving or worsening. The pie graph shows the distribution of results of the activity, such as what percentage of patients screened positive vs. negative. Use this to check whether your screening rates are normal or anomalous.<br />" +
				"<b>5. Concerns</b> - Based on your data, the SBIRT Dash system will automatically identify possible problems in your process. Review these concerns and determine whether they are significant and need to be addressed. This page will not be included in the exported PDF document.";
			
			var firstReport:DataReportDetailed = reports.getItemAt(0) as DataReportDetailed;
			var firstDate:String = global.monthList.getItemAt(firstReport.month-1) + " " + firstReport.year;
			summaryServicesText = "SBIRT data was first reported on <b>" + firstDate + "</b>.<br />Since that time, our clinic has provided the following total number of services:<br /><br />" +
				" <b>" + totalPrescreens + "</b> Prescreens<br />" +
				" <b>" + totalScreens + "</b> Full Screens<br />" +
				" <b>" + totalBIs + "</b> Brief Interventions<br />" +
				" <b>" + totalBTs + "</b> Brief Treatments<br />" +
				" <b>" + totalRTs + "</b> Referrals to Treatment<br /><br />" +
				"The <b>aggregate capture rates</b> for our clinic are shown below.<br />[<b>Capture Rate</b> = " +
				"patients who received an activity / total patients who should have received it]<br /><br />" +
				" <b>" + percentLabel(avgPrescreenCaptureRate) + "</b> Prescreen Capture Rate<br />" +
				" <b>" + percentLabel(avgScreenCaptureRate) + "</b> Full Screen Capture Rate<br />" +
				" <b>" + percentLabel(avgServiceCaptureRate) + "</b> Service Capture Rate (where 'Service' means brief intervention, brief treatment, or referral to treatment)";
			
			if(firstReportWithCost == null)
				summaryCostsText = "Cost data has not yet been reported. Enter cost data and then run this report again to view aggregate cost data.";
			else
			{
				var firstCostDate:String = global.monthList.getItemAt(firstReportWithCost.month-1) + " " + firstReportWithCost.year;
				
				summaryCostsText = "Cost data was first reported on <b>" + firstCostDate + "</b>.<br />" +
					"Since that time, the total cost of implementing and operating SBIRT has been <b>$" + roundCost(totalCost) + "</b>.<br /><br />" +
					"Dividing the total cost by the number of prescreens or services provided gives our average cost per action.<br />" +
					"[<b>NOTE</b>: To keep these values accurate, if there are months for which you submitted a data report but not a cost report, those data reports without an associated cost report will not be included in this calculation.<br /><br />" +
					" The average cost per prescreen is <b>$" + roundCost(avgPrescreenCost) + "</b><br />" +
					" The average cost per service is <b>$" + roundCost(avgServiceCost) + "</b><br />";
			}
			
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
		
		protected function roundCost(val:Number):String
		{
			return (Math.round(val*100)/100).toString();
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